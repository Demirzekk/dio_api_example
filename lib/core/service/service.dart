import 'package:dio/dio.dart';
import 'package:dio_api_example/core/constant/app_constant.dart';
// import 'package:http/http.dart' as http;

class CustomNetworkService {
  late final Dio _dio;

  CustomNetworkService() {
    _dio = Dio(_dioBaseOption);
  }

  final BaseOptions _dioBaseOption = BaseOptions(
    baseUrl: AppConstant.baseUrl,
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    contentType: "application/json",
  );

  Future get({required String path}) async {
    final Response response = await _dio.get(
      path,
    );

    return response;
  }

  Future<Response> post({required String path, body}) async {
    final Response response = await _dio.post(path, data: body);

    return response;
  }
}

// class CustomNetworkService2 {
//   Future getApi() async {
//     final response =
//         await http.get(Uri.parse(AppConstant.baseUrl + AppConstant.posts));

//     return response;
//   }
// }
