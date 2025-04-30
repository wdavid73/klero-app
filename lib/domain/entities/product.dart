import 'base_entity.dart';

/// Represents a product entity in the application.
///
/// This class extends [BaseEntity] and includes properties specific to a
/// product, such as its title, price, description, and images.
class Product extends BaseEntity {
  /// The unique identifier of the product.
  @override
  final String id;

  /// The title of the product.
  final String title;

  /// The price of the product.
  final double price;

  /// A description of the product.
  final String description;

  /// A list of image URLs for the product.
  final List<String> images;

  /// Creates a [Product] instance.
  ///
  /// Parameters:
  ///   - [id]: The unique identifier of the product.
  ///   - [title]: The title of the product.
  ///   - [price]: The price of the product.
  ///   - [description]: A description of the product.
  ///   - [images]: A list of image URLs for the product.
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
  });
}