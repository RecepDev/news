import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  String _category = "";
  String get category => _category;

  void changeCategoryTobusiness() {
    print("business olduuu");
    _category = "business";
    notifyListeners();
  }

  void changeCategoryToentertainment() {
    print("business olduuu");

    _category = "entertainment";
    notifyListeners();

  }

  void changeCategoryTogeneral() {
    _category = "general";
  }

  void changeCategoryTohealth() {
    _category = "health";
  }

  void changeCategoryToscience() {
    _category = "science";
  }

  void changeCategoryTosports() {
    _category = "sports";
  }

  void changeCategoryTotechnology() {
    _category = "technology";
  }

}
