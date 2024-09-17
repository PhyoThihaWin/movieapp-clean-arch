import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/base/view_state.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/page/home/home_page_controller.dart';
import 'package:movieapp_clean_arch/page/moviedetail/movie_detail_page.dart';
import 'package:movieapp_clean_arch/page/movielist/movie_listing_page.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';
import 'package:movieapp_clean_arch/widget/horizontal_list_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../domain/models/actor_vo.dart';
import '../../resource/colors.dart';
import '../../widget/favorite_icon_view.dart';
import '../../widget/horizontal_singlechild_list_view.dart';
import '../../widget/my_cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homeController = Get.find();

    RefreshController refreshController =
        RefreshController(initialRefresh: false);

    void onRefresh() async {
      await homeController.fetchHomeMovies();
      refreshController.refreshCompleted();
    }

    return SafeArea(
      child: SmartRefresher(
        controller: refreshController,
        header: const WaterDropHeader(),
        onRefresh: onRefresh,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              toolbarHeight: 20.0 + kToolbarHeight,
              backgroundColor: Colors.black,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(
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
                      const HomeSearchViewSection(),
                      SectionTitleAndSeeAll("Now Playing", onClick: () {
                        context.next(MovieListingPage());
                      }),
                      const SizedBox(height: Dimens.MARGIN_20),
                    ]),
                  ),

                  // Now playing
                  Obx(() => homeController.nowPlayingMovies.value.render(
                        loading: const CircularProgressIndicator(),
                        success: (data) => CarouselSliderViewSection(
                          list: data.take(8).toList(),
                          position: homeController.position,
                          onPageChanged: (index) =>
                              homeController.position.value = index,
                          onFavorite: (id) =>
                              homeController.saveFavoriteMovie(id),
                        ),
                        error: (message) => Container(),
                      )),
                  const SizedBox(height: Dimens.MARGIN_LARGE),

                  // Upcoming
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll("Coming soon", onClick: () {}),
                  ),
                  const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
                  Obx(() => homeController.upcomingMovies.value.render(
                      loading: const CircularProgressIndicator(),
                      success: (data) => HorizontalListView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.MARGIN_MEDIUM_2),
                            height: 350,
                            itemCount: data.length,
                            itemBuilder: (context, index) =>
                                HomeMovieListItemView(
                              movie: data[index],
                              onFavorite: (id) {
                                homeController.saveFavoriteMovie(id);
                              },
                            ),
                          ),
                      error: (message) => Container())),
                  const SizedBox(height: Dimens.MARGIN_LARGE),

                  // popular
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll(
                      "Promo & Discount",
                      onClick: () {},
                    ),
                  ),
                  const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
                  Obx(() => homeController.popularMovies.value.render(
                        loading: const CircularProgressIndicator(),
                        success: (data) => SizedBox(
                          height: 180,
                          child: PromoPageViewSection(
                            movies: data,
                            onFavorite: (id) {
                              homeController.saveFavoriteMovie(id);
                            },
                          ),
                        ),
                        error: (message) => Container(),
                      )),
                  const SizedBox(height: Dimens.MARGIN_LARGE),

                  // celebrities
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll(
                      "Celebrities",
                      onClick: () {},
                    ),
                  ),
                  const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
                  Obx(() => homeController.popularPerson.value.render(
                        loading: const CircularProgressIndicator(),
                        success: (data) => HorizontalSingleChildListView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimens.MARGIN_MEDIUM_2),
                          itemCount: data.take(12).length,
                          itemBuilder: (context, index) =>
                              ServiceListItemView(data[index]),
                        ),
                        error: (message) => Container(),
                      )),
                  const SizedBox(height: Dimens.MARGIN_LARGE),

                  // movie news
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll("Movie news", onClick: () {}),
                  ),
                  const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
                  Obx(() => homeController.nowPlayingMovies.value.render(
                      loading: const CircularProgressIndicator(),
                      success: (data) => HorizontalListView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimens.MARGIN_MEDIUM_2),
                            height: 240,
                            itemCount: data.length,
                            itemBuilder: (context, index) =>
                                MoviesNewsItemView(data[index]),
                          ),
                      error: (message) => Container())),
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
                child:
                    MyCachedNetworkImage(imageUrl: movies[index].backdropPath),
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
                color: Colors.white,
                fontSize: Dimens.TEXT_REGULAR_2,
                fontWeight: FontWeight.w500),
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
                color: Colors.white,
                fontSize: Dimens.TEXT_REGULAR_2,
                fontWeight: FontWeight.w500),
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
        context.next(MovieDetailPage(
          movieId: movie.id,
        ));
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
                  color: Colors.white,
                  size: Dimens.MARGIN_MEDIUM_2,
                ),
                SizedBox(width: Dimens.MARGIN_MEDIUM),
                Text(
                  "Adventure, Sci-fi",
                  style: TextStyle(
                      color: Colors.white, fontSize: Dimens.TEXT_SMALL),
                ),
              ],
            ),
            const SizedBox(height: Dimens.MARGIN_SMALL),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.white,
                  size: Dimens.MARGIN_MEDIUM_2,
                ),
                const SizedBox(width: Dimens.MARGIN_MEDIUM),
                Text(
                  movie.releaseDate,
                  style: const TextStyle(
                      color: Colors.white, fontSize: Dimens.TEXT_SMALL),
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
        SectionTitleText(title),
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

class HomeSearchViewSection extends StatelessWidget {
  const HomeSearchViewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: Dimens.MARGIN_MEDIUM_2),
      padding: const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
      decoration: const BoxDecoration(
        color: SEARCH_BOX_COLOR,
        borderRadius: BorderRadius.all(Radius.circular(Dimens.MARGIN_MEDIUM)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: Dimens.MARGIN_MEDIUM,
          ),
          Flexible(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Colors.white38,
                      fontWeight: FontWeight.w300,
                      fontSize: Dimens.TEXT_REGULAR_2)),
            ),
          )
        ],
      ),
    );
  }
}

class WelcomeAndNotificationIconSection extends StatelessWidget {
  const WelcomeAndNotificationIconSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Angelina 👋",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SectionTitleText("Welcome back")
          ],
        ),
        Icon(
          Icons.notifications_active,
          color: Colors.white,
        )
      ],
    );
  }
}

class SectionTitleText extends StatelessWidget {
  final String text;
  final double fontSize;

  const SectionTitleText(this.text,
      {super.key, this.fontSize = Dimens.TEXT_HEADING});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class CarouselSliderViewSection extends StatelessWidget {
  final List<MovieVo> list;
  final RxInt position;
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
            height: MediaQuery.of(context).size.height / 3.0,
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
                    context.next(MovieDetailPage(
                      movieId: item.id,
                    ));
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimens.MARGIN_12),
                        child: MyCachedNetworkImage(
                          imageUrl: item.posterPath,
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
          child:
              Obx(() => SectionTitleText(list[position.value.toInt()].title)),
        ),
        const Text(
          "2h29m • Action, adventure, sci-fi",
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: Dimens.MARGIN_MEDIUM),
        Obx(() => DotsIndicatorView(
            dotsCount: list.length, position: position.value.toDouble()))
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
