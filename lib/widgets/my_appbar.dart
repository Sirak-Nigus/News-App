import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        toolbarHeight: 90,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Proxima NEWS',
            style: TextStyle(fontSize: 23),
          ),
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
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                    child:
                        IconButton(icon: Icon(Icons.search), onPressed: () {}))
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
