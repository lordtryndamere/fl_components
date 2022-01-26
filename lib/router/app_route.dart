import 'package:fl_components/models/models.dart';
import 'package:flutter/material.dart';
import 'package:fl_components/screens/screens.dart';

class AppRoute {
  static const initalRoute = 'home';
  //Crear rutas a partir de este menu
  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listView1',
        icon: Icons.list,
        name: 'Tipo Lista 1',
        screen: const ListView1Screen()),
    MenuOption(
        route: 'listView2',
        icon: Icons.list_alt,
        name: 'Tipo Lista 2',
        screen: const ListView2Screen()),
    MenuOption(
        route: 'Alert',
        icon: Icons.alarm,
        name: 'ALertas',
        screen: const AlertScreen()),
    MenuOption(
        route: 'card',
        icon: Icons.card_giftcard,
        name: 'Cartas',
        screen: const CardScreen()),
    MenuOption(
        route: 'avatar',
        icon: Icons.umbrella_sharp,
        name: 'Avatars',
        screen: const AvatarScreen()),
    MenuOption(
        route: 'animated',
        icon: Icons.functions,
        name: 'Animated',
        screen: const AnimatedScreen()),
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {
      initalRoute: (BuildContext context) => const HomeScreen()
    };
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  //Forma normal de crear las runtas tambien serviria de manera normal
  /*static final routes = <String, Widget Function(BuildContext)>{
    'home': (BuildContext context) => const HomeScreen(),
    'listView1': (BuildContext context) => const ListView1Screen(),
    'listView2': (BuildContext context) => const ListView2Screen(),
    'alert': (BuildContext context) => const AlertScreen(),
    'card': (BuildContext context) => const CardScreen()
  };*/
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
