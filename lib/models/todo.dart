class Todo {
  Todo({required this.title, required this.dateTime});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      dateTime: DateTime.parse(json['dateTime']), // Corrigido para "dateTime"
    );
  }

  String title;
  DateTime dateTime;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
