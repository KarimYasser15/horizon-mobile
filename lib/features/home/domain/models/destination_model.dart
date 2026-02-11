class DestinationModel {
  final String id;
  final String name;
  final String location;
  final double price;
  final String imageUrl;
  final bool isFavorite;

  DestinationModel({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
}
