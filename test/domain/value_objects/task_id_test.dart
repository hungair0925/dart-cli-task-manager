import 'package:test/test.dart';
import 'package:dart_cli_task_manager/domain/value_objects/task_id.dart';

void main() {
  group('TaskId', () {
    test('should be equal when values are identical', () {
      const String value = 'test-uuid-123';
      const id1 = TaskId(value);
      const id2 = TaskId(value);

      expect(id1, equals(id2));
    });

    test('should not be equal when values are different', () {
      const id1 = TaskId('task-abc');
      const id2 = TaskId('task-def');

      expect(id1, isNot(equals(id2)));
    });

    test('generate() should create unique id', () {
      final id1 = TaskId.generate();
      final id2 = TaskId.generate();

      expect(id1.value, isNotEmpty);
      expect(id1, isNot(equals(id2)));
    });
  });
}
