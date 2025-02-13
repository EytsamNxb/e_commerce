import 'package:ecommerce/features/product/presentation/home/home_view.dart';
import 'package:ecommerce/utils/AppColors.dart';
import 'package:ecommerce/features/authentication/presentation/forgot_password/forgot_password.dart';
import 'package:ecommerce/features/authentication/presentation/login/login_view.dart';
import 'package:ecommerce/features/authentication/presentation/signup/signup_view.dart';
import 'package:flutter/material.dart';

class TabbarView extends StatelessWidget {
  const TabbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Tabbar(),
    );
  }
}

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) => states.contains(WidgetState.selected)
                ? const TextStyle(color: Appcolors.PrimaryColor)
                : const TextStyle(color: Colors.black),
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.transparent,
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            TabbarItem(icon: Icons.home_outlined, title: "Home"),
            TabbarItem(icon: Icons.notifications_outlined, title: "Notifications",badgeCount: "3"),
            TabbarItem(icon: Icons.settings_outlined, title: "Settings"),
          ],
        ),
      ),
      body: <Widget>[
        HomeView(),
        SignupView(),
        LoginView()
      ][currentPageIndex],
    );
  }
}

class TabbarItem extends StatelessWidget {
  const TabbarItem({super.key, required this.icon, required this.title, this.badgeCount});
  final IconData icon;
  final String title;
  final String? badgeCount;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: badgeCount != null
          ? Badge(
              label: Text(badgeCount!),
              child: Icon(Icons.notifications_outlined),
            )
          : Icon(icon),
      selectedIcon: badgeCount != null
          ? Badge(
              label: Text(badgeCount!),
              child: Icon(Icons.notifications_outlined),
            )
          : Icon(
              icon,
              color: Appcolors.PrimaryColor,
            ),
      label: title,
    );
  }
}
