import 'package:fic9_ecommerce_app/common/constants/variabels.dart';
import 'package:fic9_ecommerce_app/data/model/requests/login_request_model.dart';
import 'package:fic9_ecommerce_app/data/model/requests/register_request_model.dart';
import 'package:fic9_ecommerce_app/data/model/response/auth_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/auth/local/register'),
      body: data.toJson(),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('Daftar Gagal');
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/auth/local'),
      body: data.toJson(),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return left('Login Gagal');
    }
  }
}
