import 'package:flutter/material.dart';
import 'package:unit_test/core/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? '',
                    style: ProductCardStyles.titleStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '\$ ${product.price.toString()}',
                    style: ProductCardStyles.subTitleStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Add to cart'))
                ],
              ),
            ),
            Image.network(
              product.imageUrl ?? '',
              height: 150,
              width: 150,
            )
          ],
        ),
      ),
    );
  }
}

class ProductCardStyles {
  static const titleStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const subTitleStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
}
