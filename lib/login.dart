import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:id_card/aut_controller.dart';
import 'package:id_card/signup.dart';

import 'id_card.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    double w = MediaQuery.of(context).size.width;
    double h= MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              width: w,
              height: h*0.3,
              decoration:const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "img/loginimg.png"
                      ),
                    fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left:20.0,right: 20.0),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                      "Login into your account",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.grey
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
                      textInputAction: TextInputAction.done,
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
                      textInputAction: TextInputAction.continueAction,
                    ),
                  ),
                  const SizedBox(height: 10,),
                   ],
              ),
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
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
                     "Sign in",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom:  MediaQuery.of(context).viewInsets.bottom)),
            SizedBox(height: 100,),
            RichText(text: TextSpan(
              text: "Don\'t have an account?",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 20
              ),
              children: [
                TextSpan(
                text: "Create",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                  recognizer: TapGestureRecognizer()..onTap=()=>
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                        return const Signup_Page();
                      }))

                )
              ]
            )),
          ],
        ),
      ),
    );
  }
}