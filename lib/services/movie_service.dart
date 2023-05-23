import 'package:get_it/get_it.dart';
import 'package:watch_hour/services/http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  MovieService() {
    HTTPService http = getIt.get<HTTPService>();
  }
}
