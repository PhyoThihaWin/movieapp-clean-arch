import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/page/movielist/movie_listing_page_controller.dart';
import 'package:movieapp_clean_arch/page/nav_host/nav_host_helper.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';
import 'package:movieapp_clean_arch/widget/my_cached_network_image.dart';

import '../../resource/colors.dart';
import '../home/home_page.dart';

enum MovieType { nowPlaying, upComing, popular }

class MovieListingPage extends StatefulWidget {
  final String movieType;
  MovieListingPage(this.movieType, {super.key});

  final MovieListingPageController movieListingPageController = Get.find();

  @override
  State<MovieListingPage> createState() => _MovieListingPageState();
}

class _MovieListingPageState extends State<MovieListingPage> {
  @override
  void initState() {
    super.initState();
    var movieType =
        MovieType.values.find((value) => value.name == widget.movieType) ??
            MovieType.nowPlaying;
    widget.movieListingPageController.fetchMovies(movieType);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const SectionTitleText(
            "Now Playing Movies",
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
          pagingController: widget.movieListingPageController.pagingController,
          showNewPageProgressIndicatorAsGridChild: false,
          builderDelegate: PagedChildBuilderDelegate<MovieVo>(
            itemBuilder: (context, item, index) => MovieGridItemView(item),
          ),
        ),
      ),
    );
  }
}

class MovieGridItemView extends StatelessWidget {
  final MovieVo movie;

  const MovieGridItemView(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("${NavHostHelper.detailPath}/${movie.id}");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.all(Radius.circular(Dimens.MARGIN_MEDIUM)),
            child: MyCachedNetworkImage(
              imageUrl: movie.posterPath,
              width: double.maxFinite,
              height: context.getScreenHeightBy(3.6),
            ),
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
