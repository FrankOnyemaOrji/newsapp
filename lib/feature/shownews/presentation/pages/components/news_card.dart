import 'package:flutter/material.dart';
import 'package:newsapp/feature/shownews/domain/entitles/news_info.dart';

import '../../../../../core/constants/palette.dart';
import '../new_view_page.dart';

class NewsCard extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsCard({Key? key, required this.newsInfo})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewsViewPage(newsInfo: newsInfo,)));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        height: 300,
        width: MediaQuery.of(context).size.width - (2 * 16),
        child: Stack(
          children: [
            Container(
              height: 260,
              color: Palette.lightgrey,
              child: newsInfo.imageUrl != null
                  ? Image.network(
                      newsInfo.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: Colors.black12)
                  ],
                ),
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      newsInfo.title != null
                          ? newsInfo.title!
                          : '-- No Title --',
                      maxLines: 2,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Palette.deepBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
