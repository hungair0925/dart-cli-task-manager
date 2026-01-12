import 'dart:async';
import 'dart:developer';

import 'package:dart_cli_task_manager/domain/value_objects/due_date.dart';
import 'package:dart_cli_task_manager/domain/value_objects/task_id.dart';
import 'package:dart_cli_task_manager/domain/value_objects/task_title.dart';

class Task {
  final TaskId id;
  final TaskTitle title;
  final DateTime createdAt;
  final DueDate? dueDate;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.createdAt,
    this.dueDate,
    this.isCompleted = false,
  });

  factory Task.create({required TaskTitle title, DueDate? dueDate}) {
    return Task(
      id: TaskId.generate(),
      title: title,
      createdAt: DateTime.now(),
      dueDate: dueDate,
    );
  }

  Task toggleComplete() => _copyWith(isCompleted: !isCompleted);
  Task updateTitle(TaskTitle newTitle) => _copyWith(title: newTitle);
  Task updateDueDate(DueDate newDueDate) => _copyWith(dueDate: newDueDate);
  Task clearDueDate() {
    return Task(
      id: id,
      title: title,
      createdAt: createdAt,
      dueDate: null,
      isCompleted: isCompleted,
    );
  }

  bool isOverdue() {
    if (dueDate == null || isCompleted) {
      return false;
    }
    return dueDate!.value.isBefore(DateTime.now());
  }

  Task _copyWith({TaskTitle? title, DueDate? dueDate, bool? isCompleted}) {
    return Task(
      id: id,
      createdAt: createdAt,
      title: title ?? this.title,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
