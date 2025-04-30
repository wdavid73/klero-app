import 'package:dio/dio.dart';
import 'package:front_scaffold_flutter_v2/api/api.dart';
import 'package:front_scaffold_flutter_v2/data/data.dart';
import 'package:front_scaffold_flutter_v2/domain/datasources/products_datasource.dart';

/// Remote data source for retrieving products from the API.
///
/// Implements the `ProductsDataSource` interface and uses `ApiClient`
/// to perform HTTP requests.
class ApiProductDataSource implements ProductsDataSource {
  /// HTTP client for making API requests..
  final ApiClient _client;

  /// Constructor that receives an [ApiClient] for API communication.
  ApiProductDataSource(this._client);

  /// Fetches a paginated list of products from the API.
  ///
  /// Optional parameters:
  /// - [limit] The maximum number of products per page (default is 10).
  /// - [offset] The starting index for pagination (default is 0).
  ///
  /// Returns a `Future<ResponseState>` containing the products
  /// or an error in case of failure.

  @override
  Future<ResponseState> getProductByPage({
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      final response = await _client.get(
        ApiEndpoint.products,
        queryParams: {'limit': limit, 'offset': offset},
      );

      // Maps the JSON response to a list of products.
      final List<ProductModel> products = [];
      for (var product in response.data) {
        products.add(ProductMapper.jsonToEntity(product));
      }

      return ResponseSuccess(products, response.statusCode!);
    } catch (e) {
      // Error handling using DioException.
      DioException error = e as DioException;
      return ResponseFailed(
        DioException(
          error: e,
          type: error.type,
          message: error.message,
          requestOptions: RequestOptions(
            path: ApiEndpoint.products,
          ),
        ),
      );
    }
  }
}