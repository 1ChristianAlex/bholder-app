import 'package:bholderapp/src/classes/profile.dart';
import 'package:bholderapp/src/contansts/colors.dart';
import 'package:flutter/material.dart';

class ProfileFull extends StatefulWidget {
  Profile profileProp;
  ProfileFull(Profile profile) {
    this.profileProp = profile;
  }
  @override
  _ProfileFullState createState() => _ProfileFullState();
}

class _ProfileFullState extends State<ProfileFull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsBholder.white,
      appBar: AppBar(
          title: Text('Profiles View'), backgroundColor: ColorsBholder.blue),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              child: Hero(
                tag: widget.profileProp.thumb,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(image: NetworkImage(widget.profileProp.thumb)),
                ),
              ),
              padding: EdgeInsets.all(15),
            ),
            Container(
              child: Text(widget.profileProp.name),
              padding: EdgeInsets.all(15),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(widget.profileProp.description),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(widget.profileProp.cpf),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text('Skills:'),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(widget.profileProp.skills
                  .toString()
                  .replaceAll('[', '')
                  .replaceAll(']', '')),
            ),
            // ListView.builder(
            //   primary: false,
            //   physics: NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: widget.profileProp.skills.length,
            //   itemBuilder: (BuildContext context, int indexSkill) {
            //     return Padding(
            //       padding: EdgeInsets.all( 15),
            //       child: Text(widget.profileProp.skills[indexSkill]),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
