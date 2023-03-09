import 'package:flutter/material.dart';
import 'task.dart';

List completedTasksList = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                // setState(() {
                //   completedTasksList = completedTasks;
                // });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompletedTaskPage()),
                );
              })
        ],
      ),
      body: TaskDisplay(),
    );
  }

  Widget CompletedTaskPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed Tasks"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemCount: completedTasks.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(completedTasks[index].getName()),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            thickness: 1.0,
          ),
        ),
      ),
    );
  }
}

class TaskDisplay extends StatefulWidget {
  @override
  State<TaskDisplay> createState() => TaskView();
}

class TaskView extends State<TaskDisplay> {
  Widget TasksList() {
    return ListView.separated(
      itemCount: tasks.length,
      separatorBuilder: (context, index) => const Divider(
        thickness: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        Task _currentTask = tasks[index];
        return ListTile(
          leading: IconButton(
            onPressed: () {
              setState(() {
                _currentTask.setCompleted(!_currentTask.isCompleted());
                completeTask(_currentTask);
              });
            },
            icon: Icon(
              _currentTask.isCompleted()
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: _currentTask.isCompleted() ? Colors.green : null,
            ),
          ),
          title: Text(_currentTask.getName()),
        );
      },
    );
  }

  Widget BottomNav() {
    final formKey = GlobalKey<FormState>();
    final taskController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      taskController.dispose();
      super.dispose();
    }

    return Form(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: TextFormField(
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some task!';
                }
                return value;
              },
              controller: taskController,
            ),
          ),
          ElevatedButton(
            child: Text("Submit"),
            onPressed: () {
              setState(() {
                tasks.add(Task(taskController.text));
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Expanded(child: TasksList()),
          BottomNav(),
        ],
      ),
    );
  }
}
