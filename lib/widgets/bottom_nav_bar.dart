import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
   NavigationBarWidget({
    super.key,
    required this.ontap,
     required this.currentIndex,

  });

  void Function(int) ontap;
  int currentIndex;
  
   
  
  

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      onTap: ontap,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(left: 50),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
              ),
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {

            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(right: 50),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
              ),
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}