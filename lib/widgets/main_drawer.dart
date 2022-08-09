import 'package:mekelletimes/provider/auth_provider.dart';
import 'package:mekelletimes/provider/userProvider.dart';
import 'package:mekelletimes/screens/HomePage.dart';
import 'package:mekelletimes/screens/category_based.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTile(BuildContext context, String title, IconData icon,
      Color color, String route) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      onTap: () => Navigator.of(context).pushReplacementNamed(route),
    );
  }

  Widget buildCategory(
      BuildContext context, String title, String catname, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 0.0),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        onTap: () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => child)),
      ),
    );
  }

  Widget buildUserProfile(BuildContext context, String name) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(Icons.person),
        ),
        accountName: Text(
          name,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        accountEmail: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GestureDetector(
            onTap: () =>
                Navigator.of(context).pushReplacementNamed('/view-profile'),
            child: Text(
              'View Profile',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      ),
    );
  }

  Widget buildTopDrawerSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: 100,
        color: Color.fromRGBO(197, 48, 48, 10),
        child: Center(
            child: Text(
          'PROXIMA NEWS',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        )),
      ),
    );
  }

  Widget unableToConnect(BuildContext context, String name) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.person),
            ),
            accountName: Text(
              name,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            accountEmail: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Please Connect To internet!!')));
                },
                child: Text(
                  'View Profile',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          ),
        ),
        buildCategory(context, 'News', 'all-news', HomePage()),
        buildCategory(
            context,
            'Technology',
            'technology',
            CategoryBased(
              title: 'technology',
            )),
        buildCategory(
            context,
            'Politics',
            'Politics',
            CategoryBased(
              title: 'Politics',
            )),
        Divider(
          thickness: 1,
        ),
        buildListTile(
            context, 'Settings', Icons.settings, Colors.red, '/settings'),
        buildListTile(
            context, 'More Apps', Icons.more_sharp, Colors.red, '/home'),
        buildListTile(context, 'Share', Icons.share, Colors.red, '/home'),
        buildListTile(context, 'About', Icons.help, Colors.blue, '/about'),
        ListTile(
            leading: FaIcon(
              Icons.logout,
              color: Colors.red,
            ),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/home');
              Provider.of<Auth>(context, listen: false).logout();
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAuth = Provider.of<Auth>(context, listen: false).isAuth;
    final sharedPreferencesName =
        Provider.of<Auth>(context, listen: false).name;

    var userProvider;

    var loggedInUser;

    if (isAuth) {
      userProvider = Provider.of<UserProvider>(context, listen: false).user;
      if (userProvider.isEmpty) {
        return unableToConnect(context, sharedPreferencesName);
      }
      loggedInUser = userProvider.single;
    }
    // var loggedInUser;
    // var userProvider;

    // if (isAuth) {
    //   userProvider = Provider.of<Auth>(context, listen: false).user;
    //
    // }

    return Scrollbar(
      child: ListView(children: [
        isAuth
            ? buildUserProfile(context, loggedInUser.name)
            : buildTopDrawerSection(context),
        buildCategory(context, 'News', 'all-news', HomePage()),
        buildCategory(
            context,
            'Technology',
            'technology',
            CategoryBased(
              title: 'technology',
            )),
        buildCategory(
            context,
            'Politics',
            'Politics',
            CategoryBased(
              title: 'Politics',
            )),
        Divider(
          thickness: 1,
        ),
        buildListTile(
            context, 'Settings', Icons.settings, Colors.red, '/settings'),
        buildListTile(
            context, 'More Apps', Icons.more_sharp, Colors.red, '/home'),
        buildListTile(context, 'Share', Icons.share, Colors.red, '/home'),
        buildListTile(context, 'About', Icons.help, Colors.blue, '/about'),
        isAuth
            ? ListTile(
                leading: FaIcon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: Text(
                  'Logout',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).pushReplacementNamed('/home');
                  Provider.of<Auth>(context, listen: false).logout();
                })
            : ListTile(
                leading: FaIcon(
                  Icons.login,
                  color: Colors.green,
                ),
                title: Text(
                  'Login',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/login');
                })
      ]),
    );
  }
}
