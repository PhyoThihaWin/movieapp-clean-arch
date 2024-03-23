import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/base/view_state.dart';
import 'package:movieapp_clean_arch/domain/entities/movie_vo.dart';
import 'package:movieapp_clean_arch/page/home/home_controller.dart';
import 'package:movieapp_clean_arch/page/home/movie_detail_page.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../domain/entities/actor_vo.dart';
import '../../resource/colors.dart';
import '../../widget/favorite_icon_view.dart';
import '../../widget/my_cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    RefreshController refreshController =
        RefreshController(initialRefresh: false);

    void onRefresh() async {
      homeController.onInit();
      await Future.delayed(const Duration(milliseconds: 1000));
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
                    left: MARGIN_MEDIUM_2,
                    right: MARGIN_MEDIUM_2,
                    top: MARGIN_MEDIUM),
                child: WelcomeAndNotificationIconSection(),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: Column(children: [
                      HomeSearchViewSection(),
                      SectionTitleAndSeeAll("Now Playing"),
                      SizedBox(height: MARGIN_20),
                    ]),
                  ),
                  Obx(() => homeController.nowPlayingMovies.value.render(
                        loading: const CircularProgressIndicator(),
                        success: (data) => CarouselSliderViewSection(
                          list: data.take(8).toList(),
                        ),
                        error: (message) => Container(),
                      )),
                  const SizedBox(height: MARGIN_LARGE),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll("Coming soon"),
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_2),
                  Obx(() => homeController.upcomingMovies.value.render(
                      loading: const CircularProgressIndicator(),
                      success: (data) => HorizontalListView<int>(
                            padding: const EdgeInsets.symmetric(
                                horizontal: MARGIN_MEDIUM_2),
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
                  const SizedBox(height: MARGIN_LARGE),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll("Promo & Discount"),
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_2),
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
                  const SizedBox(height: MARGIN_LARGE),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll("Celebrities"),
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_2),
                  Obx(() => homeController.popularPerson.value.render(
                        loading: const CircularProgressIndicator(),
                        success: (data) => HorizontalListView<int>(
                          padding: const EdgeInsets.symmetric(
                              horizontal: MARGIN_MEDIUM_2),
                          itemCount: data.length,
                          itemBuilder: (context, index) =>
                              ServiceListItemView(data[index]),
                        ),
                        error: (message) => Container(),
                      )),
                  const SizedBox(height: MARGIN_LARGE),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll("Movie news"),
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_2),
                  Obx(() => homeController.nowPlayingMovies.value.render(
                      loading: const CircularProgressIndicator(),
                      success: (data) => HorizontalListView<int>(
                            padding: const EdgeInsets.symmetric(
                                horizontal: MARGIN_MEDIUM_2),
                            itemCount: data.length,
                            itemBuilder: (context, index) =>
                                MoviesNewsItemView(data[index]),
                          ),
                      error: (message) => Container())),
                  const SizedBox(height: MARGIN_LARGE),
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

  const PromoPageViewSection({required this.movies, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          child: Stack(
            children: [
              Positioned.fill(
                child:
                    MyCachedNetworkImage(imageUrl: movies[index].backdropPath),
              ),
              Positioned(
                top: MARGIN_MEDIUM,
                right: MARGIN_MEDIUM,
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

  MoviesNewsItemView(this.movieVo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            child: MyCachedNetworkImage(
              imageUrl: movieVo.backdropPath,
              width: double.maxFinite,
              height: 150,
            ),
          ),
          const SizedBox(height: MARGIN_MEDIUM_2),
          Text(
            movieVo.title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ServiceListItemView extends StatelessWidget {
  final ActorVo actor;

  ServiceListItemView(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: MARGIN_MEDIUM),
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
          const SizedBox(height: MARGIN_MEDIUM_2),
          Text(
            actor.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class HorizontalListView<T> extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const HorizontalListView(
      {super.key,
      required this.padding,
      required this.itemCount,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: Iterable<int>.generate(itemCount)
            .map((index) => itemBuilder(context, index))
            .toList(),
      ),
    );
  }
}

class HomeMovieListItemView extends StatelessWidget {
  final MovieVo movie;
  final Function(int id) onFavorite;

  const HomeMovieListItemView({required this.movie, required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.next(const MovieDetailPage());
      },
      child: Container(
        width: 200,
        padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                  child: MyCachedNetworkImage(
                    imageUrl: movie.posterPath,
                    width: 200,
                    height: 230,
                  ),
                ),
                Positioned(
                    top: MARGIN_MEDIUM,
                    right: MARGIN_MEDIUM,
                    child: FavoriteIconView(
                      isFavorite: movie.isFavorite,
                      onTap: () {
                        onFavorite(movie.id);
                      },
                    ))
              ],
            ),
            const SizedBox(height: MARGIN_MEDIUM_2),
            Text(
              movie.title,
              style: const TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: TEXT_REGULAR_2,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: MARGIN_10),
            const Row(
              children: [
                Icon(
                  Icons.videocam_outlined,
                  color: Colors.white,
                  size: MARGIN_MEDIUM_2,
                ),
                SizedBox(width: MARGIN_MEDIUM),
                Text(
                  "Adventure, Sci-fi",
                  style: TextStyle(color: Colors.white, fontSize: TEXT_SMALL),
                ),
              ],
            ),
            const SizedBox(height: MARGIN_SMALL),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.white,
                  size: MARGIN_MEDIUM_2,
                ),
                const SizedBox(width: MARGIN_MEDIUM),
                Text(
                  movie.releaseDate,
                  style: const TextStyle(
                      color: Colors.white, fontSize: TEXT_SMALL),
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

  const SectionTitleAndSeeAll(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SectionTitleText(title),
        const SeeAllText(),
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
    return const Row(
      children: [
        Text(
          "See all",
          style: TextStyle(
            fontSize: TEXT_REGULAR,
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w400,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: PRIMARY_COLOR,
        )
      ],
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
      margin: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      decoration: const BoxDecoration(
        color: SEARCH_BOX_COLOR,
        borderRadius: BorderRadius.all(Radius.circular(MARGIN_MEDIUM)),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: MARGIN_MEDIUM,
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
                      fontSize: TEXT_REGULAR_2)),
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

  const SectionTitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: TEXT_HEADING,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class CarouselSliderViewSection extends StatelessWidget {
  final List<MovieVo> list;

  const CarouselSliderViewSection({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    var position = 0.0.obs;

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
              position.value = index.toDouble();
            },
          ),
          items: list
              .map(
                (item) => ClipRRect(
                  borderRadius: BorderRadius.circular(MARGIN_12),
                  child: MyCachedNetworkImage(
                    imageUrl: item.posterPath,
                    width: double.maxFinite,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: MARGIN_MEDIUM_2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child:
              Obx(() => SectionTitleText(list[position.value.toInt()].title)),
        ),
        const Text(
          "2h29m • Action, adventure, sci-fi",
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: MARGIN_MEDIUM),
        Obx(() =>
            DotsIndicatorView(dotsCount: list.length, position: position.value))
      ],
    );
  }
}

class DotsIndicatorView extends StatelessWidget {
  final double position;
  final int dotsCount;

  DotsIndicatorView({required this.position, required this.dotsCount});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: const DotsDecorator(
          color: TEXT_GREY_COLOR,
          activeColor: PRIMARY_COLOR,
          size: Size(MARGIN_6, MARGIN_6),
          activeSize: Size(MARGIN_MEDIUM, MARGIN_MEDIUM)),
    );
  }
}
