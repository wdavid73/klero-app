import 'package:front_scaffold_flutter_v2/api/api.dart';

/// Defines the contract for fetching product data.
///
/// Implementations of this class are responsible for retrieving
/// product information from various sources.
abstract class ProductsDataSource {
  /// Retrieves a paginated list of products.
  ///
  /// Fetches products based on [limit] and [offset].
  ///
  /// Returns:
  ///   - [ResponseSuccess]: With a list of products and the HTTP status code.
  ///   - [ResponseFailed]: With an error if the operation fails.
  ///
  /// Parameters:
  ///   - [limit]: The maximum number of products to retrieve (default is 10).
  ///   - [offset]: The starting index for the product list (default is 0).
  ///
  Future<ResponseState> getProductByPage({int limit = 10, int offset = 0});
}