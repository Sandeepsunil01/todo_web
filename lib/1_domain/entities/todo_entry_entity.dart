import 'unique_id.dart';

class TodoEntry {
  final String decription;
  final bool isDone;
  final EntryId id;

  TodoEntry({
    required this.decription,
    required this.isDone,
    required this.id,
  });

  factory TodoEntry.empty() {
    return TodoEntry(
      id: EntryId(),
      decription: '',
      isDone: false,
    );
  }
}
