import 'package:flutter/material.dart';
import 'package:flutter_session_6/model/product.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(product.image),
                  ),
                ),
              ),
              /*Image.asset(
                image,
                width: MediaQuery.of(context).size.width,
              ),*/
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        style: boldTitle,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      '₱${product.price}',
                      style: boldTitle,
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    loopStarRating(product.star),
                    Text(
                      product.sold,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    const Icon(Icons.add_location),
                    Text(product.location),
                  ],
                ),
              ),
              const Divider(
                thickness: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: const [
                    Text(
                      'Product Description',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  loopStarRating(star) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 1; i <= star; i++)
            const Icon(
              Icons.star,
              size: 16,
              color: Colors.yellow,
            ),
          for (int i = star; i < 5; i++)
            const Icon(
              Icons.star,
              size: 16,
            ),
        ],
      );
  var boldTitle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
}
