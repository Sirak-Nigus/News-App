import 'package:mekelletimes/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatefulWidget {
  final Function theme;
  final bool darkThemeValue;

  const SettingScreen({this.theme, this.darkThemeValue});

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool newsNotification = false;
  bool darkTheme = false;

  @override
  void initState() {
    newsNotification = newsNotification;
    darkTheme = widget.darkThemeValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 25.0, right: 15.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'FaceBook',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                Container(
                  width: 250,
                  child: Text(
                    'Connect',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10, bottom: 10, left: 25.0, right: 20.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Twitter',
                    style: TextStyle(color: Colors.green, fontSize: 18)),
                Container(
                  width: 270,
                  child: Text(
                    'Connect',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0, bottom: 0, left: 10.0, right: 15.0),
            child: SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                value: darkTheme,
                onChanged: (newValue) {
                  setState(() {
                    darkTheme = newValue;
                  });
                  widget.theme(darkTheme);
                }),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0, bottom: 0, left: 10.0, right: 15.0),
            child: CheckboxListTile(
                title: Text(
                  'News Notification',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                value: newsNotification,
                onChanged: (newValue) {
                  setState(() {
                    newsNotification = newValue;
                  });
                }),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10, bottom: 0, left: 30.0, right: 20.0),
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
