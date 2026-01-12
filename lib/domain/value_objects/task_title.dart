class TaskTitle {
  final String value;

  TaskTitle(this.value) {
    if (value.isEmpty) {
      throw ArgumentError('Task Title cannot be empty');
    }
    if (value.length > 30) {
      throw ArgumentError('Task title must be 30characters or less');
    }
  }

  @override
  bool operator ==(Object other) => other is TaskTitle && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}
