part of 'products_bloc.dart';

sealed class ProductsEvent {}

class LoadProductsEvent extends ProductsEvent {
  LoadProductsEvent();
}