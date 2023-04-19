import 'package:flutter/material.dart';
import 'package:flutter_session_5/model/product.dart';
import 'package:flutter_session_5/productdetails.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 185,
        height: 320,
        child: Column(
          children: [
            Image.asset(
              product.image,
              width: 185,
              height: 185,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      product.title,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Text(
                    '₱${product.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  setStar(product.star),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      product.sold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.add_location,
                    size: 18,
                  ),
                  Expanded(
                    child: Text(
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      product.location,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.thumb_up,
                    size: 15,
                    color: Colors.grey,
                  ),
                  label: const Text(
                    'LIKE',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(product: product),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    size: 15,
                    color: Colors.grey,
                  ),
                  label: const Text(
                    'VIEW',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  setStar(star) => Row(
        children: [
          for (int i = 1; i <= star; i++)
            const Icon(
              Icons.star,
              size: 15,
              color: Colors.yellow,
            ),
          for (int i = star; i < 5; i++)
            const Icon(
              Icons.star,
              size: 15,
            ),
        ],
      );
}
