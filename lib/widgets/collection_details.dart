import 'package:flutter/material.dart';
import 'package:learn_dutch_app/model/collection.dart';
import 'package:learn_dutch_app/style.dart';

class CollectionDetails extends StatelessWidget {
  final int id;
  CollectionDetails({this.id});

  @override
  Widget build(BuildContext context) {
    final collection = Collection.fetchByID(id);
    final _detailsPageController = PageController(initialPage: 0);
    return Scaffold(
      appBar:
          AppBar(backgroundColor: primaryColor, title: Text(collection.title)),
      body: PageView(
        controller: _detailsPageController,
        children: List.generate(collection.vocabList.length, (index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            height: MediaQuery.of(context).size.height,
            child: (Column(
              children: <Widget>[
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(collection.vocabList[index].en,
                          style: TextStyle(fontSize: 20)),
                      SizedBox(height: 20),
                      Text(collection.vocabList[index].dutch,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 50,
                              fontWeight: FontWeight.w500)),
                    ])),
                Positioned(
                    bottom: 20,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(index == 0 ? "" : "Prev"),
                          Text(index == collection.vocabList.length - 1
                              ? ""
                              : "Next")
                        ]))
              ],
            )),
          );
        }),
      ),
    );
  }
}
