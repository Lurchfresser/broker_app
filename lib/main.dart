
import 'package:broker_app/2_application/pages/share_page/share_page.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SharePageWrapper(),
    );
  }
}
