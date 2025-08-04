// ignore_for_file: unnecessary_brace_in_string_interps, unused_local_variable

import 'package:blood_bridge/src/presentation/components/title_and_action_button.dart';
import 'package:blood_bridge/src/presentation/screens/components/network_image.dart';

import 'package:blood_bridge/src/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../constants/app_defaults.dart';
import '../components/banner_space.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF75140C),
        title: Text(
          'BBridge',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // context.read<PointsBloc>().add(CalculatePointsEvent());
            },
            icon: Row(
              children: [
                Text(
                  "5000 Point",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                ),
                Gap(5),
                Icon(
                  Icons.local_police_outlined,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                ListTile(
                  title: Text(
                    "Hello, Username!",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.red.shade200,
                            size: 14,
                          ),
                          Gap(5),
                          Text(
                            "Sun, 9 SEP 2024",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.grey,
                                  fontFamily: 'Poppins',
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.red.shade200,
                            size: 14,
                          ),
                          Gap(5),
                          Text(
                            "Jamalpur Sadar Upazila",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins',
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(10),
            BannerSpace(),
            Gap(10),
            RequestArea(theme: theme),
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

class RequestArea extends StatelessWidget {
  final ThemeData theme;
  const RequestArea({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.redAccent.shade100,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  // width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Blood\nRequest",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_alt,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 5.0),
                        child: CircleAvatar(
                          radius: 35,
                          child: ClipOval(
                            child: NetworkImageWithLoader(
                                "https://resourceboy.com/wp-content/uploads/2021/10/blood-bag-label-mockup-with-medical-supplies-around.jpg"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Gap(20),
          Expanded(
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () {},
                splashColor: Colors.redAccent.shade100,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  // width: 200,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Become\nA Donner",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_right_alt,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 5.0),
                        child: CircleAvatar(
                          radius: 35,
                          child: ClipOval(
                            child: NetworkImageWithLoader(
                                "https://resourceboy.com/wp-content/uploads/2021/10/blood-bag-label-mockup-with-medical-supplies-around.jpg"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
          padding: EdgeInsets.only(left: 16.0),
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
        elevation: 2,
        child: Container(
          width: 320,
          height: 120,
          decoration: BoxDecoration(
            color: Color(0xFFEDF0F7),
            borderRadius: BorderRadius.circular(8),
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: NetworkImageWithLoader(
                        borderRadius: BorderRadius.circular(8),
                        'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  Container(
                    width: 100,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black54,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SvgPicture.asset(
                        AssetsManager.BLOOD_AB_POSITIVE_ICON,
                        width: 35,
                      ),
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
