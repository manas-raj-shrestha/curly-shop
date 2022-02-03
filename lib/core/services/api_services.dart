import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unit_test/core/models/product.dart';

class ApiService {
  static String url =
      "https://gist.githubusercontent.com/manas-raj-shrestha/9989804d1169da570a0eed1b3b9170f3/raw/44e6f3bedea5aa86d377315bc6dc2a628d20c092/products.json";

  var client = http.Client();

  Future<List<Product>> getProducts() async {
    var products = <Product>[];
    var response = await client.get(Uri.parse(url));
    var data = json.decode(response.body)['products'] as List<dynamic>;

    for (var product in data) {
      products.add(Product.fromJson(product));
    }

    return products;
  }
}
