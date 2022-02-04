import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/core/helper/dependency_injection.dart';
import 'package:unit_test/core/models/product.dart';
import 'package:unit_test/core/viewmodels/cart_model.dart';

void main() {
  group('Given the Cart Page loads', () {
    setUpInjections();
    var cartModel = injector<CartModel>();

    cartModel.addToCart(const Product(1, 'MacBook air', 2999, ''));

    cartModel.addToCart(const Product(1, 'MacBook air', 2999, ''));

    cartModel.addToCart(const Product(2, 'Iphone', 799, ''));

    test('Items should be added when add to cart is called', () {
      cartModel.addToCart(const Product(3, 'Lego Batman', 100, ''));
      expect(cartModel.cartItemsMapping.length, 3);
    });

    test('Items with same id should be grouped', () {
      expect(cartModel.cartItemsMapping.length, 3);
    });

    test('Page should denormalize items to give true item count', () {
      expect(cartModel.getCartItems().length, 4);
    });

    test('Total cost should be sum of individual products', () {
      expect(cartModel.getTotalPrice(), 6897);
    });

    test('Product should be removed', () {
      cartModel.removeFromCart(const Product(3, 'Lego Batman', 100, ''));
      expect(cartModel.getCartItems().length, 3);
    });

    test('Page should check if a product exists in cart', () {
      expect(
          cartModel.checkIfProductExistsInCart(
              const Product(3, 'Lego Batman', 100, '')),
          false);
    });
  });
}
