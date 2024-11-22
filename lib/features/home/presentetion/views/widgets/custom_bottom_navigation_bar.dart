import 'package:ecommerce_app/features/home/domin/entites/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_navigation_bar_item.dart';

class CustombottomNavigationBar extends StatefulWidget {
  const CustombottomNavigationBar({
    super.key,
  });

  @override
  State<CustombottomNavigationBar> createState() =>
      _CustombottomNavigationBarState();
}

class _CustombottomNavigationBarState extends State<CustombottomNavigationBar> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .09,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomNavigationBarlist.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = index;
                });
              },
              child: CustombottomNavigationBarItem(
                bottomNavigationBarEntity: bottomNavigationBarlist[index],
                isSelected: index == selectIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
