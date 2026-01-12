import 'package:test/test.dart';
import 'package:dart_cli_task_manager/domain/value_objects/task_title.dart';

void main() {
  group('TaskTitle', () {
    test(
      'should create a valid instance when title is within 1-30 characters',
      () {
        const validText = 'Buy a coffee';
        final title = TaskTitle(validText);

        expect(title.value, equals(validText));
      },
    );

    test('should throw ArgumentError when title is empty', () {
      expect(() => TaskTitle(''), throwsArgumentError);
    });
    test('should throw ArgumentError when title exceeds 30 characters', () {
      final longTitle = 'a' * 31;
      expect(() => TaskTitle(longTitle), throwsArgumentError);
    });

    test('should be equal when values are identical', () {
      const text = 'Shared Title';
      final title1 = TaskTitle(text);
      final title2 = TaskTitle(text);

      expect(title1, equals(title2));
    });

    test('toString() should return the underlying value', () {
      const text = 'Debug Label';
      final title = TaskTitle(text);

      expect(title.toString(), equals(text));
    });
  });
}
