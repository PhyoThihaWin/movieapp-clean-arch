import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_clean_arch/page/home/home_page.dart';
import 'package:movieapp_clean_arch/resource/colors.dart';
import 'package:movieapp_clean_arch/utils/ext.dart';
import 'package:movieapp_clean_arch/widget/svg_image.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _MovieImageAndInfoSection(),
            const SizedBox(height: MARGIN_LARGE),
            const _OrderIdAndSeatSection(),
            const SizedBox(height: MARGIN_LARGE),
            const _DiscountCodeApplySection(),
            const SizedBox(height: MARGIN_MEDIUM_2),
            const Divider(
              color: GREY_BOX_COLOR,
            ),
            const SizedBox(height: MARGIN_MEDIUM),
            const _TotalPaymentAmountRow(),
            const SizedBox(height: MARGIN_20),
            const SectionTitleText("Payment Method"),
            const SizedBox(height: MARGIN_MEDIUM_2),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const PaymentListItemView(),
            )
          ],
        ),
      ),
    );
  }
}

class PaymentListItemView extends StatelessWidget {
  const PaymentListItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
        margin: const EdgeInsets.only(bottom: MARGIN_12),
        decoration: BoxDecoration(
            color: GREY_BOX_COLOR,
            borderRadius: BorderRadius.circular(RADIUS_MEDIUM)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "img_dummy_payment.png".toAssetImage(),
                    width: 50,
                  ),
                  const SizedBox(width: MARGIN_MEDIUM_2),
                  const Expanded(
                    child: Text(
                      "International payments",
                      style: TextStyle(
                          color: Colors.white, fontSize: TEXT_REGULAR),
                    ),
                  )
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: MARGIN_20,
            )
          ],
        ),
      ),
    );
  }
}

class _TotalPaymentAmountRow extends StatelessWidget {
  const _TotalPaymentAmountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR,
          ),
        ),
        Text(
          "189.000 VND",
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w700,
            fontSize: TEXT_HEADING,
          ),
        )
      ],
    );
  }
}

class _DiscountCodeApplySection extends StatelessWidget {
  const _DiscountCodeApplySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: MARGIN_12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          color: GREY_BOX_COLOR),
      child: Row(
        children: [
          const Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgIcon("ic_discount.svg"),
                SizedBox(width: MARGIN_MEDIUM),
                Expanded(
                    child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: TEXT_REGULAR),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "discount code",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: TEXT_REGULAR)),
                ))
              ],
            ),
          ),
          ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(PRIMARY_COLOR),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(RADIUS_MEDIUM),
                          side: const BorderSide(color: PRIMARY_COLOR)))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
                child: Text(
                  "Apply",
                  style: TextStyle(color: Colors.black),
                ),
              ))
        ],
      ),
    );
  }
}

class _OrderIdAndSeatSection extends StatelessWidget {
  const _OrderIdAndSeatSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Oder ID",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "78889377726",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )
          ],
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Seat",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "H7, H8",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}

class _MovieImageAndInfoSection extends StatelessWidget {
  const _MovieImageAndInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(RADIUS_MEDIUM),
      child: Container(
        decoration: const BoxDecoration(color: GREY_BOX_COLOR),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://s.yimg.com/ny/api/res/1.2/ZzAHlDHi8a2xdBRRbruaYQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTkyOA--/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/d05a3f087fa57f6d41b865d53a42a5f5",
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Avengers: Infinity War",
                        style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontSize: TEXT_LARGE,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: MARGIN_MEDIUM_2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _MovieInfoRowView(
                            icon: const SvgIcon("ic_video_play.svg"),
                            text: "Acton, adventure, sci-fi",
                          ),
                          const SizedBox(height: MARGIN_MEDIUM),
                          _MovieInfoRowView(
                            icon: const SvgIcon("ic_location.svg"),
                            text: "Vincom Ocean Park CGV",
                          ),
                          const SizedBox(height: MARGIN_MEDIUM),
                          _MovieInfoRowView(
                            icon: const SvgIcon("ic_clock.svg"),
                            text: "10.12.2022 • 14:15",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MovieInfoRowView extends StatelessWidget {
  final Widget icon;
  final String text;

  _MovieInfoRowView({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: MARGIN_MEDIUM),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: TEXT_SMALL),
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
