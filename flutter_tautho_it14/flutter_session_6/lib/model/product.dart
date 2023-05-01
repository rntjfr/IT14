class Product {
  final String image;
  final String title;
  final int price;
  final int star;
  final String sold;
  final String location;
  bool isLiked;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.star,
    required this.sold,
    required this.location,
    required this.isLiked,
  });
}
