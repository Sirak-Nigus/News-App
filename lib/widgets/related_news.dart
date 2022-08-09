import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RelatedNews extends StatelessWidget {
  final String newsId;
  final String newsTitle;
  final String newsSource;
  final String newsPicture;
  final String newsCategory;
  final DateTime createdAt;

  RelatedNews(
      {Key key,
      this.newsId,
      this.newsTitle,
      this.newsSource,
      this.newsPicture,
      this.newsCategory,
      this.createdAt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 120,
      // padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
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
                  height: 118.0,
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
                          ? MediaQuery.of(context).size.width * 0.45
                          : MediaQuery.of(context).size.width * 0.66,
                      child: Text(
                        newsTitle,
                        // textAlign: TextAlign.justify,
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
                        Text(
                          newsSource,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          DateFormat.yMMMMd().format(createdAt),
                          // style: Theme.of(context).textTheme.subtitle1,
                          style: TextStyle(fontSize: 13,color:Colors.red),
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
    );
  }
}
