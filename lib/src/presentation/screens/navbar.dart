import 'package:blood_bridge/src/bloc/bloc/nav_bar_bloc.dart';
import 'package:blood_bridge/src/constants/app_colors.dart';
import 'package:blood_bridge/src/presentation/screens/home/fancy_home_screen.dart';
import 'package:blood_bridge/src/presentation/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              FancyHomeScreen(),
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
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              // NavigationDestination(
              //     icon: Icon(Icons.search), label: "Search"),
              NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}












// NavigationBar(
//                 shadowColor: Colors.grey.withOpacity(0.2),
//                 elevation: 5,
//                 backgroundColor: Colors.transparent,
//                 onDestinationSelected: (int index) {
//                   final selectedItem = NavBarItem.values[index];
//                   context
//                       .read<NavBarBloc>()
//                       .add(NavBarItemSelected(selectedItem));
//                 },
//                 indicatorColor: Colors.red,
//                 selectedIndex: state.selectedItem.index,
//                 labelBehavior:
//                     NavigationDestinationLabelBehavior.alwaysHide,
//                 destinations: const [
//                   NavigationDestination(
//                       icon: Icon(Icons.home), label: "Home"),
//                   NavigationDestination(
//                       icon: Icon(Icons.search), label: "Search"),
//                   NavigationDestination(
//                       icon: Icon(Icons.person), label: "Cart"),
//                 ],
//               )
//               : null,