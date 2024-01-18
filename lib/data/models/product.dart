import 'package:fakestoreapp/data/models/review.dart';

class Product {
  int? productid;
  String? name;
  String? description;
  double? price;
  String? unit;
  String? image;
  int? discount;
  bool? availability;
  String? brand;
  String? category;
  double? rating;
  List<Review?>? reviews;

  Product(
      {this.productid,
      this.name,
      this.description,
      this.price,
      this.unit,
      this.image,
      this.discount,
      this.availability,
      this.brand,
      this.category,
      this.rating,
      this.reviews});

  Product.fromJson(Map<String, dynamic> json) {
    productid = json['product_id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    unit = json['unit'];
    image = json['image'];
    discount = json['discount'];
    availability = json['availability'];
    brand = json['brand'];
    category = json['category'];
    rating = json['rating'];
    if (json['reviews'] != null) {
      reviews = <Review>[];
      json['reviews'].forEach((v) {
        reviews!.add(Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productid;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['unit'] = unit;
    data['image'] = image;
    data['discount'] = discount;
    data['availability'] = availability;
    data['brand'] = brand;
    data['category'] = category;
    data['rating'] = rating;
    data['reviews'] =
        reviews != null ? reviews!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}
