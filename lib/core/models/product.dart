class Product {
  int? id;
  int? price;

  String? name;
  String? imageUrl;

  Product(this.id, this.name, this.price, this.imageUrl);

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageUrl = json['imageUrl'];
  }
}
