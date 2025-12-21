import 'package:uuid/uuid.dart';

class TaskId {
  final String value;

  const TaskId(this.value);
  factory TaskId.generate() {
    return TaskId(Uuid().v4());
  }

  // 値オブジェクトとしての等価とDartでの等価は違うため、オーバーライドする
  @override
  bool operator ==(Object other) => other is TaskId && value == other.value;

  // 同じ値オブジェクトでもでもデフォルトの挙動では、hashCodeが異なるため、オーバライドする
  @override
  int get hashCode => value.hashCode;
}
