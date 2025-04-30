part of 'products_bloc.dart';

/// Represents the state of the products.
///
/// Contains the list of products, loading status, error, pagination info.
class ProductsState extends Equatable {
  /// The list of products.
  final List<ProductModel> products;

  /// Indicates if products are being loaded.
  final bool isLoading;

  /// Contains an error message if an error occurred.
  final String? error;

  /// Indicates if the current page is the last page.
  final bool isLastPage;

  /// The maximum number of products per page.
  final int limit;

  /// The starting index for the current page.
  final int offset;

  /// Creates a [ProductsState].
  const ProductsState({
    this.products = const <ProductModel>[],
    this.isLoading = false,
    this.error = '',
    this.limit = 10,
    this.offset = 0,
    this.isLastPage = false,
  });

  @override
  List<Object?> get props => [products, isLoading, error, limit, offset];

  /// Creates a copy of this [ProductsState] with the given fields replaced.
  ProductsState copyWith({
    List<ProductModel>? products,
    bool? isLoading,
    String? error,
    int? limit,
    int? offset,
    bool? isLastPage,
  }) =>
      ProductsState(
        products: products ?? this.products,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        limit: limit ?? this.limit,
        offset: offset ?? this.offset,
        isLastPage: isLastPage ?? this.isLastPage,
      );
}