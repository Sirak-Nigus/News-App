import 'package:mekelletimes/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
    );
  }
}
