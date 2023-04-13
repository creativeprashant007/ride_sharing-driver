// import 'package:flutter/material.dart'
//     show
//         BuildContext,
//         Column,
//         Container,
//         CrossAxisAlignment,
//         EdgeInsets,
//         Expanded,
//         Icons,
//         InkWell,
//         Key,
//         Row,
//         SizedBox,
//         StatelessWidget,
//         Text,
//         TextOverflow,
//         TextStyle,
//         Widget;
// import 'package:flutter/src/widgets/basic.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../../../utils/colors.dart';


// class PredictionTile extends StatelessWidget {
//   PredictionTile({
//     Key? key,
//     required this.predictions,
//     required this.onPress,
//   }) : super(key: key);

//   final Predictions predictions;
//   Function onPress;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         onPress(predictions.placeId);
//       },
//       child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 8.h,
//               ),
//               Row(
//                 children: [
//                   const FaIcon(
//                     Icons.location_on,
//                     color: AppColors.borderColor,
//                   ),
//                   SizedBox(
//                     width: 12.w,
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${predictions.structuredFormatting!.mainText}',
//                           style: TextStyle(fontSize: 16.sp),
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         Text(
//                           predictions.structuredFormatting!.secondaryText!,
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             color: AppColors.borderColor,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 1,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 8.h,
//               ),
//             ],
//           )),
//     );
//   }
// }
