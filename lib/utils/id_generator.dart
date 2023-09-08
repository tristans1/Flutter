import 'package:tristan_seclet_flutter/repositories/user_repository.dart';

Future<int> getIdForUser() async {
  final count = await UserRepository().getCount();
  return count + 1;
}