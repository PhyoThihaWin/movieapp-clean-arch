import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/page/home/home_page_controller.dart';
import 'package:movieapp_clean_arch/page/movielist/movie_listing_page_controller.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';

class MovieListingPage extends StatelessWidget {
  MovieListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    MovieListingPageController movieListingPageController = Get.find();
    return Scaffold(
      body: PagedListView<int, String>(
          pagingController: movieListingPageController.pagingController,
          builderDelegate: PagedChildBuilderDelegate<String>(
            itemBuilder: (context, item, index) => Card(
              child: Container(
                padding: EdgeInsets.all(Dimens.MARGIN_XLARGE),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: Dimens.TEXT_HEADING_2,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
