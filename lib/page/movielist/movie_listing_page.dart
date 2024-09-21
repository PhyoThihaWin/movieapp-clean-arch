import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp_clean_arch/domain/models/movie_vo.dart';
import 'package:movieapp_clean_arch/page/movielist/movie_listing_page_controller.dart';
import 'package:movieapp_clean_arch/resource/dimens.dart';

class MovieListingPage extends StatefulWidget {
  const MovieListingPage({super.key});

  @override
  State<MovieListingPage> createState() => _MovieListingPageState();
}

class _MovieListingPageState extends State<MovieListingPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    MovieListingPageController movieListingPageController = Get.find();

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                title: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
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
                        color: Colors.green,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        // first tab [you can add an icon using the icon property]
                        Tab(
                          text: 'Place Bid',
                        ),

                        // second tab [you can add an icon using the icon property]
                        Tab(
                          text: 'Buy Now',
                        ),
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
        ),
      ),
    );
  }
}
