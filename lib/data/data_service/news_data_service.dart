import '../../common/resources/urls.dart';
import '../../service/http_services.dart';

class NewsDataService {
  static Future fetchNewsData(String category) async {
    final HttpServices dataService = HttpServices(Urls.baseUrl);

    final response = await dataService.get(
        "${Urls.newsList}?q=$category&apiKey=${Urls.apiKey}",);
    return response;
  }
}