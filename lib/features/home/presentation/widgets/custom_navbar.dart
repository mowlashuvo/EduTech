import 'package:edutech/core/config/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../bloc/bottom_nav/bottom_nav_bloc.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
    required int selectedIndex,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: _selectedIndex == 0 ? ColorConstants.primaryColor : Colors.grey,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ad_units_sharp,
              color: _selectedIndex == 1 ? ColorConstants.primaryColor : Colors.grey,
            ),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _selectedIndex == 2 ? ColorConstants.primaryColor : Colors.grey,
            ),
            label: 'Profile',
          ),
        ],
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 20,
        onTap: (index) {
          context
              .read<BottomNavigationBarBloc>()
              .add(ChangeBottomNavigationBarEvent(index: index));
        },
        elevation: 20);
  }
}
