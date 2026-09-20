import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_flutter/injection_container.dart';
import 'package:ict_hub_flutter/presentation/cubit/categories/category_cubit.dart';
import 'package:ict_hub_flutter/presentation/screens/cart_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/favorit_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/home_screen.dart';
import 'package:ict_hub_flutter/presentation/screens/image_picker_screen.dart';

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
    BlocProvider(
      create: (context) => getIt<CategoryCubit>(),
      child: CartScreen(),
    ),
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
