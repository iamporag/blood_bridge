// ignore_for_file: unused_local_variable, deprecated_member_use, prefer_interpolation_to_compose_strings

import 'dart:ui';

import 'package:blood_bridge/src/constants/app_colors.dart';
import 'package:blood_bridge/src/presentation/components/title_and_action_button.dart';

import 'package:blood_bridge/src/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_defaults.dart';
import '../../../constants/app_icons.dart';
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
      drawer: const Drawer(),
      key: scaffoldKey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ElevatedButton(
                  onPressed: () {
                    context.push(
                        Routes.DRAWER_SCREEN_ROUTE.path); // Opens the drawer
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF2F6F3),
                    shape: const CircleBorder(),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.sidebarIcon,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      context.push(Routes.SEARCH_ROUTE.path);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2F6F3),
                      shape: const CircleBorder(),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.search,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: ListTile(
                title: Text(
                  "Hello, User!",
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  'Welcome to Blood Bridge',
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: BannerSpace(),
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
    String donorName = "Donor's name".substring(0, 12);

    return Column(
      children: [
        TitleAndActionButton(
          onTap: () {},
          title: "Donor's List",
        ),
        SizedBox(
          height: 160.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            itemBuilder: (context, index) {
              return const donor_card();
            },
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppDefaults.padding),
            itemCount: 10, // Change this to the number of items you have
          ),
        ),
      ],
    );
  }
}

class donor_card extends StatelessWidget {
  const donor_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap
      },
      child: Container(
          width: 80.w, // Make it responsive
          margin: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding / 2),
          padding: const EdgeInsets.all(AppDefaults.padding),
          decoration: const BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.all(
                Radius.circular(AppDefaults.padding)),
          ),
          child: Row(
            children: [
              Expanded(
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
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "Flutter Developer",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      "Jamalpur Sadar Upazila",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
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
                          size:5.w,
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
              const Gap(5),
              SizedBox(
                width: 20.w,
                height: MediaQuery.of(context).size.height,
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

class DonorTileSquare extends StatelessWidget {
  const DonorTileSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.scaffoldBackground,
      borderRadius: AppDefaults.borderRadius,
      child: InkWell(
        onTap: () {},
        borderRadius: AppDefaults.borderRadius,
        child: Container(
          width: 190.w,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 65.w,
                  child: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: NetworkImageWithLoader(
                      'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Username Podufhudhfudhfuhdufhdu",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "(AB+)",
                  ),
                  Text("Username"),
                  Text("Username"),
                  Text("Username"),
                ],
              ),
            ],
          ),
        ),
      ),
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
          horizontal: MediaQuery.of(context).size.width * 0.04),
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
                    CustomButton(title: "AB+")
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

class NewDrawer extends StatelessWidget {
  const NewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Text("data"),
    );
  }
}
