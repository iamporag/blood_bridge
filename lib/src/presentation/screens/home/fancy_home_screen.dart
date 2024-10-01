// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:blood_bridge/src/presentation/components/title_and_action_button.dart';
import 'package:blood_bridge/src/presentation/screens/components/network_image.dart';
import 'package:blood_bridge/src/presentation/screens/splash_screen.dart';
import 'package:blood_bridge/src/routes/routes.dart';
import 'package:blood_bridge/src/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_defaults.dart';
import 'home_screen.dart';

class FancyHomeScreen extends StatelessWidget {
  const FancyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [
                    //     Color(0xFF6EC449),
                    //     Color(0xFF1C73F8),
                    //   ],
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    // ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.red.shade200,
                        Colors.red.shade500,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35.r),
                      bottomRight: Radius.circular(35.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        Gap(30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.white,
                                  size: 18.h,
                                ),
                                Gap(5.h),
                                Text(
                                  "Sun, 9 SEP 2024",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  width: 1.h,
                                  color: Colors.white,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.notifications_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(10.h),
                        Row(
                          children: [
                            SizedBox(
                              width: 65,
                              height: 65,
                              child: NetworkImageWithLoader(
                                borderRadius: BorderRadius.circular(8.r),
                                "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Gap(5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Hello, User!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    Text(
                                      "👋",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                                Gap(2.h),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                          top: 2,
                                          bottom: 2,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.offline_bolt_outlined),
                                            Gap(2.w),
                                            Text(
                                              "87% Score",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Gap(5.w),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 5,
                                          right: 5,
                                          top: 2,
                                          bottom: 2,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star),
                                            Gap(2.w),
                                            Text(
                                              "Pro Member",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(10),
                        InkWell(
                          onTap: (){
                            context.push(Routes.SEARCH_ROUTE.path);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.grey.shade50,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Search")),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 0.0),
            //   child: ListTile(
            //     title: Text("Recent Donation"),
            //   ),
            // ),
            // SingleChildScrollView(
            //   padding: EdgeInsets.only(left: AppDefaults.padding),
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: List.generate(5, (index) {
            //       return Padding(
            //         padding: EdgeInsets.only(right: AppDefaults.padding),
            //         child: Container(
            //           width: 320,
            //           height: 150,
            //           decoration: BoxDecoration(
            //             color: Color(0xFFEDF0F7),
            //             borderRadius: BorderRadius.circular(8.r),
            //           ),
            //           child: Row(
            //             children: [
            //               Expanded(
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                     color: Colors.grey.shade800,
            //                   ),
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text("Paitent Name"),
            //                       Text("Paitent Condition"),
            //                       Text("Blood Group"),
            //                       Text("Unit"),
            //                       Text("Location"),
            //                       // Text("Request By"),
            //                       Text(
            //                         "Width : ${screenWidth}",
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //               Divider(
            //                 height: 120,
            //               ),
            //               Expanded(
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                     color: Colors.grey.shade800,
            //                   ),
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text("Paitent Name"),
            //                       Text("Paitent Condition"),
            //                       Text("Blood Group"),
            //                       Text("Unit"),
            //                       Text("Location"),
            //                       // Text("Request By"),
            //                       Text(
            //                         "Height : ${screenHeight}",
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     }),
            //   ),
            // ),
            Gap(10),
            TopDonorsCard(theme: theme),
            Gap(10),
            BloodRequestCard(theme: theme),
            Gap(10),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

class BloodRequestCard extends StatelessWidget {
  const BloodRequestCard({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndActionButton(title: 'Blood Request', onTap: () {}),
        SingleChildScrollView(
          padding: EdgeInsets.only(left: AppDefaults.padding),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              5,
              (index) {
                return CustomRequestCard(
                    imageURL:
                        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TopDonorsCard extends StatelessWidget {
  const TopDonorsCard({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: TitleAndActionButton(title: "Top Donor's", onTap: () {})),
        SingleChildScrollView(
          padding: EdgeInsets.only(left: AppDefaults.padding),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(5, (index) {
              return CustomDonorCard(theme: theme);
            }),
          ),
        ),
      ],
    );
  }
}

class CustomDonorCard extends StatelessWidget {
  const CustomDonorCard({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppDefaults.padding),
      child: Card(
        elevation: 5,
        child: Container(
          width: 320,
          height: 120,
          decoration: BoxDecoration(
            color: Color(0xFFEDF0F7),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF0F7),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: NetworkImageWithLoader(
                        borderRadius: BorderRadius.circular(8.r),
                        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(AssetsManager.AB_POSITIVE_ICON),
                    ),
                  ),
                ],
              ),
              Gap(5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account Holder Name",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        "Softwer Developer",
                        style: theme.textTheme.titleSmall,
                        maxLines: 1,
                      ),
                      Text(
                        "Jamalpur Sadar Upazila, Jamalpur - 2000",
                        style: theme.textTheme.titleSmall,
                        maxLines: 2,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          Gap(5),
                          Text(
                            "4.5",
                            style: theme.textTheme.titleMedium?.copyWith(),
                            maxLines: 1,
                          ),
                          Gap(5),
                          Text(
                            "(10)",
                            style: theme.textTheme.titleMedium?.copyWith(),
                            maxLines: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
























// Padding(
//                   padding: EdgeInsets.only(right: AppDefaults.padding),
//                   child: Container(
//                     width: 320,
//                     height: 150,
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.red.shade100,
//                           Colors.red.shade500,
//                         ],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       borderRadius: BorderRadius.circular(8.r),
//                     ),
//                     child: Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: CircleAvatar(
//                             backgroundColor:
//                                 const Color.fromARGB(255, 216, 216, 216)
//                                     .withOpacity(0.4),
//                             radius: 35.r,
//                             child: ClipOval(
//                               child: Center(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 3.0),
//                                   child: SvgPicture.asset(
//                                     AssetsManager.AB_POSITIVE_ICON,
//                                     width: 40.h,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Gap(5),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.person_outline,
//                                       size: 16.h,
//                                     ),
//                                     Gap(2),
//                                     Expanded(
//                                       child: Text(
//                                         "Paitent Name",
//                                         style: theme.textTheme.titleMedium
//                                             ?.copyWith(
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         maxLines: 2,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.content_paste_outlined,
//                                       size: 16.h,
//                                     ),
//                                     Gap(2),
//                                     Expanded(
//                                       child: Text(
//                                         "Paitent Conditions",
//                                         style: theme.textTheme.titleSmall,
//                                         maxLines: 1,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.schedule_outlined,
//                                       size: 16.h,
//                                     ),
//                                     Gap(2),
//                                     Text(
//                                       "11 SEP 2024 - 11.30 PM",
//                                       style: theme.textTheme.titleSmall,
//                                       maxLines: 1,
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.location_on_outlined,
//                                       size: 16.h,
//                                     ),
//                                     Gap(2),
//                                     Expanded(
//                                       child: Text(
//                                         "Jamalpur Sadar Upazila, Jamalpur - 2000",
//                                         style: theme.textTheme.titleSmall,
//                                         maxLines: 2,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 // Row(
//                                 //   crossAxisAlignment:
//                                 //       CrossAxisAlignment.center,
//                                 //   children: [
//                                 //     Icon(
//                                 //       Icons.star,
//                                 //       color: Colors.red,
//                                 //     ),
//                                 //     Gap(5),
//                                 //     Text(
//                                 //       "4.5",
//                                 //       style: theme.textTheme.titleMedium
//                                 //           ?.copyWith(),
//                                 //       maxLines: 1,
//                                 //     ),
//                                 //     Gap(5),
//                                 //     Text(
//                                 //       "(10)",
//                                 //       style: theme.textTheme.titleMedium
//                                 //           ?.copyWith(),
//                                 //       maxLines: 1,
//                                 //     ),
//                                 //   ],
//                                 // )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );