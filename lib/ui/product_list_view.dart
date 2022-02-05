import 'package:flutter/material.dart';
import 'package:unit_test/core/constants/appbartitles.dart';
import 'package:unit_test/core/enums/view_states.dart';
import 'package:unit_test/core/helper/dependency_injection.dart';
import 'package:unit_test/core/theme/app_theme_provider.dart';
import 'package:unit_test/core/theme/app_themes.dart';

import 'package:unit_test/core/viewmodels/cart_model.dart';
import 'package:unit_test/core/viewmodels/product_list_view_model.dart';
import 'package:unit_test/ui/base_view.dart';
import 'package:unit_test/ui/cart_view.dart';
import 'package:unit_test/ui/widgets/product_card.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CartModel>(
      onModelReady: (CartModel cartModel) {},
      builder: (context, CartModel cartModel, child) {
        return BaseView<ProductListViewModel>(
          onModelReady: (model) => model.getProducts(),
          builder: (context, model, child) {
            return Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  title: const Text(productListPageTitle),
                  actions: [
                    buildThemeToggleButton(),
                    _buildCartButton(cartModel, context)
                  ],
                ),
                body: SafeArea(
                    child: model.viewState == ViewState.busy
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.products.length,
                            itemBuilder: (_, position) {
                              return ProductCard(
                                  model.products[position], cartModel);
                            })));
          },
        );
      },
    );
  }

  IconButton buildThemeToggleButton() {
    AppThemeProvider appThemeProvider = injector<AppThemeProvider>();
    return IconButton(
        onPressed: () {
          appThemeProvider.toggleTheme();
        },
        icon: appThemeProvider.currentTheme == CustomTheme.lightTheme
            ? const Icon(Icons.wb_sunny_rounded)
            : const Icon(Icons.wb_sunny_outlined));
  }

  Widget _buildCartButton(CartModel cartModel, BuildContext ctx) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(ctx).push(
                MaterialPageRoute(builder: (context) => CartView(cartModel)),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined)),
        Positioned(
            top: 0,
            right: 10,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent),
                child: Text(cartModel.getTotalCartItems().toString())))
      ],
    );
  }
}
