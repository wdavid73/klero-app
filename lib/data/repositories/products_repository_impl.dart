import 'package:front_scaffold_flutter_v2/api/api.dart';
import 'package:front_scaffold_flutter_v2/domain/datasources/products_datasource.dart';
import 'package:front_scaffold_flutter_v2/domain/repositories/products_repository.dart';

/// Concrete implementation of [ProductsRepository].
///
/// Uses a [ProductsDataSource] to fetch product data.
class ProductsRepositoryImpl extends ProductsRepository {
  /// The data source for retrieving product information.
  final ProductsDataSource datasource;

  /// Creates a [ProductsRepositoryImpl].
  ///
  /// Requires a [ProductsDataSource] to fetch data
  ProductsRepositoryImpl(this.datasource);

  /// Retrieves a paginated list of products.
  ///
  /// Delegates the request to the underlying [ProductsDataSource].
  ///
  /// Parameters:
  ///   - [limit]: The maximum number of products (default is 10).
  ///   - [offset]: The starting index (default is 0).
  ///
  /// Returns:
  ///   - A [ResponseState] containing the products or an error.

  @override
  Future<ResponseState> getProductByPage({int limit = 10, int offset = 0}) {
    return datasource.getProductByPage(limit: limit, offset: offset);
  }
}