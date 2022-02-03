import 'package:flutter/material.dart';
import 'package:unit_test/core/constants/appbartitles.dart';
import 'package:unit_test/core/enums/view_states.dart';

import 'package:unit_test/core/viewmodels/cart_model.dart';
import 'package:unit_test/core/viewmodels/product_list_view_model.dart';
import 'package:unit_test/ui/base_view.dart';
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
                  actions: [_buildCartButton(cartModel)],
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

  Widget _buildCartButton(CartModel cartModel) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
        Positioned(
            top: 0,
            right: 10,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.redAccent),
                child: Text(cartModel.cartItems.length.toString())))
      ],
    );
  }
}
