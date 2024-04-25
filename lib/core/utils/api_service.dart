import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post(
      {required Body,
      required String url,
      String? token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await dio.post(
      url,
      data: Body,
      options: Options(
          headers: headers ?? {'Authorization': "Bearer $token"},
          contentType: contentType),
    );
    return response;
  }
}
