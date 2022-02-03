import 'package:flutter/material.dart';
import 'package:unit_test/core/constants/appbartitles.dart';
import 'package:unit_test/core/enums/view_states.dart';
import 'package:unit_test/core/viewmodels/product_list_view_model.dart';
import 'package:unit_test/ui/base_view.dart';
import 'package:unit_test/ui/widgets/product_card.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductListViewModel>(
      onModelReady: (model) => model.getProducts(),
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(productListPageTitle),
            ),
            body: SafeArea(
                child: model.viewState == ViewState.busy
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.products.length,
                        itemBuilder: (_, position) {
                          return ProductCard(model.products[position]);
                        })));
      },
    );
  }
}
