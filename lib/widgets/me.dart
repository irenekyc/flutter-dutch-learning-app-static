import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_dutch_app/style.dart';
import 'package:learn_dutch_app/widgets/collection_details.dart';
import '../model/collection.dart';

class Me extends StatelessWidget {
  List<Collection> _savedCollections = [
    Collection(
        id: 1, title: "Basic Greetings", iconSrc: FontAwesomeIcons.handshake),
    Collection(
        id: 5, title: "Transportation", iconSrc: FontAwesomeIcons.busAlt),
    Collection(id: 3, title: "Food", iconSrc: FontAwesomeIcons.utensils)
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(children: [
      Container(
          margin: EdgeInsets.only(top: 50),
          height: 120,
          child: Center(
              child: Container(
                  child: Center(
                      child: FaIcon(FontAwesomeIcons.user,
                          size: 50, color: Colors.white)),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: secondaryColor, shape: BoxShape.circle)))),
      Text("Irene",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w500)),
      Text("Beginer", style: TextStyle(color: Colors.grey, fontSize: 20)),
      SizedBox(height: 10),
      Container(
          width: size.width,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("My Collections", style: TitleTextStyle)),
      Expanded(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: secondaryColor.withOpacity(0.5),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40), topLeft: Radius.circular(40))),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            children: List.generate(_savedCollections.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CollectionDetails(id: _savedCollections[index].id);
                  }));
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                    height: 80,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FaIcon(_savedCollections[index].iconSrc,
                            size: 50, color: primaryColor),
                        Spacer(),
                        Text(_savedCollections[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: primaryColor, fontSize: 16))
                      ],
                    )),
              );
            })),
      )),
    ]));
  }
}
