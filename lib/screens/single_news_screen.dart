import 'package:mekelletimes/provider/news_provider.dart';
import 'package:mekelletimes/widgets/single_news_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SingleNewsScreen extends StatefulWidget {
  @override
  _SingleNewsScreenState createState() => _SingleNewsScreenState();
}

class _SingleNewsScreenState extends State<SingleNewsScreen> {
  bool isLoading = true;
  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      final newsId = ModalRoute.of(context).settings.arguments as String;
      print(newsId);
      //comment update
      Provider.of<NewsProvider>(context, listen: false)
          .fetchSingleNews(newsId)
          .then((value) {
        setState(() {
          isLoading = false;
        });
      });
    } else {
      setState(() {
        isLoading = false;
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  // Future<bool> _noCheckForSession() async {
  //   await Future.delayed(Duration(milliseconds: 6000), () {});
  //   return true;
  // }

  Widget buildIcon(BuildContext context, IconData icon) {
    return IconButton(
        icon: Icon(
          icon,
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  @override
  Widget build(BuildContext context) {
    // print(isLoading);
    var loaded;
    if (isLoading == false) {
      loaded =
          Provider.of<NewsProvider>(context, listen: false).singleNews.single;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.color,
          toolbarHeight: 90,
          title: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              'Proxima NEWS',
              style: TextStyle(fontSize: 23),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: buildIcon(context, Icons.arrow_back),
          ),
          elevation: 0.0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Divider(
                color: Colors.white,
                indent: 15,
                endIndent: 8,
                // thickness: 0.9,
              ),
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
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, right: 5),
                    child: buildIcon(context, Icons.share),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                ),
              )
            : SafeArea(
                child: Scrollbar(
                  child: ListView(physics: BouncingScrollPhysics(), children: [
                    Card(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: SingleNewsItem(
                          loaded: loaded,
                        )),
                  ]),
                ),
              ));
  }
}
