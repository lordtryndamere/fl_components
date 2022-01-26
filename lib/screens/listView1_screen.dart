import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  final listDragonBallCharacters = const <String>[
    'Goku',
    'Vegueta',
    'Krillin',
    'Brolly',
    'Gohan'
  ];
  const ListView1Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView1Screen 1'),
        ),
        body: ListView(
          //con los ... extraigo los elementos de la lista mapeada
          children: <Widget>[
            ...listDragonBallCharacters
                .map((String character) => ListTile(
                      style: ListTileStyle.list,
                      leading: const Icon(Icons.access_alarm),
                      title: Text(character),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ))
                .toList()
          ],
        ));
  }
}
