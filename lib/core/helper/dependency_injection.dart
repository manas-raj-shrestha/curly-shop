import 'package:get_it/get_it.dart';
import 'package:unit_test/core/services/api_services.dart';
import 'package:unit_test/core/viewmodels/product_list_view_model.dart';

GetIt injector = GetIt.instance;

void setUpInjections() {
  injector.registerLazySingleton<ApiService>(() => ApiService());
  injector.registerFactory<ProductListViewModel>(() => ProductListViewModel());
}
