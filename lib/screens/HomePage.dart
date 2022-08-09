import 'package:dio/dio.dart';
import 'package:mekelletimes/provider/auth_provider.dart';
import 'package:mekelletimes/provider/latest_news_provider.dart';
import 'package:mekelletimes/provider/news_provider.dart';
import 'package:mekelletimes/provider/userProvider.dart';
import 'package:mekelletimes/widgets/horizontal_list.dart';
import 'package:mekelletimes/widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/News.dart';
import 'package:mekelletimes/widgets/latest_news.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  bool isLoggedIN = false;
  bool isInit = true;
  Response response;

  void initState() {
    bool isAuth = Provider.of<Auth>(context, listen: false).isAuth;
    if (isAuth) {
      Provider.of<UserProvider>(context, listen: false).fetchUser();
    }

    super.initState();

    // getUser();
    pageController =
        PageController(keepPage: false, initialPage: 0, viewportFraction: 0.9);
  }

  Future<void> refreshPage(BuildContext context) async {
    await Provider.of<LatestNewsProvider>(context, listen: false)
        .fetchLatestNews();
    await Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: orientation == Orientation.portrait
            ? screenHeight * 0.1
            : screenHeight * 0.16,
        leadingWidth: orientation == Orientation.portrait
            ? screenWidth * 0.08
            : screenWidth * 0.2,
        title: SizedBox(
          child: Column(
            children: [
              Container(
                height: orientation == Orientation.portrait
                    ? screenHeight * 0.05
                    : screenHeight * 0.16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 18.0, right: 2.0, left: 8.0),
                      child: Text(
                        '|',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 18.0, right: 2.0, left: 8.0),
                      child: Text(
                        DateFormat.yMMMEd().format(
                          DateTime.now(),
                        ),
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
                indent: 1,
                endIndent: 5,
                // thickness: 0.9,
              ),
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Proxima NEWS',
                      style: TextStyle(fontSize: 18),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 0),
                    //   child: IconButton(
                    //       onPressed: () {}, icon: Icon(Icons.search)),
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      // AppBar(
      //   leading: Builder(builder: (context) {
      //     return Padding(
      //       padding: const EdgeInsets.only(top: 20.0),
      //       child: IconButton(
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //         icon: Icon(Icons.menu),
      //         color: Colors.white,
      //         onPressed: () => Scaffold.of(context).openDrawer(),
      //       ),
      //     );
      //   }),
      //   backgroundColor: Theme.of(context).appBarTheme.color,
      //   toolbarHeight: 90,
      //   title: Padding(
      //     padding: const EdgeInsets.only(top: 20),
      //     child: Text(
      //       'Proxima NEWS',
      //       style: TextStyle(fontSize: 18),
      //     ),
      //   ),
      //   elevation: 0.0,
      //   flexibleSpace: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 25.0),
      //       child: Divider(
      //         color: Colors.white,
      //         indent: 15,
      //         endIndent: 8,
      //         // thickness: 0.9,
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     Container(
      //       padding: EdgeInsets.only(
      //         right: 5,
      //         top: 8,
      //       ),
      //       width: 160,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         children: [
      //           Container(
      //             decoration: BoxDecoration(
      //                 border: Border(
      //               left: BorderSide(color: Colors.white, width: 1),
      //               // bottom: BorderSide(width: 1)
      //             )),
      //             child: Padding(
      //               padding: const EdgeInsets.only(
      //                   top: 2.0, bottom: 2.0, right: 2.0, left: 8.0),
      //               child: Text(
      //                 DateFormat.yMMMEd().format(
      //                   DateTime.now(),
      //                 ),
      //                 style: TextStyle(fontSize: 17),
      //               ),
      //             ),
      //           ),
      //           Container(
      //               child: IconButton(
      //                   tooltip: 'Logout',
      //                   icon: Icon(Icons.search),
      //                   onPressed: () {})),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: RefreshIndicator(
        onRefresh: () => refreshPage(context),
        child: Scrollbar(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(height: 50, child: HorizontalList()),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Container(
                  key: UniqueKey(),
                  width: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  // color: Colors.red,
                  child: Text(
                    'Latest News',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              FutureBuilder(
                future: Provider.of<LatestNewsProvider>(context, listen: false)
                    .fetchLatestNews(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    Center(
                        child: Text(
                            'NO connectiion , Please connect to internet'));
                  }

                  return Consumer<LatestNewsProvider>(
                    builder: (context, latestNewsProvider, child) {
                      return LatestNews(
                          latestNewsProvider: latestNewsProvider,
                          pageController: pageController);
                    },
                  );
                },
              ),
              SizedBox(
                height: screenWidth * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'News',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Divider(
                color: Colors.white38,
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              FutureBuilder(
                  future: Provider.of<NewsProvider>(context, listen: false)
                      .fetchNews(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                              'NO connectiion , Please connect to internet'));
                    } else {
                      return Consumer<NewsProvider>(
                          builder: (context, newsData, child) {
                        return News(newsData: newsData);
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
