import 'package:flutter/material.dart';
import 'package:cryptic_mobile/login_screen.dart';
import 'package:cryptic_mobile/locator.dart';
//import 'package:cryptic_mobile/login_check.dart';

void main() { 
  setup_locator();
  print("Setuped Locator");
  runApp(MaterialApp(home: LoginScreen()));  
}

