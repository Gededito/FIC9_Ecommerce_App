import 'package:fic9_ecommerce_app/data/datasource/rajaongkir_remote_datasource.dart';
import 'package:fic9_ecommerce_app/data/model/response/city_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(const _Initial()) {
    on<_GetAllByProvinceId>((event, emit) async {
      emit(const _Loading());

      final response =
          await RajaOngkirRemoteDatasource().getCities(event.province);

      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.rajaongkir.results)),
      );
    });
  }
}
