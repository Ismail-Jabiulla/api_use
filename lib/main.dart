import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'newsHomepage.dart';

main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget{
  const myApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: HomeScreenPage01(),
    );
  }
}