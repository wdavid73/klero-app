import 'package:front_scaffold_flutter_v2/config/config.dart';
import 'package:front_scaffold_flutter_v2/data/data.dart';

/// Maps JSON data to a [Product] entity.
///
/// This class provides a static method to convert a JSON map
/// into a `Product` object
class ProductMapper {
  /// Converts a JSON map to a [Product] entity.
  ///
  /// Extracts the `title`, `description`, `id`, `price`, and `images`
  /// from the JSON map and creates a `Product` object.
  ///
  /// The `images` field is processed to ensure that each image URL
  /// is complete, adding the base URL if necessary.
  ///
  /// Parameters:
  ///   - [json]: The JSON map containing product data.
  ///
  /// Returns:
  ///   - A [Product] object representing the data in the JSON map.
  static jsonToEntity(Map<String, dynamic> json) => ProductModel(
        title: json['title'],
        description: json['description'],
        id: json['id'],
        price: double.parse(json['price'].toString()),
        images: List<String>.from(
          json['images'].map((e) => e.startsWith('http')
              ? e
              : '${Environment.apiUrl}/files/product/$e'),
        ),
      );
}