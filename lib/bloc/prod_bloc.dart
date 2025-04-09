//bloc for product api
import 'dart:convert';
import 'package:blocbase/api/api.dart';
import 'package:blocbase/models/productmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// evnets
abstract class ProductEvent {}

class FetchProducts extends ProductEvent {}
class SearchProducts extends ProductEvent {
  final String query;
  SearchProducts(this.query);
}

// state
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<Product> _allProducts = [];

  ProductBloc() : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final response =
            await http.get(Uri.parse(globalapi));
        final data = json.decode(response.body) as List;
        final products = data.map((json) => Product.fromJson(json)).toList();
        _allProducts = products;
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError('Failed to load products: $e'));
      }
    });

    on<SearchProducts>((event, emit) {
      final filtered = _allProducts.where((product) =>
          product.title.toLowerCase().contains(event.query.toLowerCase())).toList();
      emit(ProductLoaded(filtered));
    });
  }
}