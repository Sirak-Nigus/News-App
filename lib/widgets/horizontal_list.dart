import 'package:mekelletimes/data/Dummy_data.dart';
import 'package:mekelletimes/screens/category_based.dart';
import 'package:flutter/material.dart';
import '../data/Dummy_data.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: DUMMY_CATEGORIES
          .map((cat) => GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          CategoryBased(title: cat.categoryName)))
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 15),
                  child: Container(
                      padding: EdgeInsets.only(
                          top: 8.0, bottom: 5, left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                          // color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.blue)),
                      child: Text(
                        cat.categoryName,
                        style: Theme.of(context).textTheme.button,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      )),
                ),
              ))
          .toList(),
    );
  }
}
