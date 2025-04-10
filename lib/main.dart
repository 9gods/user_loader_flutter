import 'package:flutter/material.dart';
import 'package:user_loader_flutter/screens/user_search_screen.dart';
import 'package:user_loader_flutter/widgets/app_colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserSearchScreen(),
      color: AppColors.slate50,
    );
  }
}
