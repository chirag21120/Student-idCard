import 'package:flutter/material.dart';
import 'package:id_card/database.dart';
import 'package:id_card/user.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr extends StatelessWidget {
  String uid;
  Qr({Key? key,required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        print('back Button pressed');
        return true;
      },
      child: StreamBuilder<UserData?>(
        stream: DatabaseService(uid).userData,
        builder: (context,snapshot){
          if(snapshot.hasData){
            UserData? userData = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.green[100],
              appBar: AppBar(
                title: const Text("QR Cde"),
                centerTitle: true,
                backgroundColor: Colors.green,
                elevation: 0.0,
                leading: BackButton(
                  onPressed: (){
                    print("back button pressed");
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(60.0, 0.0, 30.0, 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImage(
                        data: ("${userData!.name} ${userData.rollno} ${userData.branch}"),
                      size: 300,
                      version:  QrVersions.auto,
                    )
                  ],
                ),
              ),
            );
          }else{
            return const Text("Error Loading Qr Code");
          }
        }

      ),
    );
  }
}



