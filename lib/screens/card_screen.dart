import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          CustomCardType1(),
          SizedBox(
            height: 5,
          ),
          CustomCardType2(
            description: 'Gohan',
            urlImage:
                'https://images.alphacoders.com/465/thumb-1920-465254.jpg',
          ),
          SizedBox(
            height: 5,
          ),
          CustomCardType2(
            description: 'Goku SSJ4',
            urlImage:
                'https://a-static.besthdwallpaper.com/full-power-super-saiyan-4-goku-de-dragon-ball-gt-dragon-ball-legends-arts-para-escritorio-papel-pintado-2560x1440-56093_51.jpg',
          ),
          SizedBox(
            height: 5,
          ),
          CustomCardType2(
            description: 'Goku SSJ3',
            urlImage: 'https://wallpaperaccess.com/full/2006454.jpg',
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
