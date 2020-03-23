import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Users {
  final String name;
  final String address;
  final String contact;
  final String email;

  Users(
      {@required this.name,
      @required this.address,
      @required this.contact,
      this.email});
}

class UserDetails with ChangeNotifier {
  Map
}
