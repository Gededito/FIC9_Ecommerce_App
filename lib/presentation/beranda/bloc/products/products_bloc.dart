import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fic9_ecommerce_app/data/datasource/product_remote_datasource.dart';
import 'package:fic9_ecommerce_app/data/model/response/products_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const _Initial()) {
    on<_GetAll>((event, emit) async {
      emit(const _Loading());
      final response = await ProductRemoteDatasource().getAllProduct();
      response.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r)));
    });
  }
}
