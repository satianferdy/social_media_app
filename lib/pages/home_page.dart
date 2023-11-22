import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

// logout method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home'),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
      drawer: MyDrawer(),
    );
  }
}
