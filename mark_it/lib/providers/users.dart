import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String address;
  final String contact;
  final String email;

  User(
      {@required this.id,
      @required this.name,
      @required this.address,
      @required this.contact,
      this.email});
}

class UserDetails with ChangeNotifier {
  List<User> _users = [];
  List<User> getUser(String userId) {
    return _users.where((user) => user.id == userId).toList();
  }
}
