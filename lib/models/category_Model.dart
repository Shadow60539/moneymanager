import 'package:hive/hive.dart';
part 'category_Model.g.dart';
@HiveType(typeId: 0)
class CategoryModel {
  @HiveField(0)

  final String categoryName;
  @HiveField(1)
  final int totalAmount;

  CategoryModel(this.categoryName, this.totalAmount);
}
