import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp_clean_arch/domain/entities/MovieVo.dart';
import 'package:movieapp_clean_arch/page/home/home_controller.dart';
import 'package:movieapp_clean_arch/page/home/movie_detail_page.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';

import '../../resource/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_2, vertical: MARGIN_MEDIUM),
            child: WelcomeAndNotificationIconSection(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: Column(children: [
                      HomeSearchViewSection(),
                      SectionTitleAndSeeAll("Now Playing"),
                      SizedBox(height: MARGIN_20),
                    ]),
                  ),
                  Obx(() => homeController
                          .nowPlayingMovies.value.orEmptyObject.isNotEmpty
                      ? CarouselSliderViewSection(
                          list: homeController.nowPlayingMovies.value!
                              .take(8)
                              .toList(),
                        )
                      : Container()),
                  const SizedBox(height: MARGIN_LARGE),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll("Coming soon"),
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_2),
                  HorizontalListView<int>(
                    padding:
                        const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    itemCount: 10,
                    itemBuilder: (context, index) =>
                        const HomeMovieListItemView(),
                  ),
                  const SizedBox(height: MARGIN_LARGE),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll("Promo & Discount"),
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_2),
                  SizedBox(
                    height: 180,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: MARGIN_MEDIUM_2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: MARGIN_LARGE),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll("Service"),
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_2),
                  HorizontalListView<int>(
                    padding:
                        const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    itemCount: 10,
                    itemBuilder: (context, index) =>
                        const ServiceListItemView(),
                  ),
                  const SizedBox(height: MARGIN_LARGE),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: SectionTitleAndSeeAll("Movie news"),
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_2),
                  HorizontalListView<int>(
                    padding:
                        const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    itemCount: 10,
                    itemBuilder: (context, index) => const MoviesNewsItemView(),
                  ),
                  const SizedBox(height: MARGIN_LARGE),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoviesNewsItemView extends StatelessWidget {
  const MoviesNewsItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            child: CachedNetworkImage(
              imageUrl:
                  "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: 180,
            ),
          ),
          const SizedBox(height: MARGIN_MEDIUM_2),
          const Text(
            "When The Batman 2 Starts Filming Reportedly Revealed",
            style: TextStyle(
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
  const ServiceListItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: CachedNetworkImage(
              imageUrl:
                  "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
              fit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(height: MARGIN_MEDIUM_2),
          const Text(
            "Avatar",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
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
        children: Iterable<int>.generate(itemCount)
            .map((index) => itemBuilder(context, index))
            .toList(),
      ),
    );
  }
}

class HomeMovieListItemView extends StatelessWidget {
  const HomeMovieListItemView({
    super.key,
  });

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
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
              child: CachedNetworkImage(
                imageUrl:
                    "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
                fit: BoxFit.cover,
                width: 200,
                height: 230,
              ),
            ),
            const SizedBox(height: MARGIN_MEDIUM_2),
            const Text(
              "Avatar 2: The Way Of Water",
              style: TextStyle(
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
            const Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.white,
                  size: MARGIN_MEDIUM_2,
                ),
                SizedBox(width: MARGIN_MEDIUM),
                Text(
                  "20.12.2022",
                  style: TextStyle(color: Colors.white, fontSize: TEXT_SMALL),
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
            height: MediaQuery.of(context).size.height / 2.50,
            viewportFraction: 0.7,
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
                  child: Image.network(
                    item.posterPath,
                    fit: BoxFit.cover,
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
