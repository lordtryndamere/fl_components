import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider & CheckBox')),
      body: Column(
        children: <Widget>[
          Slider.adaptive(
            value: _sliderValue,
            min: 50,
            max: 600,
            onChanged: _sliderEnabled
                ? (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  }
                : null,
            activeColor: AppTheme.primary,
          ),
          // Checkbox(value: _sliderEnabled, onChanged: (value) {
          //     setState(() {
          //       _sliderEnabled = value ?? false;
          //     });
          // },),
          CheckboxListTile(
            value: _sliderEnabled,
            onChanged: (value) {
              setState(() {
                _sliderEnabled = value ?? false;
              });
            },
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
          ),
          // Switch.adaptive(value: _sliderEnabled, onChanged: (value) {
          //     setState(() {
          //       _sliderEnabled = value;
          //     });
          //   },),

            SwitchListTile.adaptive(
            value: _sliderEnabled,
            onChanged: (value) {
              setState(() {
                _sliderEnabled = value;
              });
            },
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primary,
          ),
          const AboutListTile() ,
          Expanded(
            // Hace que el hijo llene el espacio disponible
            child: SingleChildScrollView(
              child: Image(
                  image: const NetworkImage(
                      'https://i.pinimg.com/474x/86/71/d8/8671d85f66240856514b5637eeaf7051.jpg'),
                  fit: BoxFit.contain,
                  width: _sliderValue),
            ),
          ),
        ],
      ),
    );
  }
}
