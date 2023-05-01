import 'package:flutter/material.dart';
import 'package:flutter_session_6/model/product.dart';
import 'package:flutter_session_6/productdetails.dart';
import 'package:flutter_session_6/productlist.dart';

class OrderDashboard extends StatelessWidget {
  OrderDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Order Page')),
      ),
      body: ListView(
        shrinkWrap: false,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  gotoProductDetails(context, product1);
                },
                child: ProductList(product: product1),
              ),
              GestureDetector(
                onTap: () {
                  gotoProductDetails(context, product2);
                },
                child: ProductList(product: product2),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  gotoProductDetails(context, product3);
                },
                child: ProductList(product: product3),
              ),
              GestureDetector(
                onTap: () {
                  gotoProductDetails(context, product4);
                },
                child: ProductList(product: product4),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  gotoProductDetails(context, product5);
                },
                child: ProductList(product: product5),
              ),
              GestureDetector(
                onTap: () {
                  gotoProductDetails(context, product6);
                },
                child: ProductList(product: product6),
              ),
            ],
          ),
        ],
      ),
    );
  }

  gotoProductDetails(context, product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetails(product: product),
      ),
    );
  }

  Product product1 = Product(
    image: 'assets/products/image_shop_1.jpg',
    title: 'Shein Polo for Women',
    price: 500,
    star: 3,
    sold: '99k sold',
    location: 'Matina, Davao City, Davao del Sur',
    isLiked: false,
  );
  Product product2 = Product(
    image: 'assets/products/image_shop_2.jpg',
    title: 'FUBU Purple Jacket for Women',
    price: 3500,
    star: 4,
    sold: '1.5k sold',
    location: 'Tagum City, Davao del Norte',
    isLiked: false,
  );
  Product product3 = Product(
    image: 'assets/products/image_shop_3.jpg',
    title: 'UNIQLO Leather Coat for Women',
    price: 4500,
    star: 5,
    sold: '50 sold',
    location: 'Poblacion, Mati City, Davao Orriental',
    isLiked: false,
  );
  Product product4 = Product(
    image: 'assets/products/image_shop_4.jpg',
    title: 'Checkered Lady Dress',
    price: 900,
    star: 2,
    sold: '1.5k sold',
    location: 'Bolton St. Davao City, Davao del Sur',
    isLiked: false,
  );
  Product product5 = Product(
    image: 'assets/products/image_shop_6.jpg',
    title: 'Adidas White Sneakers for Men',
    price: 2100,
    star: 4,
    sold: '100 sold',
    location: 'Davao City, Davao del Sur',
    isLiked: false,
  );
  Product product6 = Product(
    image: 'assets/products/image_shop_7.jpg',
    title: 'Black Shoes with heels for Women',
    price: 2400,
    star: 5,
    sold: '100k sold',
    location: 'Bolton St. Davao City, Davao del Sur',
    isLiked: false,
  );
}
