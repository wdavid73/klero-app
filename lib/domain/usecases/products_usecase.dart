import 'package:front_scaffold_flutter_v2/api/api.dart';
import 'package:front_scaffold_flutter_v2/domain/repositories/products_repository.dart';

/// Handles product-related use cases.
///
/// Uses a [ProductsRepository] to interact with product data.
class ProductsUseCase {
  /// The repository for product data.
  final ProductsRepository repository;

  /// Creates a [ProductsUseCase].
  ///
  /// Requires a [ProductsRepository].
  ProductsUseCase(this.repository);

  /// Retrieves a paginated list of products.
  ///
  /// Delegates the request to the [ProductsRepository].
  ///
  /// Parameters:
  ///   - [limit]: The maximum number of products (default is 10).
  ///   - [offset]: The starting index (default is 0).
  ///
  /// Returns:
  ///   - A [ResponseState] containing the products or an error.
  Future<ResponseState> getProductByPage({int limit = 10, int offset = 0}) {
    return repository.getProductByPage(limit: limit, offset: offset);
  }
}