import 'package:flutter/material.dart';

class EditTaskScreen extends StatefulWidget {
  final String initialTask;
  
  const EditTaskScreen({super.key, required this.initialTask});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _taskController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: widget.initialTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Tarefa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: const InputDecoration(
                labelText: 'Editar Tarefa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_taskController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('A tarefa não pode estar vazia!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  Navigator.pop(context, _taskController.text);
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}