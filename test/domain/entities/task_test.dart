import 'package:test/test.dart';
import 'package:dart_cli_task_manager/domain/entities/task.dart';
import 'package:dart_cli_task_manager/domain/value_objects/task_id.dart';
import 'package:dart_cli_task_manager/domain/value_objects/task_title.dart';
import 'package:dart_cli_task_manager/domain/value_objects/due_date.dart';

void main() {
  group('Task Entity (Immutable)', () {
    final taskId = TaskId('test-id');
    final title = TaskTitle('Initial Title');
    final now = DateTime.now();

    test('should be correctly initialized via Task.create factory', () {
      final task = Task.create(title: title);

      expect(task.id, isA<TaskId>());
      expect(task.title, equals(title));
      expect(task.isCompleted, isFalse);
      expect(task.dueDate, isNull);
    });

    test(
      'toggleComplete() should return a new instance with flipped status',
      () {
        final task = Task(
          id: taskId,
          title: title,
          createdAt: now,
          isCompleted: false,
        );

        final updatedTask = task.toggleComplete();

        expect(updatedTask.isCompleted, isTrue);
        expect(updatedTask.id, equals(task.id));
        // Verify immutability
        expect(task.isCompleted, isFalse);
      },
    );

    test('updateTitle() should return a new instance with updated title', () {
      final task = Task(id: taskId, title: title, createdAt: now);
      final newTitle = TaskTitle('New Title');

      final updatedTask = task.updateTitle(newTitle);

      expect(updatedTask.title, equals(newTitle));
      expect(task.title, equals(title));
    });

    test('clearDueDate() should return a new instance with null dueDate', () {
      final date = DueDate(DateTime.now().add(Duration(days: 1)));
      final taskWithDate = Task(
        id: taskId,
        title: title,
        createdAt: now,
        dueDate: date,
      );

      final clearedTask = taskWithDate.clearDueDate();

      expect(clearedTask.dueDate, isNull);
      expect(taskWithDate.dueDate, equals(date));
    });

    test(
      'isOverdue should return true only if incomplete and past the due date',
      () {
        final yesterday = DateTime.now().subtract(Duration(days: 1));
        final overdueTask = Task(
          id: taskId,
          title: title,
          createdAt: now,
          dueDate: DueDate(yesterday),
          isCompleted: false,
        );

        expect(overdueTask.isOverdue(), isTrue);

        final completedTask = overdueTask.toggleComplete();
        expect(completedTask.isOverdue(), isFalse);
      },
    );
  });
}
