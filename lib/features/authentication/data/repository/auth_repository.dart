// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:get_storage/get_storage.dart';
// import '../../../../models/models.dart';
//
// import '../../../../config/constant.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../../repositories/repositories.dart';
//
// class AuthRepository implements BaseAuthRepository {
//   @override
//   Future<Object> createUser(RegistrationModel registration) async {
//     String url = '${Constant.baseUrl}/register';
//     Map<String, String> headers = {
//       'Accept': 'application/json',
//       // 'Authorization': '<Your token>'
//     };
//     try {
//       final response = await http.post(Uri.parse(url), headers: headers, body: {
//         'name': registration.name.toString(),
//         'email': registration.email.toString(),
//         'mobile': registration.mobile.toString(),
//         'password': registration.password.toString(),
//         'password_confirmation': registration.confirmPassword.toString(),
//       });
//
//       if (kDebugMode) {
//         print(response.body);
//         print(response.statusCode);
//       }
//       if (response.statusCode == 200) {
//         if (jsonDecode(response.body)["message"] ==
//             'The email has already been taken.') {
//           return jsonEncode({
//             'status_code': '500',
//             'message': 'The email has already been taken.',
//           });
//         } else {
//           return jsonEncode({
//             'status_code': '200',
//             'message': jsonDecode(response.body)["message"] ?? 'Successful',
//           });
//         }
//       } else {
//         return jsonEncode({
//           'status_code': '302',
//           "message": 'Invalid Email',
//         });
//       }
//     } on SocketException catch (_) {
//       // make it explicit that a SocketException will be thrown if the network connection fails
//       return jsonEncode({
//         'status_code': '302',
//         "message": 'Invalid Email',
//       });
//     }
//   }
//
//   @override
//   Future<Object> getUser(String email, String password) async {
//     String login = '${Constant.baseUrl}/login';
//     Map<String, String> headers = {
//       'Accept': 'application/json',
//       // 'Authorization': '<Your token>'
//     };
//     try {
//       final response =
//           await http.post(Uri.parse(login), headers: headers, body: {
//         'email': email.toString(),
//         "password": password.toString(),
//       });
//       final jsonBody = json.decode(response.body);
//       if (jsonBody['status'] as bool == true) {
//         try {
//           return LoginModel.fromRawJson(response.body);
//         } catch (e) {
//           return jsonBody['message'];
//         }
//       } else {
//         return jsonBody['message'];
//       }
//     } on SocketException catch (_) {
//       // make it explicit that a SocketException will be thrown if the network connection fails
//       return 'Something went wrong';
//     }
//   }
//
//   // @override
//   Future<Object> getSocialUser(String email, String name) async {
//     String login = '${Constant.baseUrl}/socialLogin';
//     Map<String, String> headers = {
//       'Accept': 'application/json',
//       // 'Authorization': '<Your token>'
//     };
//     try {
//       final response =
//           await http.post(Uri.parse(login), headers: headers, body: {
//         'email': email.toString(),
//         'name': name.toString(),
//       });
//       if (kDebugMode) {
//         print(response.body);
//         print(response.statusCode);
//       }
//       final jsonBody = json.decode(response.body);
//       if (jsonBody['status'] as bool == true) {
//         try {
//           return LoginModel.fromRawJson(response.body);
//         } catch (e) {
//           return jsonBody['message'];
//         }
//       } else {
//         return jsonBody['message'];
//       }
//     } on SocketException catch (_) {
//       // make it explicit that a SocketException will be thrown if the network connection fails
//       return 'Something went wrong';
//     }
//   }
//
//   @override
//   Future<bool> verifyOtp(String email, String code) async {
//     String url = '${Constant.baseUrl}/verifyOtp';
//     Map<String, String> headers = {
//       'Accept': 'application/json',
//       // 'Authorization': '<Your token>'
//     };
//     try {
//       final response = await http.post(Uri.parse(url), headers: headers, body: {
//         'email': email.toString(),
//         'otp': code.toString(),
//       });
//       if (kDebugMode) {
//         print(response.body);
//         print(response.statusCode);
//       }
//       if (response.statusCode == 200) {
//         // save the token
//         LoginModel login = LoginModel.fromRawJson(response.body);
//         String token = login.data!.token ?? '';
//         String userId = login.data!.user!.id.toString() ?? '';
//         String role = login.data!.user!.roleId ?? '';
//         final box = GetStorage();
//         box.write(Constant.apiToken, token);
//         box.write(Constant.userId, userId);
//         box.write(Constant.role, role);
//
//         return true;
//       } else {
//         return false;
//       }
//     } on SocketException catch (_) {
//       // make it explicit that a SocketException will be thrown if the network connection fails
//       return false;
//     }
//   }
//
//   @override
//   Future<Object> updateUser(String email) async {
//     String login = '${Constant.baseUrl}/user/forget-password';
//
//     try {
//       final response = await http.post(Uri.parse(login), body: {
//         'email': email.toString(),
//       });
//
//       if (response.statusCode == 200) {
//         if (jsonDecode(response.body)["code_sent"] as bool == true) {
//           int id = jsonDecode(response.body)["id"] as int;
//           // return '200';
//           return jsonEncode({
//             'status_code': '200',
//             "message": 'Verify Code Sent Successfully',
//             "user_id": id.toString()
//           });
//         } else {
//           // throw Exception('eorror');
//           // return '422';
//
//           // return 'Phone Number does not exist';
//           return jsonEncode({
//             'status_code': '422',
//             "message": 'Phone Number does not exist',
//           });
//         }
//       } else {
//         // return '302';
//         // return 'Invalid Phone Number';
//         return jsonEncode({
//           'status_code': '302',
//           "message": 'Invalid Phone Number',
//         });
//       }
//     } on SocketException catch (_) {
//       // make it explicit that a SocketException will be thrown if the network connection fails
//       // return '404';
//       // return 'Not Found';
//       return jsonEncode({
//         'status_code': '404',
//         "message": 'Not Found',
//       });
//     }
//   }
//
//   @override
//   Future<Object> verifyUser(String code, String userId) async {
//     String login = '${Constant.baseUrl}/user/fp-verified';
//
//     try {
//       final response = await http.post(Uri.parse(login), body: {
//         'fp_verification_code': code.toString(),
//         'id': userId.toString(),
//       });
//
//       if (response.statusCode == 200) {
//         if (jsonDecode(response.body)["success"] as bool == true) {
//           // String id = jsonDecode(response.body)["id"] as String;
//           // return '200';
//           return jsonEncode({
//             'status_code': '200',
//             'user_id': userId,
//             "message": jsonDecode(response.body)["message"],
//           });
//         } else {
//           return jsonEncode({
//             'status_code': '422',
//             "message": jsonDecode(response.body)["message"],
//           });
//         }
//       } else {
//         return jsonEncode({
//           'status_code': '302',
//           "message": jsonDecode(response.body)["message"],
//         });
//       }
//     } on SocketException catch (_) {
//       // make it explicit that a SocketException will be thrown if the network connection fails
//       // return '404';
//       // return 'Not Found';
//       return jsonEncode({
//         'status_code': '404',
//         "message": 'Not Found',
//       });
//     }
//   }
//
//   @override
//   Future<Object> resetPassword(
//       String password, String confirmPassword, String userId) async {
//     String login = '${Constant.baseUrl}/change-forgot-password';
//
//     try {
//       final response = await http.post(Uri.parse(login), body: {
//         'id': userId,
//         'password': password.toString(),
//         'password_confirmation': confirmPassword.toString(),
//       });
//
//       if (response.statusCode == 200) {
//         if (jsonDecode(response.body)["success"] as bool == true) {
//           // String id = jsonDecode(response.body)["id"] as String;
//           // return '200';
//           return jsonEncode({
//             'status_code': '200',
//             "message": jsonDecode(response.body)["message"],
//           });
//         } else {
//           return jsonEncode({
//             'status_code': '422',
//             "message": jsonDecode(response.body)["message"],
//           });
//         }
//       } else {
//         return jsonEncode({
//           'status_code': '302',
//           "message": 'password not match',
//         });
//       }
//     } on SocketException catch (_) {
//       // make it explicit that a SocketException will be thrown if the network connection fails
//       // return '404';
//       // return 'Not Found';
//       return jsonEncode({
//         'status_code': '404',
//         "message": 'Not Found',
//       });
//     }
//   }
// }
