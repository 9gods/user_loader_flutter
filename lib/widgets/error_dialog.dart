import 'package:flutter/material.dart';
import 'package:user_loader_flutter/widgets/app_colors.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  final String title;

  const ErrorDialog({super.key, required this.message, this.title = "Erro!"});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.red600,
      title: Text(title, style: const TextStyle(color: Colors.white)),
      content: Text(message, style: const TextStyle(color: Colors.white)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Fechar", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
