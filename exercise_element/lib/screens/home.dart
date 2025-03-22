import 'package:exercise_element/models/cart.dart';
import 'package:exercise_element/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/catalog');
          },
          child: Text('Go to Exercise Catalog'),
        ),
      ),
    );
  }
}