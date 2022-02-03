import 'package:unit_test/core/enums/view_states.dart';
import 'package:unit_test/core/helper/dependency_injection.dart';
import 'package:unit_test/core/models/product.dart';
import 'package:unit_test/core/services/api_services.dart';
import 'package:unit_test/core/viewmodels/base_model.dart';

class ProductListViewModel extends BaseModel {
  final ApiService _apiService = injector<ApiService>();

  late List<Product> _products;

  List<Product> get products => _products;

  Future getProducts() async {
    changeState(ViewState.busy);
    _products = await _apiService.getProducts();
    changeState(ViewState.idle);
  }
}
