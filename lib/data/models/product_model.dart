class ProductModel {
  final int? productId; // Make productId optional
  final List<String> images;
  final String title;
  final String category;
  final String details;

  ProductModel({
    this.productId, // Make productId optional in the constructor
    required this.images,
    required this.title,
    required this.category,
    required this.details,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() => {
        'productId':
            productId, // Include productId in the JSON representation if present
        'images': images,
        'title': title,
        'category': category,
        'details': details,
      };

  // Create a ProductModel from a JSON object
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<String> imageUrls = [];
    if (json['ImagesInfos'] != null) {
      imageUrls = List<String>.from(
        json['ImagesInfos'].map((imageJson) => imageJson['ImageURL']),
      );
    }

    return ProductModel(
      productId: json['ProductID'], // Assign the productId if present
      images: imageUrls,
      title: json['ProductName'],
      details: json['Description'],
      category: json['ProductCategory'],
    );
  }
}
