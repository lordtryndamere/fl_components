import 'package:fl_components/widgets/widgets.dart';
import 'package:flutter/material.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'first_name': 'Kevin',
      'last_name': 'Romero',
      'email': 'iammaindiana@gmail.com',
      'password': '123456',
      'role': 'Admin'
    };
    return Scaffold(
        appBar: AppBar(title: const Text('Inputs y Forms')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: myFormKey,
              child: Column(
                children: <Widget>[
                  CustomInputField(
                    labelText: 'Nombre',
                    hintText: 'Nombre del usuario',
                    formProperty: 'first_name',
                    formValues: formValues,
                  ), // interactua con los formularios
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                      labelText: 'Apellido',
                      hintText: 'Apellido del usuario',
                      formProperty: 'last_name',
                      formValues: formValues),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                      labelText: 'Correo',
                      hintText: 'Email del usuario',
                      keyboardType: TextInputType.emailAddress,
                      formProperty: 'email',
                      formValues: formValues),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                      labelText: 'Contraseña',
                      hintText: 'contraseña',
                      obscureText: true,
                      formProperty: 'password',
                      formValues: formValues),
                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    hint: const Text('Rol'),
                    validator: (value) {
                      if (value == null) return 'This field is required';
                    },
                    onSaved:(newValue) {
                      
                    } ,
                    items: const [
                      DropdownMenuItem(value: 'admin', child: Text('Admin')),
                      DropdownMenuItem(value: 'user', child: Text('Client')),
                      DropdownMenuItem(value: 'rider', child: Text('Rider')),
                      DropdownMenuItem(value: 'senior', child: Text('Senior')),
                    ],
                    onChanged: (value) {
                      formValues['role'] = value ?? 'admin';
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                       //  FocusScope.of(context).requestFocus(FocusNode());
                        if (!myFormKey.currentState!.validate()) {
                          print('No valido');
                      //    FocusScope.of(context).requestFocus(FocusNode());
                        }

                        print(formValues);
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text('Guardar'),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ) // es como una lista pero con un elemento
        );
  }
}
