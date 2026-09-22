import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        selectedItemColor: Colors.redAccent,
        currentIndex: navigationShell.currentIndex,
        onTap: (value) {
          navigationShell.goBranch(value);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: "Image"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_sharp),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
      body: navigationShell,
    );
  }
}
