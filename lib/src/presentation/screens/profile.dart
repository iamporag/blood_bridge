// // ignore_for_file: unused_local_variable, deprecated_member_use

// ignore_for_file: unused_local_variable

import 'dart:math';
import 'dart:ui';

import 'package:blood_bridge/src/constants/app_defaults.dart';
import 'package:blood_bridge/src/presentation/screens/home/home_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../utils/assets_manager.dart';
import 'components/network_image.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final iconSize =
        mediaQuery.size.width * 0.04; // Icon size is 20% of the screen width

    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final coverHeight = screenHeight / 3.8;
    final profileHeight = screenHeight / 9.9;
    final top = coverHeight - profileHeight / 2;
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: BuildTop(),
            ),
          ),
          SliverToBoxAdapter(
            child: BuildContent(),
          ),
        ],
      ),
    );
  }
}

class BuildTop extends StatelessWidget {
  const BuildTop({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final iconSize =
        mediaQuery.size.width * 0.04; // Icon size is 20% of the screen width

    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final coverHeight = screenHeight / 3.8;
    // final profileHeight = screenHeight / 9.0;
    final profileHeight = screenHeight / 5.8;
    final top = coverHeight - profileHeight / 2;

    final bottom = profileHeight / 1.5;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: const BuildCoverImage(),
        ),
        Positioned(
          top: top,
          child: const BuildProfileImage(),
        ),
      ],
    );
  }
}

class BuildCoverImage extends StatelessWidget {
  const BuildCoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final iconSize =
        mediaQuery.size.width * 0.04; // Icon size is 20% of the screen width

    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final coverHeight = screenHeight / 3.8;

    return Stack(
      children: [
        Container(
          color: Colors.grey,
          child: CachedNetworkImage(
            imageUrl:
                "https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            width: double.infinity.w,
            height: coverHeight,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 20,
          right: 10,
          child: FrostContainer(
            radius: BorderRadius.circular(5.r),
            xcolors: Colors.white.withOpacity(0.1),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
          ),
        )
      ],
    );
  }
}

class BuildProfileImage extends StatelessWidget {
  const BuildProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final iconSize =
        mediaQuery.size.width * 0.04; // Icon size is 20% of the screen width

    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    final coverHeight = screenHeight / 3.8;
    final profileHeight = screenHeight / 5.8;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Stack(
        children: [
          CircleAvatar(
            radius: profileHeight * 0.55,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: profileHeight / 2,
              backgroundImage: const CachedNetworkImageProvider(
                  "https://yt3.ggpht.com/cdj87Hq90B40PnqWfUBQxV77ViQ2PUAdMXXKUaPbmNIzi_fEEJXJHp_oGBm5jBz5mvHrUMEamzY=s600-c-k-c0x00ffffff-no-rj-rp-mo"),
            ),
          ),
          Positioned(
              right: profileHeight * 0.01,
              bottom: profileHeight * 0.11,
              child: const FrostedGlassEffect(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.camera_alt_outlined),
                ),
              ))
        ],
      ),
    );
  }
}

class FrostContainer extends StatelessWidget {
  final Widget? child;
  final Color? xcolors;
  final BorderRadiusGeometry? radius;
  const FrostContainer({super.key, this.child, this.radius, this.xcolors});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ?? BorderRadius.circular(12.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: xcolors ??
                Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          ),
          child: child,
        ),
      ),
    );
  }
}

class BuildContent extends StatelessWidget {
  const BuildContent({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final coverHeight = screenHeight / 3.8;
    final profileHeight = screenHeight / 5.8;
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: "Profile Name",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: " (AB+)",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Text(
          'Flutter Developer',
          style: theme.textTheme.titleMedium?.copyWith(),
        ),
        Text(
          'Jamalpur Sadar Upazila',
          style: theme.textTheme.titleMedium?.copyWith(),
        ),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          child: Row(
            children: [
              Expanded(
                child: Card(
                  color: const Color(0xFFD9D9D9),
                  elevation: 5,
                  child: Container(
                    height: 165.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // const Spacer(),
                          Container(
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2.w,
                                    color: Colors.green),
                                shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                "100%",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Remaining 0 day",
                            style: theme.textTheme.titleSmall?.copyWith(),
                          ),
                          Expanded(
                            child: Text(
                              "Regenarate Cricle",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Expanded(
                child: SizedBox(
                  height: 170.h,
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                          color: const Color(0xFFD9D9D9),
                          elevation: 5,
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  const Spacer(),
                                  CircleAvatar(
                                    backgroundColor: const Color(0xFFD1D2D3),
                                    radius: 20.r,
                                      child: ClipOval(
                                    child: Icon(
                                      Icons.scale_sharp,
                                      size: 8.w,
                                      color: Colors.red,
                                    ),
                                  ),),
                                  const Spacer(),
                                  Text(
                                    "12 Jun 2024",
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(5),
                      Expanded(
                        child: Card(
                          color: const Color(0xFFD9D9D9),
                          elevation: 5,
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  const Spacer(),
                                  CircleAvatar(
                                    backgroundColor:const Color(0xFFD1D2D3),
                                    radius: 20.r,
                                      child: ClipOval(
                                    child: Icon(
                                      Icons.history,
                                      size: 8.w,
                                      color: Colors.red,
                                    ),
                                  ),),
                                  const Spacer(),
                                  Text(
                                    "All History",
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(20),
        ListTile(
          title: Text(
            "Recent Activity",
            style: theme.textTheme.titleLarge?.copyWith(
              color: const Color(0XFF880808),
            ),
          ),
        ),
        const CustomRequestCard(imageURL: 'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        const Gap(20),
        const CustomRequestCard(imageURL: 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        const Gap(20),
        const CustomRequestCard(imageURL: 'https://images.pexels.com/photos/5384445/pexels-photo-5384445.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      ],
    );
  }
}

class FrostedGlassEffect extends StatelessWidget {
  final Widget? child;
  final Color? xcolors;
  final BorderRadiusGeometry? radius;
  const FrostedGlassEffect({super.key, this.child, this.radius, this.xcolors});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(pi / 4),
                  colors: [
                Colors.white.withOpacity(0.2),
                Colors.black.withOpacity(0.2),
              ])),
          child: child,
        ),
      ),
    );
  }
}
