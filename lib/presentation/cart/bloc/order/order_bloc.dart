import 'package:fic9_ecommerce_app/data/datasource/order_remote_datasource.dart';
import 'package:fic9_ecommerce_app/data/model/requests/order_request_model.dart';
import 'package:fic9_ecommerce_app/data/model/response/order_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const _Initial()) {
    on<_Order>((event, emit) async {
      emit(const _Loading());
      final response = await OrderRemoteDatasource().order(event.requestModel);
      response.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}
