class CommodityModel {
  String? category;
  String? name;
  String? fresh;
  String? unit;
  String? origin;
  String? price;

  CommodityModel(
      {this.category,
      this.name,
      this.fresh,
      this.unit,
      this.origin,
      this.price});

  factory CommodityModel.fromMap(Map data) {
    return CommodityModel(
        category: data['category'],
        name: data['name'],
        fresh: data['fresh'],
        unit: data['unit'],
        origin: data['origin'],
        price: data['price']);
  }
}
