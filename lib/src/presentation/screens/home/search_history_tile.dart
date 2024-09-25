import 'package:blood_bridge/src/constants/app_defaults.dart';
import 'package:blood_bridge/src/presentation/screens/components/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'home_screen.dart';

class SearchHistoryTile extends StatelessWidget {
  const SearchHistoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap
      },
      child: Container(
          width: 80.w, // Make it responsive
          margin:
              const EdgeInsets.symmetric(horizontal: AppDefaults.padding / 2),
          padding: const EdgeInsets.all(AppDefaults.padding),
          decoration: const BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius:
                BorderRadius.all(Radius.circular(AppDefaults.padding)),
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 130.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CustomButton(title: "AB+"),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "Donor's Full Name",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        "Flutter Developer",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      Text(
                        "Jamalpur Sadar Upazila",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 5.w,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 5.w,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 5.w,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 5.w,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 5.w,
                          ),
                          Text(
                            "(5)",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Gap(5),
              SizedBox(
                width: 20.w,
                height: 120.h,
                child: const AspectRatio(
                  aspectRatio: 1 / 1,
                  child: NetworkImageWithLoader(
                    "https://img.freepik.com/free-photo/androgynous-avatar-non-binary-queer-person_23-2151100270.jpg?t=st=1727247907~exp=1727251507~hmac=1bd5b88144f796178dc5f9e626bc60a1e9a9ca2e8d61003979a342df889b9a6a&w=740",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
