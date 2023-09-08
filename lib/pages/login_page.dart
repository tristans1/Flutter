import 'package:flutter/material.dart';
import 'package:tristan_seclet_flutter/pages/update_page.dart';
import 'package:tristan_seclet_flutter/widgets/the_link.dart';
import '../repositories/user_repository.dart';
import '../widgets/the_header.dart';
import '../widgets/the_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  late UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _userRepository = UserRepository();
  }

  Future<void> loginUser(String userName, String password) async {
    final user = await _userRepository.findUser(userName, password);
    if (!context.mounted) return;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Utilisateur introuvable"), backgroundColor: Colors.red));
      return;
    }
    final userId = user.id;
    if(userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Utilisateur introuvable"), backgroundColor: Colors.red));
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UpdatePage(userId: userId)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const TheHeader(
          title: "Connexion",
          subtitle: "Connectez vous à votre compte!",
          imagePath: 'assets/img/login.jpeg',
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TheForm(
            onSubmit: loginUser,
          ),
        ),
        theLink(context, 'Créer votre compte', '/register')
      ]),
    );
  }
}