// ignore_for_file: unused_local_variable

import 'package:blood_bridge/src/presentation/screens/profile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomPostWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String time;
  final String quantity;

  const CustomPostWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.time,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.2),
        border: Border.all(width: 2,color: Colors.redAccent.withOpacity(0.2),),
        borderRadius: BorderRadius.circular(12.r)
      ),
      width: double.infinity, // Full width of the parent
      height: 125, // Responsive height
      child: Row(
        children: [
          // Image side
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              children: [
                Container(
                  width: 100, // Fixed width for image
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.r),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                    right: 0, bottom: 0, child: Icon(Icons.image)),
                // Positioned(
                //   bottom: 0,
                //   right: 0,
                //   child: Padding(
                //     padding: const EdgeInsets.all(5.0),
                //     child: CircleAvatar(
                //       radius:  16.r,
                //       backgroundColor: Colors.white,
                //       child: CircleAvatar(
                //         backgroundColor: const Color(0xffE41B1E).withOpacity(0.5),
                //         radius: 15.r,
                //         child: Center(
                //             child: Text("AB+",
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .bodySmall
                //                     ?.copyWith(fontWeight: FontWeight.bold))),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          // Content side
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 18.w,
                        color: const Color(0xff780606),
                      ),
                      const Gap(5),
                      Text(
                        title,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color(0xff780606),
                                  fontSize: 16.sp,
                                ),
                      ),
                    ],
                  ),
                  const Gap(2),
                  Row(
                    children: [
                      Icon(
                        Icons.inventory_sharp,
                        size: 18.w,
                        color: const Color(0xff780606),
                      ),
                      const Gap(5),
                      Text(
                        "Kidney Damage",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color(0xff780606),
                                  fontSize: 12.sp,
                                ),
                      ),
                    ],
                  ),
                  const Gap(2),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        size: 18.w,
                        color: const Color(0xff780606),
                      ),
                      const Gap(5),
                      Text(
                        quantity,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color(0xff780606),
                                  fontSize: 12.sp,
                                ),
                      ),
                    ],
                  ),
                  const Gap(2),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: const Color(0xff780606),
                        size: 18.w,
                      ),
                      const Gap(5),
                      Text(
                        time,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color(0xff780606),
                                  fontSize: 12.sp,
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
                        size: 18.w,
                        color: const Color(0xff780606),
                      ),
                      const Gap(5),
                      Expanded(
                        child: Text(
                          description,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: const Color(0xff780606),
                                fontSize: 12.sp,
                              ),
                          maxLines: 1,
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
    );
  }
}
