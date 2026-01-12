class DueDate {
  final DateTime value;

  DueDate(this.value);

  String get formatted => "${value.year}/${value.month}/${value.day}";

  @override
  bool operator ==(Object other) => other is DueDate && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => formatted;
}
