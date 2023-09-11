import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;

  ApiClient({ required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
  }

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch(error) {
      return Response(statusCode: 1, statusText: error.toString());
    }
  }
}