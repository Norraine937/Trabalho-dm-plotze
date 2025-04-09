import 'package:flutter/material.dart';

class TasksGridScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tasks;
  
  const TasksGridScreen({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas em Grade')),
      body: tasks.isEmpty
          ? const Center(child: Text('Nenhuma tarefa cadastrada!'))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
              ),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  color: tasks[index]['completed'] ? Colors.green[100] : null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          tasks[index]['completed'] ? Icons.check_circle : Icons.pending,
                          color: tasks[index]['completed'] ? Colors.green : Colors.orange,
                          size: 40,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tasks[index]['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: tasks[index]['completed'] 
                                ? TextDecoration.lineThrough 
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}