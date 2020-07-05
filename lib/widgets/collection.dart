import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_dutch_app/style.dart';
import 'package:learn_dutch_app/widgets/collection_details.dart';
import '../model/collection.dart';

class Collections extends StatelessWidget {
  final collections = Collection.fetchAll();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(children: <Widget>[
          Text("Collections", style: TitleTextStyle),
          Expanded(
            child: ListView(
                children: collections
                    .map((collection) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CollectionDetails(id: collection.id)));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: secondaryColor))),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FaIcon(collection.iconSrc,
                                      color:
                                          supplmentaryColor.withOpacity(0.5)),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(collection.title,
                                        style: TextStyle(
                                            color: supplmentaryColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18)),
                                  ),
                                  Icon(
                                      collection.alreadyLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 24,
                                      color: primaryColor)
                                ]),
                          ),
                        ))
                    .toList()),
          )
        ]));
  }
}
