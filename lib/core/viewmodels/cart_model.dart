import 'package:unit_test/core/models/product.dart';
import 'package:unit_test/core/viewmodels/base_model.dart';

class CartModel extends BaseModel {
  final List<Product> cartItems = [];

  void addToCart(Product product) {
    if (cartItems.contains(product)) return;
    cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    notifyListeners();
  }

  int getTotalPrice() {
    var totalPrice = 0;

    for (var product in cartItems) {
      totalPrice += product.price;
    }

    return totalPrice;
  }

  bool checkIfProductExistsInCart(Product product) {
    return cartItems.contains(product);
  }
}
