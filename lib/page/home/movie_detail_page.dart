import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/resource/colors.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: context.getScreenHeightBy(3.5),
                  width: double.maxFinite,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                    left: MARGIN_MEDIUM_2,
                    top: MARGIN_XLARGE,
                    child: PageBackIconView()),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -90,
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: GREY_BOX_COLOR,
                      borderRadius: BorderRadius.circular(MARGIN_10),
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: MARGIN_MEDIUM_3, vertical: MARGIN_10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SectionTitleText("Avengers: Infinity War"),
                        Text(
                          "2h29m • 16.12.2022",
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("Review",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: TEXT_REGULAR_2X,
                                )),
                            SizedBox(width: MARGIN_MEDIUM),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: MARGIN_MEDIUM_3,
                            ),
                            SizedBox(width: MARGIN_MEDIUM),
                            Text("4.8",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: TEXT_REGULAR_2X,
                                )),
                            SizedBox(width: MARGIN_SMALL),
                            Text(
                              "(1.222)",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: TEXT_SMALL),
                            ),
                          ],
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: MARGIN_XLARGE,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 1000,
            )
          ],
        ),
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
