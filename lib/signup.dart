import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:id_card/aut_controller.dart';


class Signup_Page extends StatefulWidget {
  const Signup_Page({Key? key}) : super(key: key);

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    double h= MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async{
        print('back Button pressed');
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: w,
              height: h*0.3,
              decoration:const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "img/signup.png"
                      ),
                      fit: BoxFit.cover
                  )
              ),
              child: Column(
                children: [
                  SizedBox(height: h*0.16,),
                  const Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 45,
                      backgroundImage:  AssetImage(
                        "img/profile1.png"
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left:20.0,right: 20.0),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [

                  const Text(
                    "Create your account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50.0,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 7,
                              offset: const Offset(1,1),
                              color: Colors.grey.withOpacity(0.2)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Email Id",
                          prefixIcon: const Icon(Icons.mail,color: Colors.deepOrange,),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 1.8,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.8,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 7,
                              offset: const Offset(1,1),
                              color: Colors.grey.withOpacity(0.2)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.password,color: Colors.deepOrange,),
                          focusedBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 1.8,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.8,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100,),
            GestureDetector(
              onTap: (){
                AuthController.instance.register(emailController.text.trim(), passwordController.text.trim());
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
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: w*0.15,),
                ],
            )),
    );

  }
}