import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp_clean_arch/page/home/cinema_seat_page.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/resource/colors.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';
import 'package:movieapp_clean_arch/widget/button_view_fullwidth.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  int cinemaIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Stack(
              clipBehavior: Clip.none,
              children: [
                MovieLandscapeImageSection(),
                Positioned(
                    left: MARGIN_MEDIUM_2,
                    top: MARGIN_XLARGE,
                    child: PageBackIconView()),
                Positioned(
                  bottom: 0,
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2,
                  child: MovieDetailInfoSection(),
                ),
              ],
            ),
            const SizedBox(height: MARGIN_LARGE),
            const MovieDescriptionsSection(),
            const SizedBox(height: MARGIN_LARGE),
            const MovieStoryLineSection(),
            const SizedBox(height: MARGIN_LARGE),
            const MovieDirectorListSeciton(),
            const SizedBox(height: MARGIN_LARGE),
            const MovieActorListSection(),
            const SizedBox(height: MARGIN_LARGE),
            MovieDetailCinemaSection(
              cinemaIndex: cinemaIndex,
              select: (index) {
                setState(() {
                  cinemaIndex = index;
                });
              },
            ),
            const SizedBox(height: MARGIN_LARGE),
            ButtonViewFullWidth(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
              btnText: "Continue",
              onClick: () {
                context.next(const CinemaSeatPage());
              },
            ),
            const SizedBox(height: MARGIN_LARGE)
          ],
        ),
      ),
    );
  }
}

class MovieDetailCinemaSection extends StatelessWidget {
  final int cinemaIndex;
  final Function(int) select;

  const MovieDetailCinemaSection(
      {super.key, required this.cinemaIndex, required this.select});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: SectionTitleText("Cinema"),
        ),
        const SizedBox(height: MARGIN_12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              select(index);
            },
            child: Container(
              padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
              margin: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2,
                  bottom: MARGIN_MEDIUM_2),
              decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          index == cinemaIndex ? PRIMARY_COLOR : GREY_BOX_COLOR,
                      width: 1.5),
                  color: index == cinemaIndex
                      ? PRIMARY_COLOR.withOpacity(0.3)
                      : GREY_BOX_COLOR,
                  borderRadius: BorderRadius.circular(MARGIN_10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Vincom Ocean Park CGV",
                        style: TextStyle(
                            fontSize: TEXT_REGULAR_3,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(MARGIN_SMALL),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
                          fit: BoxFit.cover,
                          height: MARGIN_MEDIUM_2,
                          width: MARGIN_XLARGE,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: MARGIN_6),
                  const Text(
                    "9.32 km | 27 Co Linh, Long Bien, Ha Noi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_SMALL,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MovieActorListSection extends StatelessWidget {
  const MovieActorListSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: SectionTitleText("Actor"),
        ),
        const SizedBox(height: MARGIN_12),
        HorizontalListView(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          itemCount: 10,
          itemBuilder: (context, index) => const MovieActorListiItemView(),
        )
      ],
    );
  }
}

class MovieDirectorListSeciton extends StatelessWidget {
  const MovieDirectorListSeciton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: SectionTitleText("Director"),
        ),
        const SizedBox(height: MARGIN_12),
        HorizontalListView(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          itemCount: 10,
          itemBuilder: (context, index) => const MovieActorListiItemView(),
        )
      ],
    );
  }
}

class MovieActorListiItemView extends StatelessWidget {
  const MovieActorListiItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RADIUS_MEDIUM),
          color: GREY_BOX_COLOR),
      width: 140,
      padding: const EdgeInsets.symmetric(
          vertical: MARGIN_MEDIUM, horizontal: MARGIN_MEDIUM_2),
      margin: const EdgeInsets.only(right: MARGIN_12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              imageUrl:
                  "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
              fit: BoxFit.cover,
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(
            width: MARGIN_MEDIUM,
          ),
          const Flexible(
            child: Text(
              "Anthony Russo",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class MovieStoryLineSection extends StatelessWidget {
  const MovieStoryLineSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitleText("Storyline"),
          SizedBox(height: MARGIN_12),
          Text(
            "As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos.... See more",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class MovieDescriptionsSection extends StatelessWidget {
  const MovieDescriptionsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MovieDescTextView(
          desc: "Movie genre:",
          text: "Action, adventure, sci-fi, Romance, Comedy",
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        MovieDescTextView(
          desc: "Censorship:",
          text: "13+",
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        MovieDescTextView(
          desc: "Language:",
          text: "English",
        ),
      ],
    );
  }
}

class MovieDescTextView extends StatelessWidget {
  final String desc;
  final String text;

  const MovieDescTextView({super.key, required this.desc, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              desc,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieLandscapeImageSection extends StatelessWidget {
  const MovieLandscapeImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: context.getScreenHeightBy(3.5),
          width: double.maxFinite,
          child: CachedNetworkImage(
            imageUrl:
                "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 100)
      ],
    );
  }
}

class MovieDetailInfoSection extends StatelessWidget {
  const MovieDetailInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: GREY_BOX_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_10),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_20, vertical: MARGIN_10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SectionTitleText("Avengers: Infinity War"),
          const Text(
            "2h29m • 16.12.2022",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Review",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: TEXT_REGULAR_2,
                  )),
              SizedBox(width: MARGIN_MEDIUM),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: MARGIN_20,
              ),
              SizedBox(width: MARGIN_MEDIUM),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("4.8",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: TEXT_REGULAR_2,
                      )),
                  SizedBox(width: MARGIN_SMALL),
                  Text(
                    "(1.222)",
                    style: TextStyle(
                        height: 1.7,
                        color: Colors.white70,
                        fontSize: TEXT_SMALL),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: MARGIN_10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: MARGIN_XLARGE,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: MARGIN_MEDIUM, vertical: MARGIN_6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(MARGIN_SMALL),
                    border: Border.all(color: Colors.grey)),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: Colors.grey,
                      size: MARGIN_MEDIUM_2,
                    ),
                    Text(
                      "Watch trailer",
                      style:
                          TextStyle(color: Colors.grey, fontSize: TEXT_SMALL),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: MARGIN_MEDIUM)
        ],
      ),
    );
  }
}

class PageBackIconView extends StatelessWidget {
  const PageBackIconView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
      padding: const EdgeInsets.all(MARGIN_MEDIUM),
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }
}
