import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:user_loader_flutter/domain/entities/user.dart';
import 'package:user_loader_flutter/domain/services/fetch_user_service.dart';
import 'package:user_loader_flutter/widgets/app_colors.dart';
import 'package:user_loader_flutter/widgets/custom_card.dart';
import 'package:user_loader_flutter/widgets/error_dialog.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  User? _user;

  void showError(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(message: text);
      },
    );
  }

  Future<void> _fetchUser() async {
    final String idText = _controller.text;
    final int? id = int.tryParse(idText);
    if (id == null || id < 1 || id > 12) {
      showError("ID inválido. Informe um número entre 1 e 12.");
      return;
    }

    setState(() {
      _isLoading = true;
      _user = null;
    });

    try {
      final service = FetchUserService();
      final fetchedUser = await service.fetchUser(id);
      setState(() {
        _user = fetchedUser;
      });
    } catch (e) {
      showError("Erro ao buscar usuário: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slate50,
      appBar: AppBar(
        backgroundColor: AppColors.indigo600,
        title: Row(
          children: const [
            Icon(LucideIcons.user, color: AppColors.slate100),
            SizedBox(width: 8),
            Text(
              'Buscador de Usuário',
              style: TextStyle(color: AppColors.slate100),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomCard(
                  height: 176,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Column(
                        children: [
                          _user != null
                              ? Row(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      _user!.avatar,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            LucideIcons.user,
                                            color: AppColors.indigo600,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            _user!.fullName,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            LucideIcons.mail,
                                            color: AppColors.indigo600,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(_user!.email),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                              : Center(
                                child: Column(
                                  children: [
                                    Icon(
                                      LucideIcons.users2,
                                      size: 64,
                                      color: AppColors.indigo600,
                                    ),
                                    const SizedBox(height: 16),
                                    const SizedBox(
                                      width: 256,
                                      child: Text(
                                        "Busque um usuário com um ID entre 1 e 12",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppColors.slate700,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Digite um ID (1-12)",
                                border: const OutlineInputBorder(),
                                labelStyle: const TextStyle(fontSize: 14),
                                prefixIcon: Icon(
                                  LucideIcons.hash,
                                  color: AppColors.slate600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: _isLoading ? null : _fetchUser,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.indigo600,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              minimumSize: const Size(64, double.infinity),
                            ),
                            child:
                                _isLoading
                                    ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              AppColors.slate100,
                                            ),
                                      ),
                                    )
                                    : Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(
                                          LucideIcons.search,
                                          color: AppColors.slate100,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          "Buscar",
                                          style: TextStyle(
                                            color: AppColors.slate100,
                                          ),
                                        ),
                                      ],
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
