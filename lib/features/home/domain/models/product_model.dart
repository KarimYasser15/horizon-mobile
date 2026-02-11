class ProductModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final double compareAtPrice;
  final String description;
  final String imageUrl;
  final int quantity;
  final String sku;
  final List<String> tags;
  final String variant;
  final bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.compareAtPrice,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    required this.sku,
    required this.tags,
    required this.variant,
    this.isFavorite = false,
  });

  factory ProductModel.fromFirestore(Map<String, dynamic> json, String id) {
    return ProductModel(
      id: id,
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      compareAtPrice: (json['compareAtPrice'] ?? 0).toDouble(),
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      quantity: json['quantity'] ?? 0,
      sku: json['sku'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      variant: json['variant'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'compareAtPrice': compareAtPrice,
      'description': description,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'sku': sku,
      'tags': tags,
      'variant': variant,
    };
  }
}
