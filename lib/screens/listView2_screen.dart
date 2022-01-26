import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  final listDragonBallCharacters = const <Map<String, String>>[
    {'name': 'Goku', 'description': 'Saiyajin criado en la tierra'},
    {'name': 'Vegueta', 'description': 'Principe de los saiyajin'},
    {'name': 'Krillin', 'description': 'Terricola muere mucho'},
    {'name': 'Brolly', 'description': 'Super saiyajin legendario'},
    {'name': 'Gohan', 'description': 'hijo de goku'},
    {'name': 'Goku', 'description': 'Saiyajin criado en la tierra'},
    {'name': 'Vegueta', 'description': 'Principe de los saiyajin'},
    {'name': 'Krillin', 'description': 'Terricola muere mucho'},
    {'name': 'Brolly', 'description': 'Super saiyajin legendario'},
    {'name': 'Gohan', 'description': 'hijo de goku'},
    {'name': 'Goku', 'description': 'Saiyajin criado en la tierra'},
    {'name': 'Vegueta', 'description': 'Principe de los saiyajin'},
    {'name': 'Krillin', 'description': 'Terricola muere mucho'},
    {'name': 'Brolly', 'description': 'Super saiyajin legendario'},
    {'name': 'Gohan', 'description': 'hijo de goku'},
    {'name': 'Goku', 'description': 'Saiyajin criado en la tierra'},
    {'name': 'Vegueta', 'description': 'Principe de los saiyajin'},
    {'name': 'Krillin', 'description': 'Terricola muere mucho'},
    {'name': 'Brolly', 'description': 'Super saiyajin legendario'},
    {'name': 'Gohan', 'description': 'hijo de goku'},
    {'name': 'Goku', 'description': 'Saiyajin criado en la tierra'},
    {'name': 'Vegueta', 'description': 'Principe de los saiyajin'},
    {'name': 'Krillin', 'description': 'Terricola muere mucho'},
    {'name': 'Brolly', 'description': 'Super saiyajin legendario'},
    {'name': 'Gohan', 'description': 'Hijo de goku'},
    {'name': 'Goku', 'description': 'Saiyajin criado en la tierra'},
    {'name': 'Vegueta', 'description': 'Principe de los saiyajin'},
    {'name': 'Krillin', 'description': 'Terricola muere mucho'},
    {'name': 'Brolly', 'description': 'Super saiyajin legendario'},
    {'name': 'Gohan', 'description': 'hijo de goku'},
  ];
  const ListView2Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ListView1Screen Tipo 2')),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  onTap: () => showAlertDialog(
                      context: context,
                      dataCharacter: listDragonBallCharacters[index]),
                  leading: const Icon(
                    Icons.data_usage_rounded,
                    color: Colors.indigo,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.indigo,
                  ),
                  title:
                      Text(listDragonBallCharacters[index]['name'].toString()),
                ),
            separatorBuilder: (_, __) => const Divider(
                  color: Colors.grey,
                ),
            itemCount: listDragonBallCharacters.length));
  }
}

showAlertDialog(
    {required BuildContext context,
    required Map<String, String> dataCharacter}) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("Salir"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("${dataCharacter['name']}"),
    content: Text('${dataCharacter['description']}'),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
