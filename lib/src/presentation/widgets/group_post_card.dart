import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../utils/assets_manager.dart';
import 'custom_svg_with_text.dart';

class PostCard extends StatelessWidget {
  final String svgAssetPath;
  final String title;
  final String description;
  final IconData icon;

  const PostCard({
    super.key,
    required this.svgAssetPath,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle tap event
      },
      borderRadius: BorderRadius.circular(8.0),
      splashColor: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // SVG Image
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    child: ClipOval(
                      child: SvgPicture.asset(
                        AssetsManager.ONBOARDING_1,
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60,
                      ),
                    ),
                  ),
                  const Gap(10),
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Color(0xff780606),
                    size: 35,
                  ),
                ],
              ),
            ),
            const Gap(10),

            // Text Column with Icon
            Expanded(
              child: Text(title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: const Color(0xff780606),
                      )),
            ),

            // Icon
          ],
        ),
      ),
    );
  }
}

class GroupCard extends StatelessWidget {
  final String title;

  const GroupCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          // Handle tap event
        },
        borderRadius: BorderRadius.circular(8.0),
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        focusColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
              child: Text(
            title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          )),
        ),
      ),
    );
  }
}

class CustomPostWidgetTwo extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String time;
  final String quantity;

  const CustomPostWidgetTwo({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.time,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: InkWell(
        onTap: () {
          // Handle tap event
        },
        borderRadius: BorderRadius.circular(8.0),
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        focusColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        child: Row(
          children: [
            // Image side
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(children: [
                Container(
                  width: 90.w, // Fixed width for image
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CustomCenterTextSvg(
                    text: 'AB+',
                    textStyle: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    svgPath: AssetsManager.BLOOD_DROP_ICON,
                  ),
                ),
              ]),
            ),
            // Content side
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: 16.w,
                          color: const Color(0xff780606),
                        ),
                        const Gap(5),
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Gap(2),
                    Row(
                      children: [
                        Icon(
                          Icons.inventory_sharp,
                          size: 16.w,
                          color: const Color(0xff780606),
                        ),
                        const Gap(5),
                        Text(
                          "Kidney Damage",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Gap(2),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_outline,
                          size: 16.w,
                          color: const Color(0xff780606),
                        ),
                        const Gap(5),
                        Text(
                          quantity,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Gap(2),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: const Color(0xff780606),
                          size: 16.w,
                        ),
                        const Gap(5),
                        Text(
                          time,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const Gap(2),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16.w,
                          color: const Color(0xff780606),
                        ),
                        const Gap(5),
                        Expanded(
                          child: Text(
                            description,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}

class CustomGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Gradient gradient;
  final Color splashColor;

  const CustomGradientButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.gradient,
    this.splashColor = Colors.red, // Default splash color is red
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: splashColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
