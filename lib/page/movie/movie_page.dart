import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/page/movie/movie_page_controller.dart';
import 'package:movieapp_clean_arch/resource/colors.dart';

import '../../domain/models/movie_vo.dart';
import '../../resource/dimens.dart';
import '../movielist/movie_listing_page.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    MoviePageController moviePageController = Get.find();

    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
                automaticallyImplyLeading: false,
                title: Container(
                  height: 50,
                  padding: const EdgeInsets.all(Dimens.MARGIN_SMALL),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: PRIMARY_COLOR,
                      ),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.white,
                      tabs: const [
                        Tab(text: 'Now Playing'),
                        Tab(text: 'Coming Soon'),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                pinned: false,
                floating: true,
              ),
            ];
          },
          body: PagedGridView<int, MovieVo>(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.MARGIN_MEDIUM_2,
                  vertical: Dimens.MARGIN_MEDIUM_2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: Dimens.MARGIN_MEDIUM_2,
                childAspectRatio: 0.48,
                crossAxisCount: 2,
              ),
              pagingController: moviePageController.pagingController,
              showNewPageProgressIndicatorAsGridChild: false,
              builderDelegate: PagedChildBuilderDelegate<MovieVo>(
                itemBuilder: (context, item, index) => MovieGridItemView(item),
              )),
        ),
      ),
    );
  }
}
