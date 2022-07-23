import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:id_card/user.dart';

class DatabaseService{
  final String uid;
  DatabaseService(this.uid);
  //collection reference
  final CollectionReference idCardCollection = FirebaseFirestore.instance.collection("id_Card");

  Future updateUserData(String name, String rollno,String branch,int sem) async{
    return await idCardCollection.doc(uid).set({
      'name' : name,
      'rollno': rollno,
      'branch': branch,
      'sem': sem,
    });
  }
  //user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(uid: uid,
        name: snapshot.get('name'),
        rollno: snapshot.get('rollno'),
        branch: snapshot.get('branch'),
        sem: snapshot.get('sem')??0
    );
  }
  //get Id Card stream

//get user doc stream
Stream<UserData> get userData{
    return idCardCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
}
}