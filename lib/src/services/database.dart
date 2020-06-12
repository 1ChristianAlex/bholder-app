import 'package:bholderapp/src/classes/profile.dart';
import 'package:firebase_database/firebase_database.dart' show FirebaseDatabase;

class DatabaseFB {
  final _fbDatabase = FirebaseDatabase.instance;

  Future<List<Profile>> getProfileList() async {
    final database = this._fbDatabase.reference();

    final profileList = await database.child('profiles').limitToFirst(3).once();

    List<dynamic> snapValue = profileList.value;
    List<Profile> profilesList = [];

    snapValue.forEach((profileItem) => {
          if (profileItem != null)
            {
              profilesList.add(new Profile(
                  profileItem['name'],
                  profileItem['birthday'],
                  profileItem['thumb'],
                  profileItem['description'],
                  profileItem['cpf'],
                  profileItem['skills']))
            }
        });

    return profilesList;
  }
}
