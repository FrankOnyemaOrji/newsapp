import 'package:flutter/material.dart';
import 'package:newsapp/feature/shownews/domain/entitles/news_info.dart';

import '../../../../core/constants/palette.dart';

class NewsViewPage extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsViewPage({Key? key, required this.newsInfo}) : super(key: key);

String _getDateFormate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        backgroundColor: Palette.background,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.navigate_before,
            color: Palette.deepBlue,
            size: 20,
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsInfo.title != null
                          ? newsInfo.title!
                          : '-- No Title --',
              style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              color: Palette.lightgrey,
              child: newsInfo.imageUrl != null
                  ? Image.network(
                      newsInfo.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              _getDateFormate(newsInfo.dateTime),
              style: const TextStyle(color: Palette.lightgrey, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              newsInfo.author != null
                          ? newsInfo.author!
                          : '-- No Title --',
              style: const TextStyle(color: Palette.lightgrey, fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              newsInfo.content != null
                          ? newsInfo.content!
                          : '-- No Title --',
              style: const TextStyle(color: Palette.lightgrey, fontSize: 14),
            ),
            const SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}
