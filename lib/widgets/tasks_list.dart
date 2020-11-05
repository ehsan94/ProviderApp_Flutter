import 'package:flutter/material.dart';
import 'package:my_app/model/task_data.dart';
import 'package:my_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final taskItem = taskData.tasks[index];
            return TaskTile(
              taskTile: taskItem.name,
              isChecked: taskItem.isDone,
              checkboxCallback: (bool checkBoxState) {
                taskData.updateTask(taskItem);
              },
              longPressCallback: () {
                taskData.deleteTask(taskItem);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
