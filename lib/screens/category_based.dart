import 'package:mekelletimes/provider/news_provider.dart';
import 'package:mekelletimes/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CategoryBased extends StatelessWidget {
  final String title;

  CategoryBased({this.title});

  Widget buildContainer(BuildContext context, String newsPicture,
      String newsTitle, String newsSource, DateTime createdAt) {
    return Scrollbar(
      child: Container(
        height: 120,
        // padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                  child: Image.asset(
                    newsPicture,
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
                          textWidthBasis: TextWidthBasis.longestLine,
                          // textWidthBasis: TextWidthBasis.longestLine,
                          style: Theme.of(context).textTheme.headline2,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5.0, top: 3, right: 5),
                      child: Row(
                        children: [
                          Text(
                            newsSource,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            DateFormat.yMMMMd().format(createdAt),
                            style: Theme.of(context).textTheme.subtitle1,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            // Divider(
            //   thickness: 1,
            //   indent: 10,
            //   endIndent: 10,
            // )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selected = Provider.of<NewsProvider>(context).news;
    final selectedCategory = selected.where((news) => news.category == title);
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            );
          }),
          backgroundColor: Theme.of(context).appBarTheme.color,
          toolbarHeight: 90,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ],
          ),
          elevation: 0.0,
          flexibleSpace: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 3, left: 20.0, bottom: 0.0),
                  child: Text(
                    'Proxima NEWS',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Divider(
                  color: Colors.white,
                  indent: 15,
                  endIndent: 8,
                  // thickness: 0.9,
                ),
              ],
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(
                right: 5,
                top: 8,
              ),
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      left: BorderSide(color: Colors.white, width: 1),
                      // bottom: BorderSide(width: 1)
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 2.0, bottom: 2.0, right: 2.0, left: 8.0),
                      child: Text(
                        DateFormat.yMMMEd().format(
                          DateTime.now(),
                        ),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                      child: IconButton(
                          icon: Icon(Icons.search), onPressed: () {}))
                ],
              ),
            ),
          ],
        ),
        drawer: SafeArea(
          child: Drawer(
            child: MainDrawer(),
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: selectedCategory
              .map((news) => InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/single-news', arguments: {
                        'newsId': news.newsId,
                        'newsTitle': news.newsTitle,
                        'newsPicture': news.newsPicture,
                        'newsContent': news.newsContent,
                        'createdAt': news.createdAt,
                        // 'newsImages': news.newsImages,
                        'newsSource': news.newsSource,
                        'newsCategory': news.category,
                        // 'comments': news.comment
                      });
                    },
                    child: buildContainer(context, news.newsPicture,
                        news.newsTitle, news.newsSource, news.createdAt),
                  ))
              .toList(),
        ));
  }
}
