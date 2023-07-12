import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.title,
    required this.created,
    required this.lastUpdated,
    this.isCompleted = false,
    this.shortDesc,
  });

  final String title;
  final bool isCompleted;
  final String? shortDesc;
  final DateTime created;
  final DateTime lastUpdated;

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
  String toString() {
    return 'Todo{title: $title, isCompleted: $isCompleted, shortDesc: $shortDesc, created: $created, lastUpdated: $lastUpdated}';
  }

  @override
  List<Object?> get props => [title, isCompleted, shortDesc, created, lastUpdated];
}
