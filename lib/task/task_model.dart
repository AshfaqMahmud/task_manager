enum Priority { high, medium, low }

class TaskModel {
  String id;
  String title;
  String? description;
  DateTime createdAt;
  DateTime? completedAt;
  DateTime? dueDate;
  Priority priority;
  //Category category;
  TaskModel({
    required this.id,
    required this.title,
    this.description,
    required this.createdAt,
    this.completedAt,
    this.dueDate,

    this.priority = Priority.low,
  });
}
