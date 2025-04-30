part of 'products_bloc.dart';

mixin ProductsBlocHandler on Bloc<ProductsEvent, ProductsState> {
  Future<void> handlerLoadProducts(
    LoadProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    if (state.isLoading || state.isLastPage) return;

    emit(state.copyWith(isLoading: true, error: ''));

    final response = await (this as ProductsBloc).useCase.getProductByPage(
          limit: state.limit,
          offset: state.offset,
        );

    if (response is ResponseFailed) {
      emit(state.copyWith(
        error: response.error!.error.toString(),
        isLoading: false,
      ));
      return;
    }

    //* This condition is particularity of the example.
    if (response.data.isEmpty) {
      emit(state.copyWith(
        isLastPage: true,
        isLoading: false,
      ));
      return;
    }

    emit(state.copyWith(
      isLoading: false,
      isLastPage: false,
      offset: state.offset + 10,
      error: '',
      products: [
        ...state.products,
        ...response.data as List<ProductModel>,
      ],
    ));
  }
}