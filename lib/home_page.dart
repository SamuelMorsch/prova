import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> fazerLogout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final usuario = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => fazerLogout(context),
          ),
        ],
      ),
      body: Center(
        child: usuario != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(usuario.photoURL ?? ''),
              radius: 40,
            ),
            const SizedBox(height: 16),
            Text(usuario.displayName ?? 'Nome não disponível'),
            Text(usuario.email ?? 'E-mail não disponível'),
          ],
        )
            : const Text('Nenhum usuário autenticado.'),
      ),
    );
  }
}
