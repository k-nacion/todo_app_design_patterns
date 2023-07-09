import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String title;
  final bool isCompleted;
  final String shortDesc;
  final DateTime created;
  final DateTime lastUpdated;

  const Todo({
    required this.title,
    this.isCompleted = false,
    required this.shortDesc,
    required this.created,
    required this.lastUpdated,
  });

  Todo copyWith({
    String? title,
    String? shortDesc,
    bool? isCompleted,
    DateTime? lastUpdated,
  }) {
    return Todo(
      title: title ?? this.title,
      created: created,
      isCompleted: isCompleted ?? this.isCompleted,
      shortDesc: shortDesc ?? this.shortDesc,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  List<Object> get props => [title, isCompleted, shortDesc, created, lastUpdated,];
}
