import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/generated/locale_keys.g.dart';
import 'package:movieapp_clean_arch/page/home/home_page_provider.dart';
import 'package:movieapp_clean_arch/page/nav_host/nav_host_helper.dart';
import 'package:movieapp_clean_arch/page/search/movie_search_page_provider.dart';

import 'package:movieapp_clean_arch/theme/resource/colors.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';
import 'package:movieapp_clean_arch/widget/search_box_view.dart';

import '../../domain/models/movie_vo.dart';
import '../../theme/resource/dimens.dart';
import '../home/home_page.dart';
import '../movielist/movie_listing_page.dart';

class MovieSearchPage extends ConsumerStatefulWidget {
  MovieSearchPage({super.key});

  // paging controller
  final PagingController<int, MovieVo> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 15);

  @override
  ConsumerState<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends ConsumerState<MovieSearchPage> {
  @override
  void initState() {
    super.initState();

    widget.pagingController.addPageRequestListener((pageKey) {
      ref.watch(searchPagingMoviesProvider.notifier).fetchPage(
            pageKey + 1,
            widget.pagingController,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => context.navigateBack(NavHostHelper.homePath),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: SectionTitleText(
          LocaleKeys.txtDiscover.tr(),
          fontSize: Dimens.TEXT_LARGE,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPadding(
              padding: const EdgeInsets.only(top: Dimens.MARGIN_MEDIUM),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                pinned: false,
                floating: true,
                title: SearchBoxView(
                  enable: true,
                  onChanged: (value) {
                    ref
                        .watch(searchQueryProvider.notifier)
                        .updateQuery(value, widget.pagingController);
                  },
                ),
              ),
            ),
          ];
        },
        body: PagedGridView<int, MovieVo>(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.MARGIN_MEDIUM_2,
              vertical: Dimens.MARGIN_LARGE),
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
                ref.watch(favoriteMovieUseCaseProvider)(movieId);
              },
            ),
            firstPageProgressIndicatorBuilder: (context) => const Center(
              child: CircularProgressIndicator(
                color: PRIMARY_COLOR, // Customize the color
              ),
            ),
            noItemsFoundIndicatorBuilder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.data_array,
                  size: Dimens.MARGIN_XXLARGE,
                ),
                const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
                Text(
                  LocaleKeys.txtNoMovie.tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
