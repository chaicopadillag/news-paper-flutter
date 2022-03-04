import 'package:flutter/material.dart';
import 'package:news_paper/app/providers/providers.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class CustomButtomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
        currentIndex: navigationProvider.currentIndex,
        onTap: (index) => navigationProvider.setCurrentIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Para ti',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Encabezados',
          ),
        ]);
  }
}
