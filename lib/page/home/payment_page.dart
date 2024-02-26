import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/resource/colors.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';

import '../../resource/dimens.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            context.popBack();
          },
          child: const Padding(
            padding: EdgeInsets.all(MARGIN_MEDIUM),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          "Payment",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: GREY_BOX_COLOR,
                  borderRadius: BorderRadius.circular(RADIUS_MEDIUM)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(RADIUS_MEDIUM),
                          topLeft: Radius.circular(RADIUS_MEDIUM)),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.all(MARGIN_MEDIUM_2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Avengers: Infinity War",
                            style: TextStyle(
                                color: PRIMARY_COLOR,
                                fontSize: TEXT_LARGE,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            height: 50,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
