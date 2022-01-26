import 'package:fl_components/router/app_route.dart';
import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text(AppRoute.menuOptions[index].name),
                leading: Icon(
                  AppRoute.menuOptions[index].icon,
                  color: AppTheme.primary,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppTheme.primary,
                ),
                onTap: () {
                  // final route = MaterialPageRoute(
                  //   builder: (context) => ListView2Screen());
                  //Navigator.push(context, route);
                  // Navigator.pushReplacement(context, route); este destruye la navegacion anterior lo cual quita el boton de atras
                  Navigator.pushNamed(
                      context, AppRoute.menuOptions[index].route);
                },
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: AppRoute.menuOptions.length),
    );
  }
}
