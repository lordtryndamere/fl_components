import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  final String urlImage;
  final String? description;
  const CustomCardType2({Key? key, required this.urlImage, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip
          .antiAlias, //En caso de que el hijo no respete la propiedad del padre,cortar lo que salga
      // por ejemplo la imagen se sale y no permite la forma redondeada con esto se corta y se aplica la propieda del padre en este caso la carta que siempre tiene bordes
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              15)), //Redondear aun mas la tarjeta con shape
      shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Column(
        children: <Widget>[
          FadeInImage(
              placeholder: const AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              fadeInDuration: const Duration(milliseconds: 400),
              height: 230,
              fit: BoxFit
                  .cover, // Hace que la imagen se ajuste al tamaño de su widget
              image: NetworkImage(urlImage)),
          if (description != null) //Ocultar o mostrar cosas segun valor
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: Text(description ?? 'NO TITLE',
                  style: const TextStyle(
                      color: AppTheme.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ) //FOrma para usar imagenes de internet
        ],
      ),
    );
  }
}
