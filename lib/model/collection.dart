import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Vocab {
  final String en;
  final String dutch;

  Vocab({this.en, this.dutch});
}

class Collection {
  final String title;
  final int id;
  final bool alreadyLiked;
  final IconData iconSrc;
  final List<Vocab> vocabList;

  Collection(
      {this.id, this.title, this.alreadyLiked, this.iconSrc, this.vocabList});

  static List<Collection> fetchSaved() {
    final collections = fetchAll();
    List<Collection> saved = [];
    for (var i = 0; i < collections.length; i++) {
      if (collections[i].alreadyLiked == true) {
        saved.add(collections[i]);
      }
    }
    return saved;
  }

  static List<Collection> fetchAll() {
    return [
      Collection(
          id: 1,
          title: "Basic Greetings",
          alreadyLiked: true,
          iconSrc: FontAwesomeIcons.handshake,
          vocabList: [
            Vocab(en: "Hello", dutch: "Hallo"),
            Vocab(en: "How are you?", dutch: "Hoe Gaat Het?"),
            Vocab(en: "Thank you!", dutch: "Dank je wel!"),
            Vocab(en: "Bye!", dutch: "tot ziens!")
          ]),
      Collection(
          id: 2,
          title: "Numbers",
          alreadyLiked: false,
          iconSrc: FontAwesomeIcons.sortNumericUpAlt,
          vocabList: [
            Vocab(en: "one", dutch: "een"),
            Vocab(en: "two", dutch: "two"),
            Vocab(en: "three", dutch: "drie"),
            Vocab(en: "four", dutch: "vier"),
            Vocab(en: "five", dutch: "vijf"),
            Vocab(en: "six", dutch: "zes"),
            Vocab(en: "seven", dutch: "zeven"),
            Vocab(en: "eight", dutch: "acht"),
            Vocab(en: "nine", dutch: "negen"),
            Vocab(en: "ten", dutch: "ten")
          ]),
      Collection(
          id: 3,
          title: "Food",
          alreadyLiked: true,
          iconSrc: FontAwesomeIcons.utensils,
          vocabList: [
            Vocab(en: "apple", dutch: "appel"),
            Vocab(en: "orange", dutch: "oranje"),
            Vocab(en: "banana", dutch: "banaan"),
            Vocab(en: "bread", dutch: "brood"),
            Vocab(en: "milk", dutch: "melk"),
            Vocab(en: "cheese", dutch: "kaas")
          ]),
      Collection(
          id: 4,
          title: "Date & Time",
          alreadyLiked: false,
          iconSrc: FontAwesomeIcons.clock,
          vocabList: [
            Vocab(en: "morning", dutch: "morgen"),
            Vocab(en: "afternoon", dutch: "middag"),
            Vocab(en: "evening", dutch: "avond"),
            Vocab(en: "night", dutch: "nacht"),
            Vocab(en: "monday", dutch: "maandag"),
            Vocab(en: "tuesday", dutch: "dinsdag"),
            Vocab(en: "wednesday", dutch: "woensdag"),
            Vocab(en: "thursday", dutch: "donderdag"),
            Vocab(en: "friday", dutch: "vrijdag"),
            Vocab(en: "saturday", dutch: "zaterday"),
            Vocab(en: "sunday", dutch: "zondag")
          ]),
      Collection(
          id: 5,
          title: "Transporations",
          alreadyLiked: true,
          iconSrc: FontAwesomeIcons.busAlt,
          vocabList: [
            Vocab(en: "bus", dutch: "bus"),
            Vocab(en: "walk", dutch: "wandelen"),
            Vocab(en: "bicycle", dutch: "fiets"),
            Vocab(en: "boat", dutch: "boot"),
            Vocab(en: "airplane", dutch: "vliegtuig"),
          ]),
      Collection(
          id: 6,
          title: "Self-Introduction",
          alreadyLiked: false,
          iconSrc: FontAwesomeIcons.comment,
          vocabList: [
            Vocab(en: "My name is...", dutch: "Mijn naam is..."),
            Vocab(en: "I am ... years old", dutch: "Ik ben ... jaar oud"),
            Vocab(en: "I live in ...", dutch: "Ik woon in ...")
          ]),
    ];
  }

  static fetchByID(int collectionId) {
    //fetch all collections, filter down the specific collection by ID
    List<Collection> collections = fetchAll();
    for (var i = 0; i < collections.length; i++) {
      if (collections[i].id == collectionId) {
        return collections[i];
      }
    }
  }
}
