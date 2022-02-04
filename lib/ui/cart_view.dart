import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_test/core/constants/appbartitles.dart';
import 'package:unit_test/core/models/product.dart';
import 'package:unit_test/core/viewmodels/cart_model.dart';

class CartView extends StatelessWidget {
  final CartModel cartModel;

  const CartView(this.cartModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(cartPageTitle)),
        body: SafeArea(
            child: ChangeNotifierProvider.value(
                value: cartModel,
                builder: (context, _) {
                  return Consumer<CartModel>(builder: (ctx, cartModel, _) {
                    return _buildListView(cartModel);
                  });
                })));
  }

  Widget _buildListView(CartModel cartModel) {
    List<Product> cartItems = cartModel.getCartItems();

    if (cartItems.isEmpty) {
      return const Center(child: Text('Your cart is empty'));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (_, position) {
                Product product = cartItems[position];
                return ListTile(
                    leading: Image.network(
                      product.imageUrl,
                      height: 75,
                      width: 75,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          cartModel.removeFromCart(product);
                        },
                        icon: const Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.redAccent,
                        )),
                    title: Text(product.name),
                    subtitle: Text('\$${product.price}'));
              }),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          Text('Total: \$${cartModel.getTotalPrice()}'),
          const SizedBox(
            height: 16,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.topRight,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Check Out')))
        ],
      ),
    );
  }
}
