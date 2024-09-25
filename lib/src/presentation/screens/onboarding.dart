// ignore_for_file: unused_local_variable, use_key_in_widget_constructors

import 'dart:ui';

import 'package:blood_bridge/src/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/On Boarding/onboarding_bloc.dart';
import '../../models/item_mode.dart';
import '../../routes/routes.dart';
import '../../utils/assets_manager.dart';

class OnboardingScreen extends StatelessWidget {
  final List<ItemModel> onboardingTexts = [
    ItemModel(
        title: "Find Trusted Donner!",
        description:
            "With the Blood Bridge app, finding trusted blood donors has never been easier. The app allows you to search for verified donors in your area, ensuring that you connect with reliable individuals ready to donate.Blood Bridge is your go-to resource for securing safe and trustworthy blood donations when it matters most.",
        imageAsset: AssetsManager.ONBOARDING_1),
    ItemModel(
        title: "Choose Best Donner",
        description:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
        imageAsset: AssetsManager.ONBOARDING_1),
    ItemModel(
        title: "Why Blood Bridge?",
        description:
            "Blood Bridge is an innovative app designed to connect blood donors with those in urgent need of blood. The app streamlines the donation process by allowing users to easily find and contact nearby donors or donation centers. With real-time updates and a user-friendly interface, Blood Bridge aims to save lives by making blood donation more accessible and efficient.",
        imageAsset: AssetsManager.ONBOARDING_1),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final iconSize =
        mediaQuery.size.width * 0.04; // Icon size is 20% of the screen width

    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return BlocProvider(
        create: (_) => OnboardingBloc(context),
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
                child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(20, -1.2),
                  child: Container(
                    height: screenWidth,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.tertiary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(20, 1.2),
                  child: Container(
                    height: screenWidth,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.tertiary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-2.7, -1.2),
                  child: Container(
                    height: screenWidth / 1.3,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.secondary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(2.7, -1.2),
                  child: Container(
                    height: screenWidth / 1.3,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.secondary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-2.7, 1.2),
                  child: Container(
                    height: screenWidth / 1.3,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(2.7, 1.2),
                  child: Container(
                    height: screenWidth / 1.3,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.secondary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(2.7, -1.2),
                  child: Container(
                    height: screenWidth / 1.3,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primary),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    child: Column(
                      children: [
                        // PageView for onboarding content
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              context.go(Routes.REGISTRATION_SCREEN_ROUTE.path);
                            },
                            child: Text(
                              "Skip",
                              style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.colorScheme.outlineVariant,
                                  fontSize: 16.sp),
                            ),
                          ),
                        ),

                        Expanded(
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: onboardingTexts.length,
                            onPageChanged: (index) {
                              // Sync with bloc state when page changes manually
                              context
                                  .read<OnboardingBloc>()
                                  .add(PageChanged(index));
                            },
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Center(
                                    child: Text(
                                      onboardingTexts[index].title,
                                      style: theme.textTheme.headlineLarge
                                          ?.copyWith(
                                              color:
                                                  theme.colorScheme.onSurface,
                                              fontSize: 32
                                                  .sp), // Text color for contrast
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const Gap(10),
                                  Text(
                                    onboardingTexts[index].description,
                                    style: theme.textTheme.titleSmall?.copyWith(
                                        color: theme.colorScheme.outlineVariant,
                                        fontSize:
                                            12.sp), // Text color for contrast
                                    textAlign: TextAlign.center,
                                  ),
                                  const Gap(50),
                                  Center(
                                    child: SvgPicture.asset(
                                      onboardingTexts[index].imageAsset,
                                      height: screenWidth / 1.4.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              );
                            },
                          ),
                        ),
                        const Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              List.generate(onboardingTexts.length, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.bounceInOut,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              width: state.currentPage == index ? 24.0 : 24.0,
                              height: state.currentPage == index ? 6.0 : 6.0,
                              decoration: BoxDecoration(
                                color: state.currentPage == index
                                    ? Colors.redAccent.shade700.withOpacity(0.3)
                                    : Colors.tealAccent.shade700
                                        .withOpacity(0.3),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          }),
                        ),
                        const Gap(20),
                        if (state.currentPage < onboardingTexts.length - 1)
                          SizedBox(
                            child: CustomButton(
                                backgroundColor: Colors.green,
                                title: "Next",
                                onTap: () {
                                  // context
                                  //     .read<OnboardingBloc>()
                                  //     .add(PageChanged());
                                  // Move to the next page in the PageView
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }),
                          )
                        else
                          // Show 'Get Started' button if on the last page
                          SizedBox(
                            width: screenWidth.w,
                            child: CustomButton(
                                backgroundColor: Colors.redAccent,
                                title: "Get Started",
                                onTap: () {
                                  // context
                                  //     .read<OnboardingBloc>()
                                  //     .add(GetStartedTapped());
                                  context.go(
                                      Routes.REGISTRATION_SCREEN_ROUTE.path);
                                  // Handle transition to the main screen
                                }),
                          ),
                        const Gap(20),
                        // Show 'Next' button if not on the last page

                        // InkWell(
                        //   onTap: () {
                        //     // context
                        //     //     .read<OnboardingBloc>()
                        //     //     .add(GetStartedTapped());
                        //   },
                        //   child: Text(
                        //     "Skip",
                        //     style: TextStyle(
                        //       fontSize: 14.sp,
                        //       fontFamily: "Oswald",
                        //       color: Colors.grey.shade800.withOpacity(0.5),
                        //     ),
                        //   ),
                        // ),
                        // const Gap(20),
                      ],
                    ),
                  ),
                )
              ],
            )),
          );
        }));
  }
}
