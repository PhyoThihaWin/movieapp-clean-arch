import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp_clean_arch/generated/locale_keys.g.dart';
import 'package:movieapp_clean_arch/page/home/home_page_provider.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../base/view_state.dart';
import '../../domain/models/actor_vo.dart';
import '../../domain/models/movie_vo.dart';
import '../../flavors.dart';
import '../../theme/resource/colors.dart';
import '../../theme/resource/dimens.dart';
import '../../widget/favorite_icon_view.dart';
import '../../widget/horizontal_list_view.dart';
import '../../widget/horizontal_singlechild_list_view.dart';
import '../../widget/my_cached_network_image.dart';
import '../../widget/search_box_view.dart';
import '../movielist/movie_type.dart';
import '../nav_host/nav_host_helper.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({super.key});

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    ref.read(fetchHomeMoviesUsecaseProvider)();
  }

  void onRefresh() async {
    await ref.watch(fetchHomeMoviesUsecaseProvider)();
    widget.refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SmartRefresher(
        controller: widget.refreshController,
        header: const WaterDropHeader(),
        onRefresh: onRefresh,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 20.0 + kToolbarHeight,
              backgroundColor: Theme.of(context).colorScheme.surface,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.MARGIN_MEDIUM_2,
                    right: Dimens.MARGIN_MEDIUM_2,
                    top: Dimens.MARGIN_MEDIUM),
                child: WelcomeAndNotificationIconSection(),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.MARGIN_MEDIUM_2),
                    child: Column(children: [
                      InkWell(
                          onTap: () async {
                            context.navigate(NavHostHelper.searchPath);
                          },
                          child: const SearchBoxView(enable: false)),
                      SectionTitleAndSeeAll(
                        LocaleKeys.txtNowPlaying.tr(),
                        onClick: () {
                          context.navigate(
                              "${NavHostHelper.listingPath}/${MovieType.nowPlaying.name}");
                        },
                      ),
                      const SizedBox(height: Dimens.MARGIN_20),
                    ]),
                  ),

                  // Now playing
                  StateRender(
                    refValue: ref.watch(nowPlayingMoviesProvider),
                    loading: Skeletonizer(
                      enabled: true,
                      child: CarouselSliderViewSection(
                        list: MovieVo.fakeMovieList,
                        position: ref.watch(homeCarouselIndexProvider),
                        onPageChanged: (index) {},
                        onFavorite: (id) => {},
                      ),
                    ),
                    success: (data) {
                      return data.isEmpty
                          ? Skeletonizer(
                              enabled: true,
                              child: CarouselSliderViewSection(
                                list: MovieVo.fakeMovieList,
                                position: ref.watch(homeCarouselIndexProvider),
                                onPageChanged: (index) {},
                                onFavorite: (id) => {},
                              ),
                            )
                          : CarouselSliderViewSection(
                              list: data.take(8).toList(),
                              position: ref.watch(homeCarouselIndexProvider),
                              onPageChanged: (index) => ref
                                  .watch(homeCarouselIndexProvider.notifier)
                                  .updateIndex(index),
                              onFavorite: (id) =>
                                  ref.watch(favoriteMovieUseCaseProvider)(id),
                            );
                    },
                    error: (message) => Container(),
                  ),
                  const SizedBox(height: Dimens.MARGIN_LARGE),

                  // Upcoming
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll(LocaleKeys.txtComingSoon.tr(),
                        onClick: () {
                      context.navigate(
                          "${NavHostHelper.listingPath}/${MovieType.upComing.name}");
                    }),
                  ),
                  const SizedBox(height: Dimens.MARGIN_MEDIUM_2),

                  StateRender(
                      refValue: ref.watch(upComingMoviesProvider),
                      loading: Skeletonizer(
                        enabled: true,
                        child: HorizontalListView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.MARGIN_MEDIUM_2,
                          ),
                          height: 350,
                          itemCount: 10,
                          itemBuilder: (context, index) =>
                              HomeMovieListItemView(
                            movie: MovieVo.fakeMovieList[index],
                            onFavorite: (id) {},
                          ),
                        ),
                      ),
                      success: (data) => HorizontalListView(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimens.MARGIN_MEDIUM_2,
                            ),
                            height: 350,
                            itemCount: data.length,
                            itemBuilder: (context, index) =>
                                HomeMovieListItemView(
                              movie: data[index],
                              onFavorite: (id) {
                                ref.watch(favoriteMovieUseCaseProvider)(id);
                              },
                            ),
                          ),
                      error: (message) => Container()),

                  const SizedBox(height: Dimens.MARGIN_LARGE),

                  // popular
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll(
                      LocaleKeys.txtPromoDiscount.tr(),
                      onClick: () {
                        context.navigate(
                            "${NavHostHelper.listingPath}/${MovieType.popular.name}");
                      },
                    ),
                  ),
                  const SizedBox(height: Dimens.MARGIN_MEDIUM_2),

                  StateRender(
                    refValue: ref.watch(popularMoviesProvider),
                    loading: const CircularProgressIndicator(),
                    success: (data) => SizedBox(
                      height: 180,
                      child: PromoPageViewSection(
                        movies: data,
                        onFavorite: (id) {
                          ref.watch(favoriteMovieUseCaseProvider)(id);
                        },
                      ),
                    ),
                    error: (message) => Container(),
                  ),

                  const SizedBox(height: Dimens.MARGIN_LARGE),

                  // celebrities
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll(
                      LocaleKeys.txtCelebrities.tr(),
                      onClick: () {},
                    ),
                  ),
                  const SizedBox(height: Dimens.MARGIN_MEDIUM_2),

                  StateRender(
                    refValue: ref.watch(popularPersonsProvider),
                    loading: const CircularProgressIndicator(),
                    success: (data) => HorizontalSingleChildListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.MARGIN_MEDIUM_2),
                      itemCount: data.take(12).length,
                      itemBuilder: (context, index) =>
                          ServiceListItemView(data[index]),
                    ),
                    error: (message) => Container(),
                  ),
                  const SizedBox(height: Dimens.MARGIN_LARGE),

                  // movie news
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll(
                      LocaleKeys.txtMovieNews.tr(),
                      onClick: () {},
                    ),
                  ),
                  const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
                  StateRender(
                      refValue: ref.watch(nowPlayingMoviesProvider),
                      loading: const CircularProgressIndicator(),
                      success: (data) => HorizontalListView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.MARGIN_MEDIUM_2),
                            height: 240,
                            itemCount: data.length,
                            itemBuilder: (context, index) =>
                                MoviesNewsItemView(data[index]),
                          ),
                      error: (message) => Container()),
                ],
              )
            ]))
          ],
        ),
      ),
    );
  }
}

class PromoPageViewSection extends StatelessWidget {
  final List<MovieVo> movies;
  final Function(int id) onFavorite;

  const PromoPageViewSection(
      {super.key, required this.movies, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.MARGIN_MEDIUM),
          child: Stack(
            children: [
              Positioned.fill(
                child: MyCachedNetworkImage(
                  imageUrl: movies[index].backdropPath,
                  height: 180,
                  width: double.maxFinite,
                ),
              ),
              Positioned(
                top: Dimens.MARGIN_MEDIUM,
                right: Dimens.MARGIN_MEDIUM,
                child: FavoriteIconView(
                  isFavorite: movies[index].isFavorite,
                  onTap: () {
                    onFavorite(movies[index].id);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MoviesNewsItemView extends StatelessWidget {
  final MovieVo movieVo;

  const MoviesNewsItemView(this.movieVo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(right: Dimens.MARGIN_MEDIUM_2),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.MARGIN_MEDIUM),
            child: MyCachedNetworkImage(
              imageUrl: movieVo.backdropPath,
              width: double.maxFinite,
              height: 150,
            ),
          ),
          const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
          Text(
            movieVo.title,
            style: const TextStyle(
                fontSize: Dimens.TEXT_REGULAR_2, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ServiceListItemView extends StatelessWidget {
  final ActorVo actor;

  const ServiceListItemView(this.actor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: Dimens.MARGIN_MEDIUM),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: MyCachedNetworkImage(
              imageUrl: actor.profilePath,
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: Dimens.TEXT_REGULAR_2, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class HomeMovieListItemView extends StatelessWidget {
  final MovieVo movie;
  final Function(int id) onFavorite;

  const HomeMovieListItemView(
      {super.key, required this.movie, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigate("${NavHostHelper.detailPath}/${movie.id}");
      },
      child: Container(
        width: 200,
        padding: const EdgeInsets.only(right: Dimens.MARGIN_MEDIUM_2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.MARGIN_MEDIUM),
                  child: MyCachedNetworkImage(
                    imageUrl: movie.posterPath,
                    width: 200,
                    height: 230,
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
            const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
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
      ),
    );
  }
}

class SectionTitleAndSeeAll extends StatelessWidget {
  final String title;
  final Function() onClick;

  const SectionTitleAndSeeAll(this.title, {super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: SectionTitleText(title)),
        InkWell(
            onTap: onClick,
            customBorder: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.MARGIN_MEDIUM))),
            child: const SeeAllText()),
      ],
    );
  }
}

class SeeAllText extends StatelessWidget {
  const SeeAllText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(Dimens.MARGIN_MEDIUM),
      child: Row(
        children: [
          Text(
            "See all",
            style: TextStyle(
              fontSize: Dimens.TEXT_REGULAR,
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w400,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: PRIMARY_COLOR,
          )
        ],
      ),
    );
  }
}

class WelcomeAndNotificationIconSection extends StatelessWidget {
  WelcomeAndNotificationIconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.txtHiThree.tr(),
              style: const TextStyle(fontSize: 18),
            ),
            SectionTitleText("${LocaleKeys.txtWelcomeBack.tr()}, ${F.name}")
          ],
        ),
        const Icon(Icons.notifications_active)
      ],
    );
  }
}

class SectionTitleText extends StatelessWidget {
  final String text;
  final double fontSize;

  const SectionTitleText(this.text,
      {super.key, this.fontSize = Dimens.TEXT_XLARGE});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class CarouselSliderViewSection extends StatelessWidget {
  final List<MovieVo> list;
  final int position;
  final Function(int position) onPageChanged;
  final Function(int id) onFavorite;

  const CarouselSliderViewSection(
      {super.key,
      required this.list,
      required this.position,
      required this.onPageChanged,
      required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: context.getScreenHeightBy(3.0),
            viewportFraction: 0.6,
            initialPage: 0,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              onPageChanged(index);
            },
          ),
          items: list
              .map(
                (item) => GestureDetector(
                  onTap: () {
                    context.navigate("${NavHostHelper.detailPath}/${item.id}");
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimens.MARGIN_12),
                        child: MyCachedNetworkImage(
                          imageUrl: item.posterPath,
                          height: context.getScreenHeightBy(3.0),
                          width: double.maxFinite,
                        ),
                      ),
                      Positioned(
                          top: Dimens.MARGIN_MEDIUM,
                          right: Dimens.MARGIN_MEDIUM,
                          child: FavoriteIconView(
                            isFavorite: item.isFavorite,
                            onTap: () {
                              onFavorite(item.id);
                            },
                          ))
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
          child: SectionTitleText(list[position].title),
        ),
        const Text(
          "2h29m • Action, adventure, sci-fi",
        ),
        const SizedBox(height: Dimens.MARGIN_MEDIUM),
        DotsIndicatorView(dotsCount: list.length, position: position.toDouble())
      ],
    );
  }
}

class DotsIndicatorView extends StatelessWidget {
  final double position;
  final int dotsCount;

  const DotsIndicatorView(
      {super.key, required this.position, required this.dotsCount});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: const DotsDecorator(
          color: TEXT_GREY_COLOR,
          activeColor: PRIMARY_COLOR,
          size: Size(Dimens.MARGIN_6, Dimens.MARGIN_6),
          activeSize: Size(Dimens.MARGIN_MEDIUM, Dimens.MARGIN_MEDIUM)),
    );
  }
}
