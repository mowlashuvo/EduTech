import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../dashboard/presentation/pages/dashboard_screen.dart';
import '../bloc/bottom_nav/bottom_nav_bloc.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<BottomNavigationBarBloc>()
        .add(const ChangeBottomNavigationBarEvent(index: 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavigationBarBloc, BottomNavigationBarState>(
      listener: (context, state) {
        selectedIndex = state.tabIndex;
        pageController.jumpToPage(selectedIndex);
      },
      builder: (context, state) {
        return Scaffold(
            appBar: selectedIndex == 1
                ? CustomAppBar(
                    title: Text(
                      'All Courses',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                  )
                : null,
            backgroundColor: Theme.of(context).backgroundColor,
            body: SafeArea(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                allowImplicitScrolling: false,
                children: <Widget>[
                  DashboardScreen(),
                  Center(child: Text('Courses', style: Theme.of(context).textTheme.titleLarge,)),
                  Center(child: Text('Profile', style: Theme.of(context).textTheme.titleLarge,)),
                ],
                onPageChanged: (index) {
                  selectedIndex = index;
                  context
                      .read<BottomNavigationBarBloc>()
                      .add(ChangeBottomNavigationBarEvent(index: index));
                },
              ),
            ),
            bottomNavigationBar:
                CustomNavigationBar(selectedIndex: selectedIndex));
      },
    );
  }
}