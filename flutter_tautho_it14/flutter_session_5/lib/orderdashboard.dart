import 'package:flutter/material.dart';
import 'package:flutter_session_5/productdetails.dart';
import 'package:flutter_session_5/productlist.dart';

class OrderDashboard extends StatelessWidget {
  const OrderDashboard({super.key});

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        image: 'assets/products/image_shop_1.jpg',
                        title: 'Shein Polo for Women',
                        price: 500,
                        star: 3,
                        sold: '99k sold',
                        location: 'Matina, Davao City, Davao del Sur',
                      ),
                    ),
                  );
                },
                child: const ProductList(
                  image: 'assets/products/image_shop_1.jpg',
                  title: 'Shein Polo for Women',
                  price: 500,
                  star: 3,
                  sold: '99k sold',
                  location: 'Matina, Davao City, Davao del Sur',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        image: 'assets/products/image_shop_2.jpg',
                        title: 'FUBU Purple Jacket for Women',
                        price: 3500,
                        star: 4,
                        sold: '1.5k sold',
                        location: 'Tagum City, Davao del Norte',
                      ),
                    ),
                  );
                },
                child: const ProductList(
                  image: 'assets/products/image_shop_2.jpg',
                  title: 'FUBU Purple Jacket for Women',
                  price: 3500,
                  star: 4,
                  sold: '1.5k sold',
                  location: 'Tagum City, Davao del Norte',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        image: 'assets/products/image_shop_3.jpg',
                        title: 'UNIQLO Leather Coat for Women',
                        price: 4500,
                        star: 5,
                        sold: '50 sold',
                        location: 'Poblacion, Mati City, Davao Orriental',
                      ),
                    ),
                  );
                },
                child: const ProductList(
                  image: 'assets/products/image_shop_3.jpg',
                  title: 'UNIQLO Leather Coat for Women',
                  price: 4500,
                  star: 5,
                  sold: '50 sold',
                  location: 'Poblacion, Mati City, Davao Orriental',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        image: 'assets/products/image_shop_4.jpg',
                        title: 'Checkered Lady Dress',
                        price: 900,
                        star: 2,
                        sold: '1.5k sold',
                        location: 'Bolton St. Davao City, Davao del Sur',
                      ),
                    ),
                  );
                },
                child: const ProductList(
                  image: 'assets/products/image_shop_4.jpg',
                  title: 'Checkered Lady Dress',
                  price: 900,
                  star: 2,
                  sold: '1.5k sold',
                  location: 'Bolton St. Davao City, Davao del Sur',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        image: 'assets/products/image_shop_6.jpg',
                        title: 'Adidas White Sneakers for Men',
                        price: 2100,
                        star: 4,
                        sold: '100 sold',
                        location: 'Davao City, Davao del Sur',
                      ),
                    ),
                  );
                },
                child: const ProductList(
                  image: 'assets/products/image_shop_6.jpg',
                  title: 'Adidas White Sneakers for Men',
                  price: 2100,
                  star: 4,
                  sold: '100 sold',
                  location: 'Davao City, Davao del Sur',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        image: 'assets/products/image_shop_7.jpg',
                        title: 'Black Shoes with heels for Women',
                        price: 2400,
                        star: 5,
                        sold: '100k sold',
                        location: 'Bolton St. Davao City, Davao del Sur',
                      ),
                    ),
                  );
                },
                child: const ProductList(
                  image: 'assets/products/image_shop_7.jpg',
                  title: 'Black Shoes with heels for Women',
                  price: 2400,
                  star: 5,
                  sold: '100k sold',
                  location: 'Bolton St. Davao City, Davao del Sur',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
