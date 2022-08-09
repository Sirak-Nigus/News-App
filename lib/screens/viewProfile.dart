import 'package:flutter/material.dart';
import 'package:mekelletimes/provider/auth_provider.dart';
import 'package:mekelletimes/provider/userProvider.dart';
import 'package:mekelletimes/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

class ViewProfile extends StatefulWidget {
  ViewProfile({Key key}) : super(key: key);

  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<UserProvider>(context).fetchUser();
    } else {
      setState(() {
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  Future<void> deactivateAccount() async {
    await Provider.of<UserProvider>(context, listen: false).deActivateAccount();

    await Provider.of<Auth>(context, listen: false).logout();
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Profile',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed('/edit-profile');
              })
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 35.0, top: 35.0, bottom: 10, right: 35.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                            image: AssetImage('assets/images/image1.jpg'),
                            fit: BoxFit.cover),
                        color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 165.0),
            child: Text(
              profile.single.name,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 150.0),
            child: Text(
              profile.single.email,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, left: 8, right: 8.0, bottom: 3),
            child: ListTile(
              leading: Icon(Icons.notification_important),
              title: Text(
                'Notification',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, left: 8, right: 8.0, bottom: 3),
            child: ListTile(
              leading: Icon(
                Icons.bookmark,
                color: Colors.green,
              ),
              title: Text(
                'Reading List',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, left: 8, right: 8.0, bottom: 3),
            child: ListTile(
              leading: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              title: Text(
                'DeActivate Account',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                deactivateAccount();
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
