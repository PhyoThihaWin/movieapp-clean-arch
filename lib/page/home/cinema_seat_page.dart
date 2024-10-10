// import 'package:flutter/material.dart';
// import 'package:movieapp_clean_arch/page/home/payment_page.dart';
// import 'package:movieapp_clean_arch/resource/colors.dart';
// import 'package:movieapp_clean_arch/resource/dimens.dart';
// import 'package:movieapp_clean_arch/utils/context_ext.dart';
// import 'package:movieapp_clean_arch/widget/svg_image.dart';

// import '../../widget/horizontal_singlechild_list_view.dart';

// class CinemaSeatPage extends StatelessWidget {
//   const CinemaSeatPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () {
//             context.popBack();
//           },
//           child: const Padding(
//             padding: EdgeInsets.all(Dimens.MARGIN_MEDIUM),
//             child: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         title: const Text(
//           "Select seat",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: const Column(
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(height: Dimens.MARGIN_LARGE),
//                   SvgImage("cinema_tv_screen.svg"),
//                   SizedBox(height: Dimens.MARGIN_MEDIUM),
//                   CinemaSeatGridView(),
//                   SizedBox(height: Dimens.MARGIN_18),
//                   _SeatInfoRowSection(),
//                   SizedBox(height: Dimens.MARGIN_XLARGE),
//                   _SelectCinemaDateTimeSection()
//                 ],
//               ),
//             ),
//           ),
//           _CinemaBuyTicketSection()
//         ],
//       ),
//     );
//   }
// }

// class _CinemaBuyTicketSection extends StatelessWidget {
//   const _CinemaBuyTicketSection();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Divider(
//           color: Colors.grey.shade900,
//           height: 1,
//           thickness: 1,
//         ),
//         const SizedBox(height: Dimens.MARGIN_MEDIUM),
//         Padding(
//           padding: const EdgeInsets.symmetric(
//               horizontal: Dimens.MARGIN_MEDIUM_2,
//               vertical: Dimens.MARGIN_MEDIUM),
//           child: Row(
//             children: [
//               const Expanded(
//                 flex: 1,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Total",
//                       style: TextStyle(
//                           color: Colors.white, fontSize: Dimens.TEXT_SMALL),
//                     ),
//                     Text(
//                       "210.000 VND",
//                       style: TextStyle(
//                           color: PRIMARY_COLOR,
//                           fontSize: Dimens.TEXT_XLARGE,
//                           fontWeight: FontWeight.w700),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: GestureDetector(
//                   onTap: () {
//                     context.next(const PaymentPage());
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: PRIMARY_COLOR,
//                       borderRadius: BorderRadius.circular(Dimens.RADIUS_XLARGE),
//                     ),
//                     height: Dimens.BUTTON_COMMON_HEIGHT,
//                     child: const Center(
//                       child: Text(
//                         "Buy Ticket",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: Dimens.TEXT_REGULAR_2,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _SelectCinemaDateTimeSection extends StatelessWidget {
//   const _SelectCinemaDateTimeSection();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text(
//           "Select Date & Time",
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: Dimens.TEXT_REGULAR_3,
//               fontWeight: FontWeight.w500),
//         ),
//         const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
//         HorizontalSingleChildListView(
//           padding:
//               const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
//           itemCount: 10,
//           itemBuilder: (context, index) => Container(
//             padding: const EdgeInsets.only(
//                 top: Dimens.MARGIN_MEDIUM_2,
//                 left: Dimens.MARGIN_SMALL,
//                 right: Dimens.MARGIN_SMALL,
//                 bottom: Dimens.MARGIN_SMALL),
//             margin: const EdgeInsets.only(right: Dimens.MARGIN_10),
//             decoration: BoxDecoration(
//                 color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(100)),
//             child: Column(
//               children: [
//                 const Text(
//                   "Dec",
//                   style: TextStyle(
//                       color: Colors.black, fontSize: Dimens.TEXT_REGULAR_2),
//                 ),
//                 const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
//                 Container(
//                   height: 40,
//                   width: 40,
//                   decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(100)),
//                   child: const Center(
//                     child: Text(
//                       "10",
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: Dimens.MARGIN_MEDIUM_2),
//         HorizontalSingleChildListView(
//           padding:
//               const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_MEDIUM_2),
//           itemCount: 10,
//           itemBuilder: (context, index) => Container(
//             margin: const EdgeInsets.only(right: Dimens.MARGIN_MEDIUM),
//             padding: const EdgeInsets.symmetric(
//                 horizontal: Dimens.MARGIN_MEDIUM_2,
//                 vertical: Dimens.MARGIN_MEDIUM),
//             decoration: BoxDecoration(
//                 color: GREY_BOX_COLOR,
//                 borderRadius: BorderRadius.circular(Dimens.RADIUS_LARGE)),
//             child: Text(
//               "14:15",
//               style: TextStyle(color: Colors.white.withOpacity(0.7)),
//             ),
//           ),
//         ),
//         const SizedBox(height: Dimens.MARGIN_XLARGE),
//       ],
//     );
//   }
// }

// class _SeatInfoRowSection extends StatelessWidget {
//   const _SeatInfoRowSection();

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         SeatInfoView(
//           color: GREY_BOX_COLOR,
//           text: "Available",
//         ),
//         SeatInfoView(
//           color: SEAT_RESERVED_COLOR,
//           text: "Reserved",
//         ),
//         SeatInfoView(
//           color: PRIMARY_COLOR,
//           text: "Selected",
//         ),
//       ],
//     );
//   }
// }

// class SeatInfoView extends StatelessWidget {
//   final Color color;
//   final String text;

//   const SeatInfoView({super.key, required this.color, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           height: Dimens.MARGIN_LARGE,
//           width: Dimens.MARGIN_LARGE,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(Dimens.RADIUS_SMALL),
//               color: color),
//         ),
//         const SizedBox(width: Dimens.MARGIN_MEDIUM),
//         Text(
//           text,
//           style: const TextStyle(color: Colors.white),
//         )
//       ],
//     );
//   }
// }

// class CinemaSeatGridView extends StatelessWidget {
//   const CinemaSeatGridView({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 10, // number of items in each row
//         mainAxisSpacing: Dimens.MARGIN_6, // spacing between rows
//         crossAxisSpacing: Dimens.MARGIN_6, // spacing between columns
//       ),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       padding: const EdgeInsets.symmetric(horizontal: Dimens.MARGIN_SMALL),
//       itemCount: 110,
//       itemBuilder: (context, index) => Container(
//         decoration: BoxDecoration(
//             color: GREY_BOX_COLOR,
//             borderRadius: BorderRadius.circular(Dimens.RADIUS_SMALL)),
//         child: const Center(
//           child: Text(
//             "A2",
//             style: TextStyle(color: Colors.white, fontSize: Dimens.TEXT_SMALL),
//           ),
//         ),
//       ),
//     );
//   }
// }
