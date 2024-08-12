// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Home Page"),
      ),
      body: const _HomeView(),
    );
  }
}

enum Category { history, math, software, tech }

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  Category selectedCategory = Category.history;
  List<Category> categoriesOption = Category.values.toList();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Categorías"),
      subtitle: Text('Selecciona tu categoría'),
      children: categoriesOption.map((category) {
        return RadioListTile(
          title: Text('by ${category.name}'),
          value: category,
          groupValue: selectedCategory,
          onChanged: (value) => setState(() {
            if (value != null) {
              selectedCategory = value;
            }
          }),
        );
      }).toList(),
    );
  }
}
