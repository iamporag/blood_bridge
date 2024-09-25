import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/navigation/navigation_bloc.dart';
import '../../bloc/navigation/navigation_event.dart';
import '../../bloc/navigation/navigation_state.dart';
import 'home/home_screen.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.selectedIndex,
            children: [
              const Center(
                child: Text("Home Screen"),
              ),
              // HomeScreen(),
              SearchScreen(),
            ],
          ),
          bottomNavigationBar: state.isBottomNavBarVisible
              ? 
              BottomNavigationBar(
                  currentIndex: state.selectedIndex,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                  ],
                  onTap: (index) {
                    BlocProvider.of<NavigationBloc>(context).add(
                      ChangeTabEvent(index),
                    );
                  },
                ) : null ,
        );
      },
    );
  }
}


class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    
     return WillPopScope(
      onWillPop: () async{
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
        context.read<NavigationBloc>().add(HideBottomNavBarEvent());
        return false;
        // BlocProvider.of<NavigationBloc>(context)
        //     .add(HideBottomNavBarEvent(true));
      } 
      return true;
      },
       child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              focusNode: _focusNode,
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search...',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
           ),
     );
  }
}
