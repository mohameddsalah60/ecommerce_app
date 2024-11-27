import 'package:flutter/material.dart';

import 'widgets/custom_bottom_navigation_bar.dart';
import 'widgets/home_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _isSelected = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _isSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustombottomNavigationBar(
        selectIndex: _isSelected,
        onTap: _onBottomNavTapped,
      ),
      body: IndexedStack(
        index: _isSelected,
        children: const [
          SafeArea(child: HomeViewBody()),
        ],
      ),
    );
  }
}
