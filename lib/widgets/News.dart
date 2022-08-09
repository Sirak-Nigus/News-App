import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mekelletimes/provider/news_provider.dart';

class News extends StatelessWidget {
  final NewsProvider newsData;

  const News({this.newsData});

  Widget buildContainer(BuildContext context, String newsPicture,
      String newsTitle, String newsSource, DateTime createdAt) {
    return Container(
      height: 120,
      // padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          // borderRadius: BorderRadius.circular(15.0),
          // border: Border.all(
          //   width: 1.0, color: Colors.grey[200]
          //   )
          border: Border(
              bottom: BorderSide(
                  width: 1.0, color: Theme.of(context).accentColor))),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                // borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'http://192.168.1.2:3000/images/news/$newsPicture',
                  width: 160,
                  height: 115.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 5.0, bottom: 5.0, right: 0.0),
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.47
                          : MediaQuery.of(context).size.width * 0.66,
                      child: Text(
                        newsTitle,
                        textAlign: TextAlign.justify,

                        // textWidthBasis: TextWidthBasis.longestLine,
                        // textWidthBasis: TextWidthBasis.longestLine,
                        style: Theme.of(context).textTheme.headline2,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 3, right: 5),
                    child: Row(
                      children: [
                        newsSource == null
                            ? Text(
                                'BBC',
                                style: Theme.of(context).textTheme.subtitle1,
                              )
                            : Text(
                                newsSource,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          DateFormat.yMd().format(createdAt),
                          style: Theme.of(context).textTheme.subtitle2,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final newsProvider = Provider.of<NewsProvider>(context);
    // final newsData = newsProvider.news;
    return Column(
      children: newsData.news
          .map((news) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/single-news',
                    arguments: news.newsId,
                  );
                },
                child: buildContainer(context, news.newsPicture, news.newsTitle,
                    news.newsSource, news.createdAt),
              ))
          .toList(),
    );
  }
}
