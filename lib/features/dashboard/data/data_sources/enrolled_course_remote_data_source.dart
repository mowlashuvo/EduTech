import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../core/config/constant.dart';
import '../../../../core/error/exception.dart';
import '../models/enrolled_course_model.dart';

abstract class EnrolledCourseRemoteDataSource {
  Future<EnrolledCourseModel> getEnrolledCourse();
  Future<EnrolledCourseModel> addEnrolledCourse({required String id});
  Future<EnrolledCourseModel> deleteEnrolledCourse({required String id});
}

class EnrolledCourseRemoteDataSourceImpl implements EnrolledCourseRemoteDataSource {
  @override
  Future<EnrolledCourseModel> getEnrolledCourse() async {
    // String url = '${Constant.baseUrl}/enrolled_course';
    //
    // final response = await http.get(Uri.parse(url), headers: {
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer ${GetStorage().read(Constant.apiToken)}',
    // });
    // if (kDebugMode) {
    //   print(url);
    //   print(response.body);
    //   print(response.statusCode);
    // }
    if (200 == 200) {
      String json = await loadJsonAsset();
      return EnrolledCourseModel.fromRawJson(json);
    } else {
      throw ServerException();
    }
  }

  Future<String> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString('assets/json/enrolled_course.json');
    return jsonString;
  }

  @override
  Future<EnrolledCourseModel> addEnrolledCourse({required String id}) async {
    // String url = '${Constant.baseUrl}/enrolled_course';
    //
    // final response = await http.post(Uri.parse(url), headers: {
    //   'Accept': 'application/json',
    //   'Authorization': 'Bearer ${GetStorage().read(Constant.apiToken)}',
    // }, body: {
    //   'product_id': id
    // });
    // if (kDebugMode) {
    //   print(url);
    //   print(response.body);
    //   print(response.statusCode);
    // }
    if (200 == 200) {
      String json = await loadJsonAsset();
      return EnrolledCourseModel.fromRawJson(json);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<EnrolledCourseModel> deleteEnrolledCourse({required String id}) async {
    String url = '${Constant.baseUrl}/enrolled_course/$id';

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
      return EnrolledCourseModel.fromRawJson(response.body);
    } else {
      throw ServerException();
    }
  }

}