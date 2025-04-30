import 'package:front_scaffold_flutter_v2/domain/entities/product.dart';

/// A concrete implementation of the [Product] entity.
///
/// This class extends the [Product] entity and provides a specific
/// representation of a product, including its ID, title, price, description,
/// and images.
class ProductModel extends Product {
  /// Creates a [ProductModel] instance.
  ///
  /// Parameters:
  ///   - [id]: The unique identifier of the product.
  ///   - [title]: The title of the product.
  ///   - [price]: The price of the product.
  ///   - [description]: A description of the product.
  ///   - [images]: A list of image URLs for the product.
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.images,
  });

  /// Returns a string representation of the [ProductModel].
  ///
  /// This method overrides the default `toString()` method to provide a
  /// more informative string representation of the object, including its
  /// ID, title, price, description, and images.
  ///
  /// Returns:
  ///   - A string representation of the [ProductModel].
  @override
  String toString() {
    return "ProductModel {id: $id, title: $title, price: $price, description: $description, images: $images}";
  }
}