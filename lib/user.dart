class User{
  final String uid;

  User({required this.uid});
}

class UserData{
  final String uid;
  final String name;
  final String rollno;
  final String branch;
  final int sem;
  UserData({required this.uid,required this.name,required this.rollno,required this.branch,required this.sem});
}