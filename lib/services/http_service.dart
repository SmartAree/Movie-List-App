import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:watch_hour/model/app_config.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;
  String? _baseURL;
  String? _apiKEY;

  //CONSTRUCTOR
  HTTPService() {
    AppConfig config = getIt.get<AppConfig>(); //getting appconfig class data
    _baseURL = config.BASE_API_URL;
    _apiKEY = config.API_KEY;
  }

//?responsible to sending a get request to our actual API
  Future<Response> getRequest(String path, Map<String, dynamic> query) async {
    try {
      String url = '$_baseURL$path';
      Map<String, dynamic> query0 = {
        'api_key': _apiKEY,
        'language': 'en-US',
      };
      query0.addAll(query);
      return await dio.get(url, queryParameters: query0);
    } on DioError {
      rethrow;
    }
  }
}
