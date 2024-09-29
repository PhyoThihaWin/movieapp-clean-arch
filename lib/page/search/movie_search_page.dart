import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/page/nav_host/nav_host_helper.dart';
import 'package:movieapp_clean_arch/page/search/movie_search_page_controller.dart';
import 'package:movieapp_clean_arch/resource/colors.dart';
import 'package:movieapp_clean_arch/utils/context_ext.dart';
import 'package:movieapp_clean_arch/widget/search_box_view.dart';

import '../../domain/models/movie_vo.dart';
import '../../resource/dimens.dart';
import '../home/home_page.dart';
import '../movielist/movie_listing_page.dart';

class MovieSearchPage extends StatelessWidget {
  MovieSearchPage({super.key});

  final MovieSearchPageController _pageController = Get.find();
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.navigateBack(NavHostHelper.homePath),
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          title: const SectionTitleText(
            "Now Playing Movies",
            fontSize: Dimens.TEXT_LARGE,
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverPadding(
                padding: const EdgeInsets.only(top: Dimens.MARGIN_MEDIUM),
                sliver: SliverAppBar(
                  backgroundColor: Colors.black,
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  pinned: false,
                  floating: true,
                  title: SearchBoxView(
                    enable: true,
                    onChanged: (value) {
                      _pageController.searchMovies(value);
                    },
                  ),
                ),
              ),
            ];
          },
          body: PagedGridView<int, MovieVo>(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.MARGIN_MEDIUM_2,
                  vertical: Dimens.MARGIN_LARGE),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: Dimens.MARGIN_MEDIUM_2,
                mainAxisExtent: context.getScreenHeightBy(2.4),
                crossAxisCount: 2,
              ),
              pagingController: _pageController.pagingController,
              showNewPageProgressIndicatorAsGridChild: false,
              builderDelegate: PagedChildBuilderDelegate<MovieVo>(
                  itemBuilder: (context, item, index) =>
                      MovieGridItemView(item),
                  // ignore: prefer_const_constructors
                  firstPageProgressIndicatorBuilder: (context) => Center(
                        child: const CircularProgressIndicator(
                          color: PRIMARY_COLOR, // Customize the color
                        ),
                      ),
                  noItemsFoundIndicatorBuilder: (context) => const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.data_array,
                            color: Colors.white,
                            size: Dimens.MARGIN_XXLARGE,
                          ),
                          SizedBox(height: Dimens.MARGIN_MEDIUM_2),
                          Text(
                            "The list is currently empty",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ))),
        ),
      ),
    );
  }
}
