import 'package:newsapp/core/constants/strings.dart';
import 'package:newsapp/core/failure_successes/exceptions.dart';
import 'package:newsapp/core/services/api_service.dart';
import 'package:newsapp/feature/shownews/data/models/news_info_model.dart';

import '../../../../core/service_locator.dart';

abstract class FetchFromRemoteDs {
  Future<List<NewsInfoModel>> fetchnews(String? searchText);
}

class FetchFromRemoteDsImpl implements FetchFromRemoteDs {
  final ApiService apiService = sl<ApiService>();

  @override
  Future<List<NewsInfoModel>> fetchnews(String? searchText) async {
    try {
      Map<String, dynamic> data = await apiService.getData(
          searchText != null ? Strings.apiEverything : Strings.apiTopArticles, {
        "apikey": Strings.apikey,
        if (searchText == null) "country": "us",
        if (searchText != null) "q": searchText,
      });

      List list = data['articles'];
      List<Map<String, dynamic>> mapList = [];
      for (int i = 0; i < list.length; i++) {
        Map<String, dynamic> map = list[i] as Map<String, dynamic>;
        mapList.add(map);
      }

      List<NewsInfoModel> news = [];
      for (int i = 0; i < mapList.length; i++) {
        NewsInfoModel newsInfoModel = NewsInfoModel.fromMap(mapList[i]);
        news.add(newsInfoModel);
      }
      return news;
    } catch (e) {
      throw FetchException(message: "Failed to get data");
    }
  }
}
