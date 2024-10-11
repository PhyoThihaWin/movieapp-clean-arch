import 'package:dart_extensions/dart_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/page/home/home_page_provider.dart';
import 'package:movieapp_clean_arch/page/movielist/movie_listing_page_provider.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';

import '../../domain/models/movie_vo.dart';
import '../../generated/locale_keys.g.dart';
import '../../theme/resource/colors.dart';
import '../../theme/resource/dimens.dart';
import '../../widget/favorite_icon_view.dart';
import '../../widget/my_cached_network_image.dart';
import '../home/home_page.dart';
import '../nav_host/nav_host_helper.dart';
import 'movie_type.dart';

class MovieListingPage extends ConsumerStatefulWidget {
  final String movieType;
  MovieListingPage(this.movieType, {super.key});

  // paging controller
  final PagingController<int, MovieVo> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 15);

  @override
  ConsumerState<MovieListingPage> createState() => _MovieListingPageState();
}

class _MovieListingPageState extends ConsumerState<MovieListingPage> {
  @override
  void initState() {
    super.initState();

    var movieType =
        MovieType.values.find((value) => value.name == widget.movieType) ??
            MovieType.nowPlaying;

    widget.pagingController.addPageRequestListener((pageKey) {
      ref.watch(listPagingMoviesProvider.notifier).fetchPage(
            pageKey + 1,
            movieType,
            widget.pagingController,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: SectionTitleText(
          widget.movieType == MovieType.nowPlaying.name
              ? LocaleKeys.txtNowPlaying.tr()
              : widget.movieType == MovieType.upComing.name
                  ? LocaleKeys.txtComingSoon.tr()
                  : LocaleKeys.txtPromoDiscount.tr(),
          fontSize: Dimens.TEXT_LARGE,
        ),
      ),
      body: PagedGridView<int, MovieVo>(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.MARGIN_MEDIUM_2,
            vertical: Dimens.MARGIN_MEDIUM_2),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: Dimens.MARGIN_MEDIUM_2,
          mainAxisExtent: context.getScreenHeightBy(2.4),
          crossAxisCount: 2,
        ),
        pagingController: widget.pagingController,
        showNewPageProgressIndicatorAsGridChild: false,
        builderDelegate: PagedChildBuilderDelegate<MovieVo>(
          itemBuilder: (context, item, index) => MovieGridItemView(
            movie: item,
            onFavorite: (movieId) {
              ref.read(favoriteMovieUseCaseProvider)(movieId);
            },
          ),
        ),
      ),
    );
  }
}

class MovieGridItemView extends StatelessWidget {
  final MovieVo movie;
  final Function(int movieId) onFavorite;

  const MovieGridItemView(
      {super.key, required this.movie, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("${NavHostHelper.detailPath}/${movie.id}");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(Dimens.MARGIN_MEDIUM)),
                child: MyCachedNetworkImage(
                  imageUrl: movie.posterPath,
                  width: double.maxFinite,
                  height: context.getScreenHeightBy(3.6),
                ),
              ),
              Positioned(
                  top: Dimens.MARGIN_MEDIUM,
                  right: Dimens.MARGIN_MEDIUM,
                  child: FavoriteIconView(
                    isFavorite: movie.isFavorite,
                    onTap: () {
                      onFavorite(movie.id);
                    },
                  ))
            ],
          ),
          const SizedBox(height: Dimens.MARGIN_MEDIUM),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: PRIMARY_COLOR,
                fontSize: Dimens.TEXT_REGULAR_2,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: Dimens.MARGIN_10),
          const Row(
            children: [
              Icon(
                Icons.videocam_outlined,
                size: Dimens.MARGIN_MEDIUM_2,
              ),
              SizedBox(width: Dimens.MARGIN_MEDIUM),
              Text(
                "Adventure, Sci-fi",
                style: TextStyle(fontSize: Dimens.TEXT_SMALL),
              ),
            ],
          ),
          const SizedBox(height: Dimens.MARGIN_SMALL),
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                size: Dimens.MARGIN_MEDIUM_2,
              ),
              const SizedBox(width: Dimens.MARGIN_MEDIUM),
              Text(
                movie.releaseDate,
                style: const TextStyle(fontSize: Dimens.TEXT_SMALL),
              ),
            ],
          )
        ],
      ),
    );
  }
}
