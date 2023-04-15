import 'package:flutter/material.dart';
import 'package:flutter_session_5/productdetails.dart';

class ProductList extends StatelessWidget {
  const ProductList(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.star,
      required this.sold,
      required this.location});

  final String image;
  final String title;
  final int price;
  final int star;
  final String sold;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 185,
        height: 320,
        child: Column(
          children: [
            Image.asset(
              image,
              width: 185,
              height: 185,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
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
                    '₱$price',
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
                  setStar(star),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      softWrap: false,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      sold,
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
                      location,
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
                        builder: (context) => ProductDetails(
                          image: image,
                          title: title,
                          price: price,
                          star: star,
                          sold: sold,
                          location: location,
                        ),
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
