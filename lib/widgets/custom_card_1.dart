import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //Poner items abajo de otro con el widget Colum
      child: Column(
        children: [
          const ListTile(
            leading: Icon(
              Icons.photo_album_outlined,
              color: AppTheme.primary,
            ),
            title: Text('Goku'),
            subtitle: Text(
                'Nostrud esse amet ullamco officia. Consequat do magna voluptate nulla esse commodo laboris. Dolor nostrud consequat voluptate excepteur consequat proident qui est velit nulla elit elit. Dolore ipsum velit enim labore consequat est aliqua nulla dolor. Duis Lorem enim voluptate dolore mollit ex in aute laborum officia deserunt culpa nostrud in.'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                TextButton(onPressed: () {}, child: const Text('Ok')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
