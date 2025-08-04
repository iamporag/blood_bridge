import 'package:blood_bridge/src/bloc/bloc/nav_bar_bloc.dart';
import 'package:blood_bridge/src/constants/app_colors.dart';
import 'package:blood_bridge/src/presentation/screens/home/drawer/drawer_page.dart';
import 'package:blood_bridge/src/presentation/screens/home/fancy_home_screen.dart';
import 'package:blood_bridge/src/presentation/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, NavBarState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: IndexedStack(
            index: state.selectedItem.index,
            children: const [
              HomeScreen(),
              Chat(),
              // FancyHomeScreen(),
              // SearchScreen(),
              Profile(),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            elevation: 10,
            backgroundColor: AppColors.scaffoldBackground,
            onDestinationSelected: (int index) {
              final selectedItem = NavBarItem.values[index];
              context.read<NavBarBloc>().add(NavBarItemSelected(selectedItem));
            },
            selectedIndex: state.selectedItem.index,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(icon: Icon(Icons.message), label: "Chat"),
              NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8B0105),
        title: Text(
          'Chat',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("search"),
                ),
              ),
            ),
            Gap(20),
            ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.person_2_outlined),
                  ),
                  Positioned(
                      bottom: 8,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ))
                ],
              ),
              title: Text("another account"),
              subtitle: Text("last message"),
              trailing: Icon(Icons.more_vert),
            ),
            ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.person_2_outlined),
                  ),
                  Positioned(
                      bottom: 8,
                      right: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ))
                ],
              ),
              title: Text("Username"),
              subtitle: Text("last message"),
              trailing: Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}
