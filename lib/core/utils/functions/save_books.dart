// ميثود مسؤله عن حفظ الداتا في اللوكل
import 'package:bokly_app/Features/home/domain/entitys/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
