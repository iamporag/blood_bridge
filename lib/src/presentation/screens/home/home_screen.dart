// ignore_for_file: unused_local_variable, deprecated_member_use, prefer_interpolation_to_compose_strings
import 'package:blood_bridge/src/constants/app_colors.dart';
import 'package:blood_bridge/src/presentation/components/title_and_action_button.dart';
import 'package:blood_bridge/src/presentation/screens/home/components/dialog.dart';

import 'package:blood_bridge/src/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_defaults.dart';
import '../../../constants/app_icons.dart';
import '../../../data/dummy/dummy_data_donors_list.dart';
import '../../../models/donors_model.dart';
import '../../../models/patient_model.dart';
import '../../../utils/assets_manager.dart';
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
      backgroundColor: theme.colorScheme.background,
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
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "Screen Size : ${screenWidth}",
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: BannerSpace(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
          separatorBuilder: (context, index) => Gap(5),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              width: 320, // Adjust width as needed
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
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
                      borderRadius: BorderRadius.circular(8),
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
                      padding: EdgeInsets.only(right: 5),
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
                                  color: Colors.orange, size: 12),
                              Gap(2),
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
      padding: EdgeInsets.only(right: AppDefaults.padding),
      child: Card(
        elevation: 2,
        color: Color(0xFFEDF0F7),
        child: Container(
          width: 320,
          height: 180 ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            onTap: () {
              showGeneralDialog(     
                context: context,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return BloodRequestInfo();
                },
                transitionBuilder: (ctx, anim1, anim2, child) =>
                    ScaleTransition(
                  alignment: Alignment.center,
                  scale: anim1,
                  child: child,
                ),
              );
            },
            splashColor: const Color.fromARGB(255, 168, 141, 141),
            borderRadius: BorderRadius.circular(12),
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          AssetsManager.BLOOD_AB_POSITIVE_ICON,
                          width: 35,
                        ),
                      ),
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
                            Expanded(
                              child: Text(
                                "Name of Paitent",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
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
                                maxLines: 1,
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
                  // const CustomButton(title: "View Info")
                ],
              ),
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
        color: AppColors.primary,
        borderRadius: borderRadius ??
            BorderRadius.only(
              topRight: Radius.circular(6),
              bottomLeft: Radius.circular(6),
            ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
              left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
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

class BloodRequestInfo extends StatelessWidget {
  BloodRequestInfo({super.key});

  final List<Patient> patients = [
    Patient(
      name: 'John Doe',
      medicalCondition: 'Kidney Damage',
      age: 45,
      bloodGroup: 'A+',
      hospital: 'City Hospital',
    ),
    Patient(
        name: 'Jane Smith',
        age: 30,
        bloodGroup: 'B-',
        hospital: 'Green Valley Clinic',
        medicalCondition: 'Rokto sunnota'),
  ];

  final List<Donor> donors = [
    Donor(
        name: 'Alice Brown',
        age: 28,
        bloodGroup: 'A+',
        donationDate: '2023-09-15'),
    Donor(
        name: 'Bob Johnson',
        age: 35,
        bloodGroup: 'O+',
        donationDate: '2023-09-20'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Confirmation",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false, // Ensures the remaining space is filled
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // Center the column
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center horizontally
              children: [
                Gap(10),
                ListTile(
                  title: Text(
                    "Patient Information",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF0F7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Patient Name",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "Jane Smith Jane Smith",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Divider(),
                          Text(
                            "Medical Condition",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "Kidney Damage",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Age",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "48",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Gender",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "Male",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Blood Group",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "AB(+) Positive",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Unit",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "1 bag",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              // First ListTile
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "02 Nov 2024",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Time",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "10.30 PM",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Text(
                            "Hospital Location",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "Jamalpur 250 Beded Genaral Hospital, Jamalpur Sadar.",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Attendant Information",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDefaults.padding,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF0F7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // First ListTile
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Attendant Name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "Mr. Example",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mobile",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "0123456789",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Refer Information",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDefaults.padding,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF0F7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Referred by",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "Account Holder Name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Relationship",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      "Friends",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Organization",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                "Blood Bridge",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Divider(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(20),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDefaults.padding),
                  child: Row(
                    children: [
                      Radio(value: 1, groupValue: 2, onChanged: (valie) {}),
                      Text(
                        "i agree with the terms and conditions",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDefaults.padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              color: Colors.red, // Red background color
                              borderRadius: BorderRadius.circular(100),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                splashColor:
                                    Colors.red.shade400, // Green splash color
                                onTap: () {
                                  // Handle tap event
                                  context.pop();
                                  print('Dismiss Tapped!');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 12.0),
                                  child: Center(
                                    child: Text(
                                      'Dismiss',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Material(
                              color: Colors.green, // Red background color
                              borderRadius: BorderRadius.circular(100),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                splashColor:
                                    Colors.green.shade400, // Green splash color
                                onTap: () {
                                  // Handle tap event
                                  print('Button Tapped!');
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.0, vertical: 12.0),
                                  child: Center(
                                    child: Text(
                                      'Accept',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20.0),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 0.0, right: 8.0),
//             child: Column(
//               children: [
//                 // Align(
//                 //   alignment: Alignment.topRight,
//                 //   child: IconButton.filled(
//                 //     onPressed: () {
//                 //       context.pop();
//                 //     },
//                 //     icon: Icon(Icons.close),
//                 //   ),
//                 // ),

//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: AppDefaults.padding),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Patient Name",
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                         Text(
//                           "Jane Smith Jane Smith",
//                           style: Theme.of(context).textTheme.titleSmall,
//                         ),
//                         Divider(),
//                         Text(
//                           "Medical Condition",
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                         Text(
//                           "Kidney Damage",
//                           style: Theme.of(context).textTheme.titleSmall,
//                         ),
//                         Divider(),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Age",
//                                     style:
//                                         Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                   Text(
//                                     "48",
//                                     style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Gender",
//                                     style:
//                                         Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                   Text(
//                                     "Male",
//                                     style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Divider(),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Blood Group",
//                                     style:
//                                         Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                   Text(
//                                     "AB(+) Positive",
//                                     style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Unit",
//                                     style:
//                                         Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                   Text(
//                                     "1 bag",
//                                     style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Divider(),
//                         Row(
//                           children: [
//                             // First ListTile
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Date",
//                                     style:
//                                         Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                   Text(
//                                     "02 Nov 2024",
//                                     style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Time",
//                                     style:
//                                         Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                   Text(
//                                     "10.30 PM",
//                                     style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Divider(),
//                         Row(
//                           children: [
//                             // First ListTile
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Attendance",
//                                     style:
//                                         Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                   Text(
//                                     "Mr. Example",
//                                     style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Mobile",
//                                     style:
//                                         Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                   Text(
//                                     "0123456789",
//                                     style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Divider(),
//                         Text(
//                           "Hospital Location",
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                         Text(
//                           "Jamalpur 250 Beded Genaral Hospital, Jamalpur Sadar.",
//                           style: Theme.of(context).textTheme.titleSmall,
//                         ),
//                         Divider(),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Refeer By",
//                                     style:
//                                         Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                   Text(
//                                     "Account Holder Name",
//                                     style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Relation",
//                                     style:
//                                         Theme.of(context).textTheme.bodyMedium,
//                                   ),
//                                   Text(
//                                     "Frients",
//                                     style:
//                                         Theme.of(context).textTheme.titleSmall,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Divider(),
//                       ],
//                     ),
//                   ),
//                 ),

//                 Row(
//                   children: [
//                     Radio(value: 2, groupValue: 2, onChanged: (balue) {}),
//                     Text('i agree with the terms and conditions'),
//                   ],
//                 ),
//                 Gap(20),

//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
