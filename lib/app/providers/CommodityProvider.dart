import 'package:eagrimarket/app/models/CommodityModel.dart';
import 'package:flutter/foundation.dart';

class CommodityProvider extends ChangeNotifier {
  final List _categories = [
    "Fruits",
    "Crops",
    "Vegetables",
  ];

  final Map _subcategories = {
    "Fruits": ["Orange", "Apple", "Banana", "Pineapple", "Strawberry"],
    "Crops": ["Wheat", "Barley", "Maize", "Cotton", "Rice"],
    "Vegetables": ["Ginger", "Cucumber", "Chilli", "Mint", "Potato"]
  };

  final List _storefresh = ["Store", "Fresh"];
  final List _units = ["Kg", "Dozen"];
  final List _origins = ["Citywide", "Countrywide"];

  List get units => _units;

  List get storefresh => _storefresh;
  var _commodityCategory;
  Map _commodityList = {};

  List<Map> _commodities = [];

  List<Map> get commodities => _commodities;

  Map get commodityList => _commodityList;

  List<CommodityModel> getFormattedCommoditiesList() {
    return _commodities.map((e) => CommodityModel.fromMap(e)).toList();
  }

  addCommodity(Map commodity) {
    _commodities.add(commodity);

    notifyListeners();
  }

  setCommodityList(List value) {
    value.removeWhere(
        (element) => !_subcategories[_commodityCategory].contains(element));
    _commodityList[_commodityCategory] = value;
    notifyListeners();
  }

  deleteCommodity(int index) {
    _commodities.removeAt(index);
    notifyListeners();
  }

  getCommodityList() {
    var res = _commodityList[_commodityCategory];
    if (res != null) return res;
    return [];
  }
  // set commodityList(List value) {
  //   value.removeWhere(
  //       (element) => !_subcategories[_commodityCategory].contains(element));
  //   _commodityList = value;
  //   notifyListeners();
  // }

  get commodityCategory => _commodityCategory;

  set commodityCategory(value) {
    if (value != _commodityCategory) {
      _commodityCategory = value;
      // resetCommodityList();
      notifyListeners();
    }
  }

  Map get subcategories => _subcategories;

  List get respectiveSubcategory => _subcategories[_commodityCategory];
  List get categories => _categories;

  resetCommodityList() {
    if (_commodityList.isNotEmpty) _commodityList = {};
    notifyListeners();
  }

  setCommoditiesData(index, key, data) {
    _commodities[index][key] = data;
    notifyListeners();
  }

  getCommoditiesData(index, key) {
    var res = _commodityList[_commodities[index][key]];
    if (res != null) return res;
    return [];
  }

  List get origins => _origins;
}
