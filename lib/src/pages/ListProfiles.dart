import 'package:bholderapp/src/classes/profile.dart';
import 'package:bholderapp/src/contansts/colors.dart';
import 'package:bholderapp/src/pages/ProfileFull.dart';
import 'package:bholderapp/src/services/database.dart';
import 'package:bholderapp/src/widgets/CardProfileList.dart';
import 'package:flutter/material.dart';

class ListProfiles extends StatefulWidget {
  @override
  _ListProfilesState createState() => _ListProfilesState();
}

class _ListProfilesState extends State<ListProfiles> {
  Future<List<Profile>> _listItem() async {
    final db = DatabaseFB();
    final profileFuture = await db.getProfileList();

    return profileFuture;
  }

  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) => listItem());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // Here we take the value from the Login object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('List Profiles'),
            backgroundColor: ColorsBholder.blue),
        backgroundColor: ColorsBholder.darkBlue,
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: FutureBuilder(
            future: _listItem(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Profile>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int indexProfile) {
                    Profile profile = snapshot.data[indexProfile];
                    return Center(
                      child: Card(
                        child: InkWell(
                          splashColor: ColorsBholder.blue.withAlpha(30),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileFull(profile)));
                          },
                          child: Container(child: CardProfileList(profile)),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ));
  }
}
