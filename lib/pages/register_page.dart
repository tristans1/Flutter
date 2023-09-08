import 'package:flutter/material.dart';
import 'package:tristan_seclet_flutter/models/user.dart';
import 'package:tristan_seclet_flutter/repositories/user_repository.dart';
import '../utils/id_generator.dart';
import '../widgets/the_link.dart';
import '../widgets/the_form.dart';
import '../widgets/the_header.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterPageState();
  }
}

class RegisterPageState extends State<RegisterPage> {
  late UserRepository _userRepository;
  @override
  void initState() {
    super.initState();
    _userRepository = UserRepository();
  }

  Future<void> registerUser(String userName, String password)  async {
    await _userRepository.insertUser(User(name: userName, userPassword: password, userId: await getIdForUser()));
    if(!context.mounted) return;
    Navigator.pushNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const TheHeader(
          title: "Let's create your account.",
          subtitle: "Welcome !",
          imagePath: 'assets/images/register.png',
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TheForm(
            buttonValue: 'Enregistrer',
            onSubmit: registerUser,
          ),
        ),
        theLink(context, 'Already registered ?', '/login')
      ]),
    );
  }
}