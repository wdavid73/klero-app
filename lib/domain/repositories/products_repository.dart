import 'package:front_scaffold_flutter_v2/api/api.dart';

/// Defines the contract for a product repository.
///
/// Implementations handle product data operations.
abstract class ProductsRepository {
  /// Retrieves a paginated list of products.
  ///
  /// Parameters:
  ///   - [limit]: The maximum number of products (default is 10).
  ///   - [offset]: The starting index (default is 0).
  ///
  /// Returns:
  ///   - A [ResponseState] containing the products or an error
  Future<ResponseState> getProductByPage({int limit = 10, int offset = 0});
}