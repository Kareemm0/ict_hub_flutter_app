import 'package:flutter/material.dart';
import 'package:ict_hub_flutter/cart_screen.dart';
import 'package:ict_hub_flutter/favorit_screen.dart';
import 'package:ict_hub_flutter/home_screen.dart';
import 'package:ict_hub_flutter/image_picker_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  List<Widget> screen = [
    HomeScreen(),
    ImagePickerScreen(),
    CartScreen(),
    FavoritScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        selectedItemColor: Colors.redAccent,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
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
      body: screen[currentIndex],
    );
  }
}
