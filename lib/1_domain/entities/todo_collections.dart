import 'todo_color.dart';
import 'unique_id.dart';

class TodoCollection {
  final CollectionId id;
  final String title;
  final TodoColor color;

  TodoCollection({
    required this.id,
    required this.title,
    required this.color,
  });

  factory TodoCollection.empty() {
    return TodoCollection(
      id: CollectionId(),
      title: '',
      color: TodoColor(colorIndex: 0),
    );
  }
}
