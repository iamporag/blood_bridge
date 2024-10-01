// import 'package:blood_bridge/src/constants/app_defaults.dart';
// import 'package:blood_bridge/src/presentation/screens/components/network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';

// class SearchHistoryTile extends StatelessWidget {
//   const SearchHistoryTile({super.key, required this.data});

// final List<Map<String, String>> data;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//               width: 320, // Adjust width as needed
//               padding: EdgeInsets.all(2.w),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12.r),
//                 color: Colors.grey[200],
//                 // boxShadow: [
//                 //   BoxShadow(
//                 //     color: Colors.grey.withOpacity(0.5),
//                 //     blurRadius: 5.r,
//                 //     spreadRadius: 1.r,
//                 //   ),
//                 // ],
//               ),
//               child: Row(
//                 children: [
//                   // Image on the left side
//                   ClipRRect(
//                       borderRadius: BorderRadius.circular(8.r),
//                       child: AspectRatio(
//                         aspectRatio: 1 / 1,
//                         child: NetworkImageWithLoader(
//                           data[index]['image']!,
//                           fit: BoxFit.cover,
//                         ),
//                       )

//                       // Image.network(
//                       //   data[index]['image']!,

//                       // ),
//                       ),
//                   const Gap(10),

//                   // Text content on the right side
//                   Expanded(
//                     child: Padding(
//                       padding: EdgeInsets.only(right: 5.w),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   data[index]['name']!,
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium
//                                       ?.copyWith(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                 ),
//                               ),
//                               Text(
//                                 " (" + data[index]['bloodType']! + ")",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleMedium
//                                     ?.copyWith(
//                                       color: Colors.red,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                               ),
//                             ],
//                           ),
//                           Text(
//                             data[index]['occupation']!,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleSmall
//                                 ?.copyWith(
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                           ),
//                           Text(
//                             data[index]['location']!,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleSmall
//                                 ?.copyWith(
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                           ),
//                           Row(
//                             children: [
//                               Icon(Icons.star,
//                                   color: Colors.orange, size: 12.h),
//                               Gap(2.w),
//                               Text(
//                                 data[index]['review']!,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleSmall
//                                     ?.copyWith(
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//   }
// }
