import 'package:flutter/material.dart';
import 'package:id_card/aut_controller.dart';
import 'package:id_card/database.dart';
import 'package:id_card/qr.dart';
import 'package:id_card/user.dart';


class WelcomePage extends StatelessWidget {
  String uid;
   WelcomePage({Key? key,required this.uid}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);
    double w = MediaQuery.of(context).size.width;
    double h= MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async{
        print('back Button pressed');
        return false;
      },
      child: StreamBuilder<UserData?>(
        stream: DatabaseService(uid).userData,
        builder: (context,snapshot){
          if(snapshot.hasData){
            UserData? userData = snapshot.data;
            return  Scaffold(
              backgroundColor: Colors.green[100],
              appBar: AppBar(
                title: const Text("ID Card"),
                centerTitle: true,
                backgroundColor: Colors.green,
                elevation: 0.0,
                actions: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        AuthController.instance.logOut();
                      },
                      icon: Icon(Icons.person),
                      label: Text('logout'))
                ],
              ),
              body:  Padding(
                padding: const EdgeInsets.fromLTRB(20.0,30.0, 30.0,10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child:  CircleAvatar(
                        backgroundImage: AssetImage(
                          'img/profile.png',
                        ),
                        radius: 50.0,
                      ),
                    ),
                    Divider(
                      thickness: 2.0,
                      height: 40.0,
                      color: Colors.green[200],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(width: 20,),
                          Text(
                            userData!.name,
                            style: const TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),

                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0,),
                    Row(
                      children: [
                        const Text(
                          'Roll No',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(width: 20.0,),
                          Text(
                            userData.rollno,
                            style: const TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 25.0,),
                    Row(
                      children: [
                        const Text(
                          'Branch',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(width: 20.0,),
                            Text(
                              (userData.branch),
                            style: const TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0,),
                    Row(
                      children: [
                        const Text(
                          'Semester',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(width: 20.0,),
                        Text(
                          (userData.sem).toString(),
                          style: const TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 50.0,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                        return Qr(uid: userData.uid);
                      }));
                    },
                    child: Container(
                      width: w*0.5,
                      height: h*0.08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                              image: AssetImage(
                                  "img/loginbtn.png"
                              ),
                              fit: BoxFit.cover
                          )
                      ),
                      child:  Center(
                        child: RichText(
                          text: const TextSpan(
                            text:  "QR Code",
                            style:  TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            // recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: w*0.15,),
                  ]
                )
              )
            );
          }else{
            //AuthController.instance.logOut();
            return Scaffold(
              appBar: AppBar(
                title: Text("No data Found"),
                centerTitle: true,
                backgroundColor: Colors.green,
                elevation: 0.0,
                actions: <Widget>[
                  FlatButton.icon(
                      onPressed: () {
                        AuthController.instance.logOut();
                      },
                      icon: Icon(Icons.person),
                      label: Text('logout'))
                ],

              ),
            );
          }

        }
      ),
    );
  }
}
