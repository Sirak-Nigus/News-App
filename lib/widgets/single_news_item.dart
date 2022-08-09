import 'package:mekelletimes/provider/auth_provider.dart';
import 'package:mekelletimes/provider/comments_provider.dart';
import 'package:mekelletimes/provider/news_provider.dart';
import 'package:mekelletimes/widgets/comment.dart';
import 'package:mekelletimes/widgets/related_news.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'comment_form.dart';

class SingleNewsItem extends StatefulWidget {
  final loaded;

  const SingleNewsItem({Key key, this.loaded}) : super(key: key);
  @override
  _SingleNewsItemState createState() => _SingleNewsItemState();
}

class _SingleNewsItemState extends State<SingleNewsItem> {
  @override
  Widget build(BuildContext context) {
    final loadedNews = widget.loaded;

    final isAuth = Provider.of<Auth>(context, listen: false).isAuth;

    var category = loadedNews.category['categoryName'];

    if (category == null) {
      category = 'CNN';
    }

    // final comment = loadedNews.comment;

    // var commentUserId = comment.map((comm) => comm['user']['_id']);

    var loggedInUserId =
        Provider.of<CommentProvider>(context, listen: false).userId;

    // comment.map((e)=>e.comment);
    // if (comment.isEmpty) {
    //     print('No comment');
    // } else {
    //   print(comment);
    // }

    // final comments = newsData['comments'];

    // final relatedNews = Provider.of<NewsProvider>(context)
    //     .news
    //     .where((news) => news.category['_id'] == loadedNews.category['_id']);

    print(loadedNews.newsTitle);
    print(loadedNews.createdAt);
    print(category);
    print(loadedNews.newsSource);
    print(loadedNews.newsContent);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                loadedNews.newsTitle,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'CreatedAt',
                  // DateFormat.yMMMMd().format(loadedNews.createdAt),
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  // borderRadius: BorderRadius.circular(15)
                ),
                width: MediaQuery.of(context).size.width * 0.95,
                height: 220,
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'http://192.168.1.2:3000/images/news/${loadedNews.newsPicture}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: 120,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          // color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: category == null
                          ? Text(
                              'CNN',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.button,
                            )
                          : Text(
                              'Politcs',
                              // category,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.button,
                            ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: category == null
                        ? Text(
                            'CNN',
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        : Text(
                            'CNN',
                            // loadedNews.newsSource,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, bottom: 8.0, right: 18),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.eye,
                        color: Theme.of(context).buttonColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '100',
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              indent: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 8, right: 8, left: 8),
              child: Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 20, right: 10, left: 5),
                child: Text(
                  loadedNews.newsContent,
                  textAlign: TextAlign.justify,
                  textWidthBasis: TextWidthBasis.parent,
                  strutStyle: StrutStyle(forceStrutHeight: true, leading: 0.5),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 0, right: 8, left: 6),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
                  child: Text(
                    'Related News',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.white38,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            // ...relatedNews
            //     .map((news) => InkWell(
            //           child: RelatedNews(
            //             newsId: news.newsId,
            //             newsTitle: news.newsTitle,
            //             newsSource: news.newsSource,
            //             newsPicture: news.newsPicture,
            //             createdAt: DateTime.now(),
            //           ),
            //           onTap: () => Navigator.of(context).pushReplacementNamed(
            //               '/single-news',
            //               arguments: news.newsId),
            //         ))
            //     .toList(),
            Divider(),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 0, right: 8, left: 6),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 8.0, right: 8.0),
                  child: Text(
                    'COMMENTS',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ),
            // ...comment
            //     .map(
            //       (comm) => Padding(
            //         padding: const EdgeInsets.only(
            //             top: 0, bottom: 0, right: 8, left: 8),
            //         child: Card(
            //             child: CommentSection(
            //                 newsId: loadedNews.newsId, comment: comm)),
            //       ),
            //     )
            //     .toList(),
            Divider(
              color: Colors.white38,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            // (isAuth && !commentUserId.contains(loggedInUserId))
            //     ? CommentForm(
            //         newsId: loadedNews.newsId,
            //       )
            //     : isAuth
            //         ? Text('`')
            //         : Center(child: Text('Please Login for comment'))
          ],
        ),
      ),
    );
  }
}
