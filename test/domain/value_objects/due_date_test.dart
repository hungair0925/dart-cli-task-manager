import 'package:test/test.dart';
import 'package:dart_cli_task_manager/domain/value_objects/due_date.dart';

void main() {
  group('DueDate', () {
    test('should create a valid instance with future date', () {
      final futureDate = DateTime.now().add(Duration(days: 7));
      final dueDate = DueDate(futureDate);
      expect(dueDate.value, equals(futureDate));
    });

    test('shoud throw ArgumentError for past date', () {
      final pastDate = DateTime.now().subtract(Duration(days: 1));
      expect(() => DueDate(pastDate), throwsArgumentError);
    });
  });
}
