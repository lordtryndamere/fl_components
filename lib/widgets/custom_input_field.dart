import 'dart:developer';

import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key, this.hintText, this.labelText, this.helperText, this.icon, this.suffixIcon, this.keyboardType, this.obscureText=false, required this.formProperty, required this.formValues,
  }) : super(key: key);
  final String? hintText;
final String?  labelText;
final String?  helperText;
final IconData? icon;
final IconData? suffixIcon;
final TextInputType? keyboardType;
final bool obscureText;

final String formProperty;
final Map<String,dynamic> formValues;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: true,  //Pone el focus para escribir automatic
      initialValue: '', //Valor inicial del textFormField
      textCapitalization: TextCapitalization.words, //Ayudas para capitalizar lo que se escribe
      keyboardType:  keyboardType,
      obscureText:obscureText ,
      onChanged: (value) => {
        formValues[formProperty] = value
      },
      validator: (value){
        if(value == '') return 'This field is required';
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration:  InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        suffixIcon: suffixIcon != null ?  Icon(suffixIcon):null,
     //   prefixIcon: Icon(Icons.usb_off_rounded),
        icon: icon != null ? Icon(icon):null,
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.indigo
        //   ),
        //   //borderRadius: BorderRadius.all(Radius.circular(100)) //Todo redondo
        //   borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)) //Todo redondo
        // )
      ),
    );
  }
}