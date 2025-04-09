import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:p1_plotze_edm/screens/register_screen.dart';
import 'package:p1_plotze_edm/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _tryLogin(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('userEmail');
    final savedPassword = prefs.getString('userPassword');

    if (savedEmail == null || savedPassword == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Cadastro necessário'),
          content: const Text('Você precisa se cadastrar primeiro.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text('Ir para Cadastro'),
            ),
          ],
        ),
      );
      return;
    }

    if (_emailController.text == savedEmail && 
        _passwordController.text == savedPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email ou senha incorretos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _tryLogin(context),
              child: const Text('Entrar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text('Criar uma conta'),
            ),
          ],
        ),
      ),
    );
  }
}