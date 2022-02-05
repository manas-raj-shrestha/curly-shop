import 'package:unit_test/core/models/product.dart';
import 'package:unit_test/core/utils/logger/app_logger.dart';
import 'package:unit_test/core/viewmodels/base_model.dart';

class CartModel extends BaseModel {
  Map<int, List<Product>> cartItemsMapping = {};

  late AppLogger logger;

  CartModel() {
    logger = AppLogger.instantiate(runtimeType.toString());
  }

  void addToCart(Product product) {
    if (cartItemsMapping.containsKey(product.id)) {
      var addedProducts = cartItemsMapping[product.id];
      addedProducts!.add(product);
      cartItemsMapping[product.id] = addedProducts;
    } else {
      cartItemsMapping[product.id] = [product];
    }

    notifyListeners();
  }

  List<Product> getCartItems() {
    List<Product> cartProducts = [];

    cartItemsMapping.forEach((key, value) {
      cartProducts.addAll(value);
    });

    return cartProducts;
  }

  int getTotalCartItems() {
    var itemCount = 0;
    cartItemsMapping.forEach((key, value) {
      itemCount += value.length;
    });
    return itemCount;
  }

  void removeFromCart(Product product) {
    if (!cartItemsMapping.containsKey(product.id)) return;

    var productItems = cartItemsMapping[product.id];
    productItems!.remove(product);
    cartItemsMapping[product.id] = productItems;

    if (cartItemsMapping[product.id]!.isEmpty) {
      cartItemsMapping.remove(product.id);
    }

    notifyListeners();
  }

  int getTotalPrice() {
    var totalPrice = 0;

    cartItemsMapping.forEach((prouctId, productList) {
      for (var product in productList) {
        totalPrice += product.price;
      }
    });

    return totalPrice;
  }

  bool checkIfProductExistsInCart(Product product) {
    return cartItemsMapping.containsKey(product.id);
  }
}
