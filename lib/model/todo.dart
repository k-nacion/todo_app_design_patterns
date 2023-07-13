import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.title,
    required this.created,
    required this.lastUpdated,
    this.isCompleted = false,
    this.shortDesc,
  });

  final String id;
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
      id: id,
      created: created,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      shortDesc: shortDesc ?? this.shortDesc,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, isCompleted: $isCompleted, shortDesc: $shortDesc, created: $created, lastUpdated: $lastUpdated}\n';
  }

  @override
  List<Object?> get props => [
        id,
        title,
        isCompleted,
        shortDesc,
        created,
        lastUpdated,
      ];
}
