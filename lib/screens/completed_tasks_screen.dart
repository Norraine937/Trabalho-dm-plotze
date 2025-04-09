import 'package:flutter/material.dart';

class CompletedTasksScreen extends StatelessWidget {
  final List<Map<String, dynamic>> completedTasks;
  
  const CompletedTasksScreen({super.key, required this.completedTasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas Concluídas')),
      body: completedTasks.isEmpty
          ? const Center(
              child: Text('Nenhuma tarefa concluída ainda!'),
            )
          : ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(completedTasks[index]['title']),
                  leading: const Icon(Icons.check, color: Colors.green),
                );
              },
            ),
    );
  }
}