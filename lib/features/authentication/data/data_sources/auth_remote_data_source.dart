import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../core/config/constant.dart';
import '../../../../core/error/exception.dart';
import '../../domain/entities/registration.dart';
import '../models/login.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class AuthRemoteDataSource {
  Future<LoginModel> getUser({required String email, required String password});
  Future<LoginModel> googleUser();
  Future<LoginModel> addUser({required RegistrationEntity registration});
  // Future<LoginModel> updateUser({required String id});
  Future<void> deleteUser({required String id});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<LoginModel> getUser({required String email, required String password}) async {
    String url = '${Constant.baseUrl}/login';

    // final response = await http.post(Uri.parse(url), headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    // }, body: {
    //   'email': email,
    //   'password': password
    // });
    if (kDebugMode) {
      print(url);
      // print(response.body);
      // print(response.statusCode);
    }
    if (200 == 200) {
      String json = await loadJsonAsset();
      return LoginModel.fromRawJson(json);
    } else {
      throw ServerException();
    }
  }

  Future<String> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/json/login.json');
    return jsonString;
  }

  @override
  Future<LoginModel> googleUser() async {
    // String url = '${Constant.baseUrl}/socialLogin';
    //
    // final response = await http.post(Uri.parse(url), headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    // });
    // if (kDebugMode) {
    //   print(url);
    //   print(response.body);
    //   print(response.statusCode);
    // }
    if (200 == 200) {
      String json = await loadJsonAsset();
      return LoginModel.fromRawJson(json);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<LoginModel> addUser({required RegistrationEntity registration}) async {
    // String url = '${Constant.baseUrl}/register';
    //
    // final response = await http.post(Uri.parse(url), headers: {
    //   'Accept': 'application/json',
    //   // 'Authorization': 'Bearer ${GetStorage().read(Constant.apiToken)}',
    // }, body: {
    //   'product_id': 'id'
    // });
    // if (kDebugMode) {
    //   print(url);
    //   print(response.body);
    //   print(response.statusCode);
    // }
    if (200 == 200) {
      String json = await loadJsonAsset();
      return LoginModel.fromRawJson(json);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteUser({required String id}) async {
    String url = '${Constant.baseUrl}/favourite-products/$id';

    final response = await http.delete(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${GetStorage().read(Constant.apiToken)}',
    });
    if (kDebugMode) {
      print(url);
      print(response.body);
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      // return AuthModel.fromRawJson(response.body);
    } else {
      throw ServerException();
    }
  }

}