import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final int price;

  final String name;
  final String imageUrl;

  const Product(this.id, this.name, this.price, this.imageUrl);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(json['id'] ?? 0, json['name'] ?? '', json['price'] ?? 0,
        json['imageUrl'] ?? '');
  }

  @override
  List<Object?> get props => [id];
}
