import 'package:flutter/material.dart';
import 'package:flutter_session_4/productbox.dart';

class ProductLayout extends StatelessWidget {
  const ProductLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List Page',
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: const [
          ProductBox(
            name: 'Shein Women Polo',
            description: 'Shein Women with floral design',
            price: 1500,
            image: 'assets/products/image_shop_1.jpg',
          ),
          ProductBox(
            name: 'Purple Jacket with Hoodie',
            description: 'UNIQLO Purple Jacket with Hoodie Cotton',
            price: 890,
            image: 'assets/products/image_shop_2.jpg',
          ),
          ProductBox(
            name: 'Women Grey Cardigan',
            description: 'Grey Cardigan for Women with Floral Design',
            price: 990,
            image: 'assets/products/image_shop_3.jpg',
          ),
          ProductBox(
            name: 'Blue Blouse',
            description: 'Penshoppe Blue Checkered Blouse',
            price: 899,
            image: 'assets/products/image_shop_4.jpg',
          ),
          ProductBox(
            name: 'Premium Leather Shoes',
            description: 'Imported Leather Footwear for Women',
            price: 7990,
            image: 'assets/products/image_shop_5.jpg',
          ),
          ProductBox(
            name: 'Adidas Premium Shoes',
            description: 'Adidas Shoes Version 1 for Men',
            price: 3990,
            image: 'assets/products/image_shop_6.jpg',
          ),
          ProductBox(
            name: 'Office Heels',
            description: 'Formal Office Shoes/Heels for Women',
            price: 4990,
            image: 'assets/products/image_shop_7.jpg',
          ),
          ProductBox(
            name: 'Adidas Running Shoes',
            description: 'Adidas Shoes Version 3 for Men',
            price: 3990,
            image: 'assets/products/image_shop_8.jpg',
          ),
          ProductBox(
            name: 'Adidas Bag',
            description: 'Red Adidas Premium Bag',
            price: 1990,
            image: 'assets/products/image_shop_9.jpg',
          ),
        ],
      ),
    );
  }
}
