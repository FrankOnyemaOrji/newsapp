import 'package:newsapp/feature/shownews/domain/entitles/news_info.dart';

class NewsInfoModel extends NewsInfo {
  NewsInfoModel({
    String? title,
    String? author,
    String? imageUrl,
    String? content,
    String? dateTime,
  }) : super(
          title: title,
          author: author,
          imageUrl: imageUrl,
          content: content,
          dateTime: _getDateTime(dateTime),
        );

  static DateTime _getDateTime(String? dateTime) {
    if (dateTime == null) {
      return DateTime.now();
    } else {
      final DateTime? dateTimeFormat = DateTime.tryParse(dateTime);
      if (dateTimeFormat == null) {
        return DateTime.now();
      } else {
        return dateTimeFormat;
      }
    }
  }

  factory NewsInfoModel.fromMap(Map<String, dynamic> map) {
    return NewsInfoModel(
      title: map['title'],
      author: map['author'],
      imageUrl: map['urlToImage'],
      content: map['content'],
      dateTime: map['publishedAt'],
    );
  }
}
