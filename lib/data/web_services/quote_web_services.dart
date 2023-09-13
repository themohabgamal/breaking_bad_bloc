import 'package:dio/dio.dart';

class QuoteWebServices {
  late Dio dio;
  QuoteWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "https://api.breakingbadquotes.xyz/v1/quotes/",
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(baseOptions);
  }
  Future<List<dynamic>> getAllQuotes() async {
    try {
      Response response = await dio.get("/20");
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
