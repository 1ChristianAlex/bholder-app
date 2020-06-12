import 'package:bholderapp/src/classes/profile.dart';
import 'package:flutter/material.dart';

class CardProfileList extends StatelessWidget {
  Profile profileProp;
  CardProfileList(Profile profile) {
    this.profileProp = profile;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Hero(
            tag: profileProp.thumb,
            child: Image(image: NetworkImage(profileProp.thumb))),
        title: Text(profileProp.name),
        subtitle: Text(profileProp.description.substring(0, 50) + '...'),
      ),
    );
  }
}
