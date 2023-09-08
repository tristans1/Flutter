import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/styles.dart';

class TheForm extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final String buttonValue;
  final Function(String userName, String password) onSubmit;

  TheForm({super.key, this.buttonValue = 'Connexion', required this.onSubmit, User? initialUser}) {
    if(null != initialUser) {
      usernameController.text = initialUser.name;
      passwordController.text = initialUser.userPassword;
    }
  }

  void submit() {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      onSubmit(usernameController.text, passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (null != value && value.isNotEmpty && value.length < 5) {
                return "Votre nom d'utilisateur doit possèder au minimum 5 caractères";
              } else if (null != value && value.isEmpty) {
                return "Tapez votre nom d'utilisateur";
              }
              return null;
            },
            controller: usernameController,
            decoration: const InputDecoration(
                label: Text("Nom d'utilisateur"),
                hintText: 'user01',
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 24,
          ),
          TextFormField(
            controller: passwordController,
            validator: (value) {
              if (null != value && value.isNotEmpty && value.length < 5) {
                return "Votre mot de passe doit possèder au minimum 5 caractères";
              } else if (null != value && value.isEmpty) {
                return "Veuillez tapez votre mot de passe";
              }
              return null;
            },
            obscureText: true,
            decoration: const InputDecoration(
                label: Text("Mot de passe"),
                hintText: 'password01',
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: submit,
            style: buttonStyle,
            child: Text(buttonValue),
          ),
        ],
      ),
    );
  }
}