import 'package:flutter/material.dart';

class ComponentDetailPage extends StatelessWidget {
  final String title;

  ComponentDetailPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('Details about $title', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
