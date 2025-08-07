// ignore_for_file: camel_case_types, prefer_interpolation_to_compose_strings

import 'dart:math';
import 'package:blood_bridge/src/constants/app_defaults.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../theme/light_theme.dart';
import '../../data/dummy/dummy_data_donors_list.dart';
import '../components/app_back_button.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';
import 'components/network_image.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _searchPageHeader(),
          Gap(8),
          _recentSearchList(),
        ],
      )),
    );
  }
}

class _searchPageHeader extends StatelessWidget {
  const _searchPageHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding),
      child: Row(
        children: [
          const AppBackButton(),
          const SizedBox(width: 16),
          Expanded(
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(AppDefaults.padding),
                    child: SvgPicture.asset(
                      AppIcons.search,
                      colorFilter: const ColorFilter.mode(
                        AppColor.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(),
                  contentPadding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                textInputAction: TextInputAction.search,
                autofocus: true,
                onChanged: (String? value) {},
                onFieldSubmitted: (v) {
                  // Navigator.pushNamed(context, AppRoutes.searchResult);
                  debugPrint('SEARCH FIELD SUBMITTED');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _recentSearchList extends StatelessWidget {
  const _recentSearchList();

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> data = dummyDataDonorList();
    return Expanded(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Recent Search",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black),
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 16),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                height: 110, // Adjust width as needed
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.grey[200],
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     blurRadius: 5.r,
                  //     spreadRadius: 1.r,
                  //   ),
                  // ],
                ),
                child: Row(
                  children: [
                    // Image on the left side
                    SizedBox(
                      width: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: AspectRatio(
                            aspectRatio: 6 / 19,
                            child: NetworkImageWithLoader(
                              data[index]['image']!,
                              fit: BoxFit.cover,
                            ),
                          )

                          // Image.network(
                          //   data[index]['image']!,

                          // ),
                          ),
                    ),
                    const Gap(10),
                    // Text content on the right side
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    data[index]['name']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Text(
                                  " (" + data[index]['bloodType']! + ")",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            Text(
                              data[index]['occupation']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              data[index]['location']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange, size: 12.h),
                                Gap(2.w),
                                Text(
                                  data[index]['review']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              thickness: 0.5,
              color: AppColor.primary,
            ),
          ),
        ),
      ],
    ));
  }
}

class CustomPostCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const CustomPostCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            transform: GradientRotation(pi / 4)),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPostCardTwo extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final String title;
  final String description;

  const CustomPostCardTwo({
    super.key,
    required this.imageUrl,
    required this.isActive,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          // Image Side
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
                child: Image.network(
                  imageUrl,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              // Active Icon
              Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.check_circle,
                  color: isActive ? Colors.green : Colors.grey,
                  size: 24,
                ),
              ),
            ],
          ),
          // Text Side
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
