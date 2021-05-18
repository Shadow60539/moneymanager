import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:moneymanager/models/category_Model.dart';

import '../models/category_Model.dart';

class MoneyProvider with ChangeNotifier {
  void addCategory(CategoryModel categoryModel) {
    final categorymodeladapter = Hive.box("category");
    categorymodeladapter.add(categoryModel);
  }
}
