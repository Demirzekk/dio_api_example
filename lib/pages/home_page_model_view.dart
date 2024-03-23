 

import 'package:dio/dio.dart';
import 'package:dio_api_example/core/service/service.dart';
import 'package:dio_api_example/pages/post_model.dart';

import '../core/constant/app_constant.dart';

class HomePageModelView {
  final CustomNetworkService _service = CustomNetworkService();

  Future<List<PostModel>> getPost() async {
    final Response response = await _service.get(path: AppConstant.posts);

    List<PostModel> list = [];

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      list = data.map((e) => PostModel.fromJson(e)).toList();
    }
    return list;
  }
}
