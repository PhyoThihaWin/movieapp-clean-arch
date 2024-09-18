import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/page/movielist/movie_listing_page_controller.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';

class MovieListingPage extends StatelessWidget {
  const MovieListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    MovieListingPageController movieListingPageController = Get.find();
    return Scaffold(
      body: PagedGridView<int, MovieVo>(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          pagingController: movieListingPageController.pagingController,
          showNewPageProgressIndicatorAsGridChild: false,
          builderDelegate: PagedChildBuilderDelegate<MovieVo>(
            itemBuilder: (context, item, index) => Card(
              child: Container(
                padding: const EdgeInsets.all(Dimens.MARGIN_XLARGE),
                child: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: Dimens.TEXT_HEADING_2,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
