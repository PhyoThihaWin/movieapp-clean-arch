import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';

import '../../resource/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    SizedBox(height: MARGIN_MEDIUM_3),
                  ]),
                ),
                const CarouselSliderViewSection([
                  "https://i5.walmartimages.com/asr/65e23347-2ccc-4581-9700-581e0ea9c3a8.a808f8889bfa9e368659fbefc5e5dda4.jpeg",
                  "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
                  "https://www.washingtonpost.com/graphics/2019/entertainment/oscar-nominees-movie-poster-design/img/bohemian-rhapsody-web.jpg"
                ]),
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
                  itemBuilder: (context, index) => const ServiceListItemView(),
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
                fontSize: TEXT_REGULAR_2X,
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
                fontSize: TEXT_REGULAR_2X,
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
    return Container(
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
                fontSize: TEXT_REGULAR_2X,
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
                      fontSize: TEXT_REGULAR_2X)),
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
      style: const TextStyle(
        fontSize: TEXT_REGULAR_4X,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class CarouselSliderViewSection extends StatefulWidget {
  final List<String> bannerList;

  const CarouselSliderViewSection(this.bannerList, {super.key});

  @override
  State<CarouselSliderViewSection> createState() =>
      _CarouselSliderViewSectionState();
}

class _CarouselSliderViewSectionState extends State<CarouselSliderViewSection> {
  var _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 2.50,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                _position = index.toDouble();
              });
            },
          ),
          items: widget.bannerList
              .map(
                (banner) => ClipRRect(
                  borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
                  child: Image.network(
                    banner,
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: MARGIN_MEDIUM_2),
        const SectionTitleText("Avengers - Infinity War"),
        const Text(
          "2h29m • Action, adventure, sci-fi",
          style: TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: MARGIN_MEDIUM),
        DotsIndicatorView(position: _position)
      ],
    );
  }
}

class DotsIndicatorView extends StatelessWidget {
  const DotsIndicatorView({
    Key? key,
    required double position,
  })  : _position = position,
        super(key: key);

  final double _position;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: _position,
      decorator: const DotsDecorator(
          color: TEXT_GREY_COLOR,
          activeColor: PRIMARY_COLOR,
          size: Size(MARGIN_6, MARGIN_6),
          activeSize: Size(MARGIN_MEDIUM, MARGIN_MEDIUM)),
    );
  }
}
