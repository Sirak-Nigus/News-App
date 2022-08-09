import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mekelletimes/provider/latest_news_provider.dart';

class LatestNews extends StatelessWidget {
  final LatestNewsProvider latestNewsProvider;
  final PageController pageController;
  LatestNews({this.latestNewsProvider, this.pageController});

  buildLatestNews(BuildContext context, String newsTitle, String newsPicture,
      String newsSource, DateTime createdAt, int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, Widget widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.20)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 300.0,
            child: widget,
          ),
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 0.0, right: 1.0, bottom: 1.0, left: 0.0),
        child: Container(
          margin: EdgeInsets.all(5.0),
          width: 380.0,
          height: 250,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1.0,
                color: Theme.of(context).accentColor,
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  'http://192.168.1.2:3000/images/news/$newsPicture',
                  height: 140,
                  width: 360,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 10, right: 5, bottom: 5),
                child: Text(
                  newsTitle,
                  style: Theme.of(context).textTheme.headline2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 2, bottom: 10),
                child: Row(
                  children: [
                    newsSource == null
                        ? Text(
                            'CNN',
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        : Text(
                            newsSource,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                    SizedBox(
                      width: 30,
                    ),
                    DateTime.now().difference(createdAt).inDays.toInt() < 30
                        ? Text(
                            ' ${DateTime.now().difference(createdAt).inDays.toString()} days ago',
                            //  / DateFormat.yMMMMd().format(createdAt).toString(),
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        : Text(
                            ' ${(DateTime.now().difference(createdAt).inDays ~/ 30).toInt()} months ago',
                            //  / DateFormat.yMMMMd().format(createdAt).toString(),
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculate(DateTime date) {
    switch (date.toIso8601String()) {
      case 'day':
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final latestNews = latestNewsProvider.latestNews;
    final latestnewsDate =
        latestNews.map((e) => DateTime.tryParse(e.createdAt.toIso8601String()));
    print(latestNews.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 230.0,
          padding: EdgeInsets.only(left: 0.0),
          // color: Colors.blue,
          child: PageView.builder(
              allowImplicitScrolling: true,
              controller: pageController,
              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              // padding: EdgeInsets.only(left: 10),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: latestNews.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: buildLatestNews(
                      context,
                      latestNews[index].newsTitle,
                      latestNews[index].newsPicture,
                      latestNews[index].newsSource,
                      latestNews[index].createdAt,
                      index),
                  onTap: () => Navigator.of(context).pushNamed('/single-news',
                      arguments: latestNews[index].newsId),
                );
              }),
        ),
      ],
    );
  }
}
