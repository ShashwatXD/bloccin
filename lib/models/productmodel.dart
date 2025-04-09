class Product {
  final int id;
  final String title;
  final String image;
  final String description;
  final double price;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
    );
  }
}
