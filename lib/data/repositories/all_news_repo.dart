import 'package:dio/dio.dart';
import 'package:geekz_challenge/models/all_news_response.dart';


class AllNewsRepo {

  Future<AllNewsResponse> getAllNews() async {
    try {
      Dio dio = Dio(BaseOptions(
       receiveTimeout: 60000,
          connectTimeout: 60000));
      Response _response = await dio.get(
          "https://newsapi.org/v2/top-headlines?apiKey=a8a7e21549ca496bba06fbd88f09d182&country=id"
      );
      return AllNewsResponse.fromJson(_response.data);
    } catch (e) {
      return AllNewsResponse(status: "$e");
    }
  }
}