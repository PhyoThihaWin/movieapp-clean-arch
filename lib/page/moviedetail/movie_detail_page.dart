import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_clean_arch/base/view_state.dart';
import 'package:movieapp_clean_arch/domain/models/actor_vo.dart';
import 'package:movieapp_clean_arch/domain/models/movie_detail_vo.dart';
import 'package:movieapp_clean_arch/page/home/cinema_seat_page.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/page/moviedetail/movie_detail_page_controller.dart';
import 'package:movieapp_clean_arch/page/nav_host/nav_host_helper.dart';
import 'package:movieapp_clean_arch/resource/colors.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';
import 'package:movieapp_clean_arch/widget/button_view_fullwidth.dart';
import 'package:movieapp_clean_arch/widget/favorite_icon_view.dart';
import 'package:movieapp_clean_arch/widget/my_cached_network_image.dart';

import '../../widget/horizontal_singlechild_list_view.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;
  MovieDetailPage({super.key, required this.movieId});
  MovieDetailPageController movieDetailPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    movieDetailPageController.getMovieDetail(movieId);

    return Scaffold(
      backgroundColor: HOME_SCREEN_BACKGROUND_COLOR,
      body: Obx(() => ViewStateRender(
            viewState: movieDetailPageController.movieDetails.value,
            loading: const Center(child: CircularProgressIndicator()),
            success: (data) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      MovieLandscapeImageSection(imageUrl: data.backdropPath),
                      Positioned(
                        left: Dimens.MARGIN_MEDIUM_2,
                        top: 50,
                        child: PageBackIconView(onBack: () {
                          context.navigateBack(NavHostHelper.homePath);
                        }),
                      ),
                      Positioned(
                        bottom: 0,
                        left: Dimens.MARGIN_MEDIUM_2,
                        right: Dimens.MARGIN_MEDIUM_2,
                        child: MovieDetailInfoSection(
                          movieDetailVo: data,
                          onFavorite: (id) =>
                              movieDetailPageController.saveFavoriteMovie(id),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimens.MARGIN_LARGE),
                  MovieDescriptionsSection(movieDetailVo: data),
                  const SizedBox(height: Dimens.MARGIN_LARGE),
                  MovieStoryLineSection(movieDetailVo: data),
                  const SizedBox(height: Dimens.MARGIN_LARGE),
                  MovieCastsListSeciton(actors: data.casts),
                  const SizedBox(height: Dimens.MARGIN_LARGE),
                  MovieCrewsListSection(actors: data.crews),
                  const SizedBox(height: Dimens.MARGIN_LARGE),
                  MovieDetailCinemaSection(
                    cinemaIndex: movieDetailPageController.cinemaIndex.value,
                    select: (index) {
                      movieDetailPageController.cinemaIndex.value = index;
                    },
                  ),
                  const SizedBox(height: Dimens.MARGIN_LARGE),
                  ButtonViewFullWidth(
                    margin: const EdgeInsets.symmetric(
                        horizontal: Dimens.MARGIN_MEDIUM_2),
                    btnText: "Continue",
                    onClick: () {
                      context.next(const CinemaSeatPage());
                    },
                  ),
                  const SizedBox(height: Dimens.MARGIN_LARGE)
                ],
              ),
            ),
          )),
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
          padding: EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
          child: SectionTitleText("Cinema"),
        ),
        const SizedBox(height: Dimens.MARGIN_12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              select(index);
            },
            child: Container(
              padding: const EdgeInsets.all(Dimens.MARGIN_MEDIUM_2),
              margin: const EdgeInsets.only(
                  left: Dimens.MARGIN_MEDIUM_2,
                  right: Dimens.MARGIN_MEDIUM_2,
                  bottom: Dimens.MARGIN_MEDIUM_2),
              decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          index == cinemaIndex ? PRIMARY_COLOR : GREY_BOX_COLOR,
                      width: 1.5),
                  color: index == cinemaIndex
                      ? PRIMARY_COLOR.withOpacity(0.3)
                      : GREY_BOX_COLOR,
                  borderRadius: BorderRadius.circular(Dimens.MARGIN_10)),
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
                            fontSize: Dimens.TEXT_REGULAR_3,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimens.MARGIN_SMALL),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
                          fit: BoxFit.cover,
                          height: Dimens.MARGIN_MEDIUM_2,
                          width: Dimens.MARGIN_XLARGE,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimens.MARGIN_6),
                  const Text(
                    "9.32 km | 27 Co Linh, Long Bien, Ha Noi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimens.TEXT_SMALL,
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

class MovieCrewsListSection extends StatelessWidget {
  final List<ActorVo> actors;
  const MovieCrewsListSection({super.key, required this.actors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: Dimens.MARGIN_MEDIUM_2),
          child: SectionTitleText("Crews"),
        ),
        const SizedBox(height: Dimens.MARGIN_12),
        HorizontalSingleChildListView(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
          itemCount: actors.length,
          itemBuilder: (context, index) =>
              MovieActorListiItemView(actorVo: actors[index]),
        )
      ],
    );
  }
}

class MovieCastsListSeciton extends StatelessWidget {
  final List<ActorVo> actors;
  const MovieCastsListSeciton({super.key, required this.actors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: Dimens.MARGIN_MEDIUM_2),
          child: SectionTitleText("Cast"),
        ),
        const SizedBox(height: Dimens.MARGIN_12),
        HorizontalSingleChildListView(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
          itemCount: actors.length,
          itemBuilder: (context, index) => MovieActorListiItemView(
            actorVo: actors[index],
          ),
        )
      ],
    );
  }
}

class MovieActorListiItemView extends StatelessWidget {
  final ActorVo actorVo;
  const MovieActorListiItemView({super.key, required this.actorVo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.RADIUS_MEDIUM),
          color: GREY_BOX_COLOR),
      width: 140,
      padding: const EdgeInsets.symmetric(
          vertical: Dimens.MARGIN_MEDIUM, horizontal: Dimens.MARGIN_MEDIUM_2),
      margin: const EdgeInsets.only(right: Dimens.MARGIN_12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: MyCachedNetworkImage(
              imageUrl: actorVo.profilePath,
              height: 30,
              width: 30,
            ),
          ),
          const SizedBox(
            width: Dimens.MARGIN_MEDIUM,
          ),
          Flexible(
            child: Text(
              actorVo.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class MovieStoryLineSection extends StatelessWidget {
  final MovieDetailVo movieDetailVo;
  const MovieStoryLineSection({
    super.key,
    required this.movieDetailVo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitleText("Storyline"),
          const SizedBox(height: Dimens.MARGIN_12),
          Text(
            movieDetailVo.overview,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class MovieDescriptionsSection extends StatelessWidget {
  final MovieDetailVo movieDetailVo;
  const MovieDescriptionsSection({
    super.key,
    required this.movieDetailVo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieDescTextView(
          desc: "Movie genre:",
          text: movieDetailVo.genres.map((item) => item.name).join(", "),
        ),
        const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
        const MovieDescTextView(
          desc: "Censorship:",
          text: "13+",
        ),
        const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
        const MovieDescTextView(
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
      padding: const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
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
  final String imageUrl;
  const MovieLandscapeImageSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: context.getScreenHeightBy(3.0),
          width: double.maxFinite,
          child: MyCachedNetworkImage(
            imageUrl: imageUrl,
          ),
        ),
        const SizedBox(height: 100)
      ],
    );
  }
}

class MovieDetailInfoSection extends StatelessWidget {
  final MovieDetailVo movieDetailVo;
  final Function(int movieId) onFavorite;
  const MovieDetailInfoSection(
      {super.key, required this.movieDetailVo, required this.onFavorite});

  String minutesToHoursAndMinutes(int totalMinutes) {
    int hours = totalMinutes ~/ 60; // Integer division to get hours
    int minutes = totalMinutes % 60; // Remainder to get remaining minutes
    return '${hours}h ${minutes}m'; // Format the string
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: GREY_BOX_COLOR,
        borderRadius: BorderRadius.circular(Dimens.MARGIN_10),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.MARGIN_20, vertical: Dimens.MARGIN_10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: SectionTitleText(movieDetailVo.title)),
              FavoriteIconView(
                  isFavorite: movieDetailVo.isFavorite,
                  onTap: () {
                    onFavorite(movieDetailVo.id);
                  })
            ],
          ),
          Text(
            "${minutesToHoursAndMinutes(movieDetailVo.runtime)} • ${movieDetailVo.releaseDate}",
            style: const TextStyle(color: Colors.white70),
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
                    fontSize: Dimens.TEXT_REGULAR_2,
                  )),
              SizedBox(width: Dimens.MARGIN_MEDIUM),
              Icon(
                Icons.star,
                color: Colors.amber,
                size: Dimens.MARGIN_20,
              ),
              SizedBox(width: Dimens.MARGIN_MEDIUM),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("4.8",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimens.TEXT_REGULAR_2,
                      )),
                  SizedBox(width: Dimens.MARGIN_SMALL),
                  Text(
                    "(1.222)",
                    style: TextStyle(
                        height: 1.7,
                        color: Colors.white70,
                        fontSize: Dimens.TEXT_SMALL),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: Dimens.MARGIN_10,
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
                itemSize: Dimens.MARGIN_XLARGE,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  debugPrint(rating.toString());
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.MARGIN_MEDIUM,
                    vertical: Dimens.MARGIN_6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.MARGIN_SMALL),
                    border: Border.all(color: Colors.grey)),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: Colors.grey,
                      size: Dimens.MARGIN_MEDIUM_2,
                    ),
                    Text(
                      "Watch trailer",
                      style: TextStyle(
                          color: Colors.grey, fontSize: Dimens.TEXT_SMALL),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: Dimens.MARGIN_MEDIUM)
        ],
      ),
    );
  }
}

class PageBackIconView extends StatelessWidget {
  final Function() onBack;
  const PageBackIconView({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(Dimens.MARGIN_MEDIUM)),
        padding: const EdgeInsets.all(Dimens.MARGIN_MEDIUM),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}
