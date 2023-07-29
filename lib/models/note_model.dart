// Import the required package for Hive database
import 'package:hive/hive.dart';

// Import the generated part file, which is used for type adapters in Hive
part 'note_model.g.dart';

// Annotate the class with `@HiveType` to enable Hive to serialize/deserialize the objects
@HiveType(typeId: 0)
// Define the NoteModel class, extending HiveObject to use it with Hive
class NoteModel extends HiveObject {
  // Annotate each property with `@HiveField` to indicate the index in the serialized data
  // This index will be used for storing and retrieving data from the Hive database
  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  final String date;

  @HiveField(3)
  int color;

  // Constructor for the NoteModel class, requiring values for all properties
  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });
}
