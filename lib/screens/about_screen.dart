import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o Aplicativo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lista de Tarefas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Objetivo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Este aplicativo tem como objetivo ajudar os usuários a organizarem suas tarefas diárias, permitindo adicionar, editar e marcar tarefas como concluídas.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Equipe:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Dangler Nunes'),
              subtitle: const Text('Aluno/Dev'),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Norraine Nunes'),
              subtitle: const Text('Aluno/Dev'),
            ),
            const Spacer(),
            Center(
              child: Text(
                'Versão 1.0.0',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
