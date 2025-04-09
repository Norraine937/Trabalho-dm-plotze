import 'package:flutter/material.dart';
import 'package:p1_plotze_edm/screens/add_task_screen.dart';
import 'package:p1_plotze_edm/screens/completed_tasks_screen.dart';
import 'package:p1_plotze_edm/screens/edit_task_screen.dart';
import 'package:p1_plotze_edm/screens/profile_screen.dart';
import 'package:p1_plotze_edm/screens/about_screen.dart';
import 'package:p1_plotze_edm/screens/tasks_grid_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> tasks = [
    {'title': 'Comprar leite', 'completed': false},
    {'title': 'Estudar Flutter', 'completed': false},
    {'title': 'Fazer exercícios', 'completed': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompletedTasksScreen(
                    completedTasks: tasks.where((task) => task['completed']).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(tasks[index]['title']),
            background: Container(color: Colors.red),
            onDismissed: (direction) {
              setState(() {
                tasks.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tarefa removida')),
              );
            },
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Confirmar'),
                  content: const Text('Deseja realmente excluir esta tarefa?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Excluir'),
                    ),
                  ],
                ),
              );
            },
            child: ListTile(
              title: Text(tasks[index]['title']),
              leading: Checkbox(
                value: tasks[index]['completed'],
                onChanged: (value) {
                  setState(() {
                    tasks[index]['completed'] = value;
                  });
                },
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTaskScreen(initialTask: tasks[index]['title']),
                    ),
                  ).then((editedTask) {
                    if (editedTask != null) {
                      setState(() {
                        tasks[index]['title'] = editedTask;
                      });
                    }
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          ).then((newTask) {
            if (newTask != null) {
              setState(() {
                tasks.add({'title': newTask, 'completed': false});
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Tarefas'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.grid_view),
              title: const Text('Visualização em Grade'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TasksGridScreen(tasks: tasks),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}