import 'package:mekelletimes/provider/auth_provider.dart';
import 'package:mekelletimes/provider/comments_provider.dart';
import 'package:mekelletimes/provider/latest_news_provider.dart';
import 'package:mekelletimes/provider/userProvider.dart';
import 'package:mekelletimes/screens/category_based.dart';
import 'package:mekelletimes/screens/editProfile_screen.dart';
import 'package:mekelletimes/screens/login_screen.dart';
import 'package:mekelletimes/screens/register_screen.dart';
import 'package:mekelletimes/screens/single_news_screen.dart';
import 'package:mekelletimes/screens/splash_screen.dart';
import 'package:mekelletimes/screens/viewProfile.dart';
import 'package:mekelletimes/styles.dart';
import 'package:flutter/material.dart';
import './screens/HomePage.dart';
import 'screens/about_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/setting_screen.dart';
import 'provider/news_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title;
  bool darkTheme = false;

  void setTheme(bool theme) {
    setState(() {
      darkTheme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Auth()),
          ChangeNotifierProvider.value(
            value: LatestNewsProvider(),
          ),
          ChangeNotifierProvider.value(value: NewsProvider()),
          // ChangeNotifierProxyProvider<Auth, LatestNewsProvider>(
          //   create: (context) => LatestNewsProvider(Auth().token, []),
          //   update: (context, auth, prevLatestNews) => LatestNewsProvider(
          //       auth.token,
          //       prevLatestNews == null ? [] : prevLatestNews.latestNews),
          // ),
          // ChangeNotifierProxyProvider<Auth, NewsProvider>(
          //   create: (context) => NewsProvider(
          //     Auth().token,
          //     [],
          //   ),
          //   update: (context, auth, prevNews) =>
          //       NewsProvider(auth.token, prevNews == null ? [] : prevNews.news),
          // ),
          ChangeNotifierProxyProvider<Auth, CommentProvider>(
            create: (context) =>
                CommentProvider(Auth().token, [], Auth().userId, Auth().isAuth),
            update: (context, auth, prevComment) => CommentProvider(
                auth.token,
                prevComment == null ? [] : prevComment.comments,
                auth.userId,
                auth.isAuth),
          ),
          ChangeNotifierProxyProvider<Auth, UserProvider>(
            create: (context) => UserProvider(
              Auth().userId,
              Auth().token,
              [],
            ),
            update: (context, auth, usr) => UserProvider(
              auth.userId,
              auth.token,
              usr == null ? [] : usr.user,
            ),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: darkTheme ? buildDarkTheme() : buildLightTheme(),
              home: auth.isAuth
                  ? HomePage()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : HomePage(),
                    ),
              // initialRoute: '/',
              routes: {
                '/home': (context) => HomePage(),
                '/single-news': (context) => SingleNewsScreen(),
                '/category': (context) => CategoryBased(
                      title: title,
                    ),
                '/profile': (context) => ProfileScreen(),
                '/settings': (context) => SettingScreen(
                      theme: setTheme,
                      darkThemeValue: darkTheme,
                    ),
                '/about': (context) => AboutScreen(),
                '/login': (context) => LoginPage(),
                '/register-page': (context) => RegisterPage(),
                '/view-profile': (context) => ViewProfile(),
                '/edit-profile': (context) => EditProfileScreen()
              },
              onGenerateRoute: (settings) {
                return MaterialPageRoute(builder: (context) => HomePage());
              },
              onUnknownRoute: (settings) {
                return MaterialPageRoute(builder: (context) => HomePage());
              }),
        ));
  }
}
