import 'package:get_it/get_it.dart';
import 'package:unit_test/core/services/api_services.dart';
import 'package:unit_test/core/theme/app_theme_provider.dart';
import 'package:unit_test/core/viewmodels/cart_model.dart';
import 'package:unit_test/core/viewmodels/product_list_view_model.dart';

GetIt injector = GetIt.instance;

void setUpInjections() {
  injector.registerLazySingleton<ApiService>(() => ApiService());
  injector.registerFactory<ProductListViewModel>(() => ProductListViewModel());

  injector.registerFactory<CartModel>(() => CartModel());

  injector.registerLazySingleton<AppThemeProvider>(() => AppThemeProvider());
}
