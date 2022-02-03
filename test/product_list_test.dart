import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/core/helper/dependency_injection.dart';
import 'package:unit_test/core/models/product.dart';
import 'package:unit_test/core/services/api_services.dart';
import 'package:unit_test/core/viewmodels/product_list_view_model.dart';

class MockApi extends ApiService {
  @override
  Future<List<Product>> getProducts() {
    return Future.value([
      Product(1, "MacBook Pro 16-inch model", 2399, "imageUrl"),
      Product(2, "AirPods Pro", 249, "imageUrl"),
    ]);
  }
}

void main() {
  setUpInjections();
  var productListViewModel = injector<ProductListViewModel>();
  productListViewModel.apiService = MockApi();

  group('Given Product List Page Loads', () {
    test('Page should load a list of products from Api', () async {
      await productListViewModel.getProducts();

      expect(productListViewModel.products.length, 2);
    });
  });
}
