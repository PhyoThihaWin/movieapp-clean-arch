import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/page/movie/movie_page_provider.dart';
import 'package:movieapp_clean_arch/resource/colors.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';

import '../../domain/models/movie_vo.dart';
import '../../generated/locale_keys.g.dart';
import '../../resource/dimens.dart';
import '../movielist/movie_listing_page.dart';

class MoviePage extends ConsumerStatefulWidget {
  MoviePage({super.key});

  // paging controller
  final PagingController<int, MovieVo> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 15);

  @override
  ConsumerState<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends ConsumerState<MoviePage> {
  @override
  void initState() {
    super.initState();
    widget.pagingController.addPageRequestListener((pageKey) {
      ref.watch(pagingMoviesProvider.notifier).fetchPage(
            pageKey + 1,
            widget.pagingController,
          );
    });
  }

  @override
  void dispose() {
    widget.pagingController.dispose();
    debugPrint("ListPage Controller disposed");
    super.dispose();
  }

  saveFavoriteMovie(int id) {
    ref.read(favoriteMovieUseCaseProvider)(id);
    widget.pagingController.itemList = widget.pagingController.itemList?.map(
      (e) {
        if (e.id == id) {
          var item = e;
          item.isFavorite = !e.isFavorite;
          return item;
        } else {
          return e;
        }
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
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
                  title: MovieTabarView(
                    onTap: (index) {
                      // moviePageController.changeTab(index);
                      ref
                          .watch(pagingMoviesProvider.notifier)
                          .changeTab(index, widget.pagingController);
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
                animateTransitions: true,
                itemBuilder: (context, item, index) => MovieGridItemView(
                  movie: item,
                  onFavorite: (movieId) {
                    saveFavoriteMovie(movieId);
                  },
                ),
              )),
        ),
      ),
    );
  }
}

class MovieTabarView extends StatelessWidget {
  final Function(int) onTap;

  const MovieTabarView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(Dimens.MARGIN_SMALL),
      decoration: BoxDecoration(
        color: context.getColorScheme().surfaceContainerHighest,
        borderRadius: BorderRadius.circular(
          25.0,
        ),
      ),
      child: DefaultTabController(
        length: 2,
        child: TabBar(
          onTap: onTap,
          dividerHeight: 0,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            color: PRIMARY_COLOR,
          ),
          labelColor: Colors.black,
          unselectedLabelColor: context.getColorScheme().onSurfaceVariant,
          tabs: [
            Tab(text: LocaleKeys.tabNowPlaying.tr()),
            Tab(text: LocaleKeys.tabComingSoon.tr()),
          ],
        ),
      ),
    );
  }
}
