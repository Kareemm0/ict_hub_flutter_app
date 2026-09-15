import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_flutter/theme_cubit.dart';
import 'package:ict_hub_flutter/theme_state.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Center(
            child: Column(
              children: [
                Switch(
                  value: state.isDark,
                  onChanged: (v) {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                ),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: state.isDark ? Colors.amber : Colors.red,
                  ),
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  child: Text(state.isDark ? "Dark Theme" : "Light Theme"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
