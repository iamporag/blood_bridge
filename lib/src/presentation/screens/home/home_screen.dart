// ignore_for_file: unused_local_variable, deprecated_member_use, prefer_interpolation_to_compose_strings
import 'package:blood_bridge/src/presentation/components/title_and_action_button.dart';
import 'package:blood_bridge/src/presentation/screens/home/components/dialog.dart';

import 'package:blood_bridge/src/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_defaults.dart';
import '../../../constants/app_icons.dart';
import '../../../data/dummy/dummy_data_donors_list.dart';
import '../components/banner_space.dart';
import '../components/network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final iconSize =
        mediaQuery.size.width * 0.04; // Icon size is 20% of the screen width

    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListTile(
                leading: const CircleAvatar(
                  child: ClipOval(
                    child: NetworkImageWithLoader(
                        "https://images.pexels.com/photos/5840761/pexels-photo-5840761.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                  ),
                ),
                title: Text(
                  "Hello, User!",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Welcome to Blood Bridge',
                  style: theme.textTheme.titleSmall,
                ),
                trailing: IconButton(
                  color: Colors.grey,
                  onPressed: () {
                    context.push(Routes.SEARCH_ROUTE.path);
                  },
                  icon: SvgPicture.asset(AppIcons.search),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on_sharp,
                    size: 16,
                  ),
                  Text(
                    "Jamalpur,Sadar Upazila",
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: BannerSpace(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ElevatedButton(
                  onPressed: () {
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const VerifiedDialog();
                      },
                      transitionBuilder: (ctx, anim1, anim2, child) =>
                          ScaleTransition(
                        alignment: Alignment.center,
                        scale: anim1,
                        child: child,
                      ),
                    );
                  },
                  child: const Text("Request Blood"),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: DonorsList(),
            ),
            const SliverToBoxAdapter(
              child: BloodRequest(),
            ),
          ],
        ),
      ),
    );
  }
}

class DonorsList extends StatelessWidget {
  const DonorsList({super.key});

  @override
  Widget build(BuildContext context) {
    // String donorName = "Donor's name".substring(0, 12);

    List<Map<String, String>> data = dummyDataDonorList();

    return Column(
      children: [
        TitleAndActionButton(
          onTap: () {},
          title: "Donor's List",
        ),
        DonorsCard(data: data),
      ],
    );
  }
}

class DonorsCard extends StatelessWidget {
  const DonorsCard({
    super.key,
    required this.data,
  });

  final List<Map<String, String>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => Gap(5.w),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              width: 320, // Adjust width as needed
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
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: NetworkImageWithLoader(
                          data[index]['image']!,
                          fit: BoxFit.cover,
                        ),
                      )

                      // Image.network(
                      //   data[index]['image']!,

                      // ),
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
          }),
    );
  }
}

class BloodRequest extends StatelessWidget {
  const BloodRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndActionButton(
          onTap: () {},
          title: "Blood Request",
        ),
        const CustomRequestCard(
            imageURL:
                'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        const Gap(20),
        const CustomRequestCard(
            imageURL:
                'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        const Gap(20),
        const CustomRequestCard(
            imageURL:
                'https://images.pexels.com/photos/5384445/pexels-photo-5384445.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        const Gap(20),
      ],
    );
  }
}

class CustomRequestCard extends StatelessWidget {
  final String imageURL;
  const CustomRequestCard({
    super.key,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03),
      child: Card(
        elevation: 5,
        color: const Color(0xFFD9D9D9),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: ClipOval(
                            child: NetworkImageWithLoader(
                              imageURL,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Gap(5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              "30min ago",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const CustomButton(title: "AB+")
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04),
                  child: Divider(
                    color: Colors.grey.shade400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person_outline),
                          const Gap(5),
                          Text(
                            "Name of Paitent",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.schedule),
                          const Gap(5),
                          Text(
                            "12 Jun 2024 |",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Gap(5),
                          Text(
                            "10.30 AM",
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const Gap(5),
                          Expanded(
                            child: Text(
                              "Hospital Location or Donation Location",
                              style: Theme.of(context).textTheme.titleSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04),
                  child: Divider(
                    color: Colors.grey.shade400,
                  ),
                ),
                const CustomButton(title: "View info"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final String title;
  const CustomButton({
    super.key,
    this.borderRadius,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
        borderRadius: borderRadius ??
            BorderRadius.only(
              topRight: Radius.circular(6.r),
              bottomLeft: Radius.circular(6.r),
            ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
              left: 5.0.w, right: 5.0.w, top: 5.0.h, bottom: 5.0.h),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}


