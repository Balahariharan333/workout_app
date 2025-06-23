
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/workout_todo_provider.dart';

class WorkoutsTab extends StatefulWidget {
  const WorkoutsTab({super.key});

  @override
  State<WorkoutsTab> createState() => _WorkoutsTabState();
}

class _WorkoutsTabState extends State<WorkoutsTab> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WorkoutTodoProvider>(context);
    final tasks = provider.tasks;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: "Enter workout task",
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  provider.addTask(_controller.text);
                  _controller.clear();
                },
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: Text("No workout tasks yet 💪"))
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Dismissible(
                        key: Key(task.title + index.toString()),
                        onDismissed: (_) => provider.deleteTask(task),
                        background: Container(color: Colors.redAccent, alignment: Alignment.centerLeft, padding: const EdgeInsets.only(left: 20), child: const Icon(Icons.delete, color: Colors.white)),
                        child: ListTile(
                          title: Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.isDone ? TextDecoration.lineThrough : null,
                            ),
                          ),
                          trailing: Checkbox(
                            value: task.isDone,
                            onChanged: (_) => provider.toggleDone(task),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
