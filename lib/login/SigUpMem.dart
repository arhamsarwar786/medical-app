import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:medical_app/chatSc/chat_message.dart';

import 'package:medical_app/login/LoginMember.dart';
import 'package:sizer/sizer.dart';

class SignUpMeme extends StatefulWidget {
  @override
  _SignUpMemeState createState() => _SignUpMemeState();
}

class _SignUpMemeState extends State<SignUpMeme> {
  var nameU;
  var emaiU;
  var passu;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference reference =
      FirebaseFirestore.instance.collection("userInfo");
  var userid;

  @override
  Widget build(BuildContext context) {
    // print("data is"+data.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   "Sign Up",
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 18.sp,
              //       fontWeight: FontWeight.bold),
              // ),
              NeumorphicText(
                "Sign In",
                style: NeumorphicStyle(
                  shadowLightColor: Colors.blueGrey,
                  lightSource: LightSource.topRight,
                  depth: 3.5,
                  intensity: 5,
                  color: Colors.indigo[900],
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 7.h),
                child: Neumorphic(
                  style: NeumorphicStyle(
                      lightSource: LightSource.bottom,
                      oppositeShadowLightSource: true,
                      color: Colors.white,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(35.0)),
                      intensity: 10,
                      border: NeumorphicBorder(
                        color: Colors.white,
                        isEnabled: true,
                      )),
                  child: TextFormField(
                    onChanged: (val1) {
                      nameU = val1;
                    },
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: name,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.person,
                            size: 3.h,
                            color: Colors.indigo[900],
                          ),
                        ),
                        hintText: "Name",
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.indigo[900],
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 4.5.h),
                child: Neumorphic(
                  style: NeumorphicStyle(
                      lightSource: LightSource.bottom,
                      oppositeShadowLightSource: true,
                      color: Colors.white,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(35.0)),
                      intensity: 10,
                      border: NeumorphicBorder(
                        color: Colors.white,
                        isEnabled: true,
                      )),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: email,
                    onChanged: (val2) {
                      emaiU = val2;
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.email,
                            size: 3.h,
                            color: Colors.indigo[900],
                          ),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.indigo[900],
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 4.5.h),
                child: Neumorphic(
                  style: NeumorphicStyle(
                      lightSource: LightSource.bottom,
                      oppositeShadowLightSource: true,
                      color: Colors.white,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(35.0)),
                      intensity: 10,
                      border: NeumorphicBorder(
                        color: Colors.white,
                        isEnabled: true,
                      )),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: pass,
                    onChanged: (val3) {
                      passu = val3;
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.lock,
                            size: 3.h,
                            color: Colors.indigo[900],
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.indigo[900],
                        ),
                        border: OutlineInputBorder(
                            // borderSide: BorderSide(color: Color(0xff1A237A)),
                            borderRadius: BorderRadius.circular(35))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 4.5.h),
                child: Neumorphic(
                  style: NeumorphicStyle(
                      lightSource: LightSource.bottom,
                      oppositeShadowLightSource: true,
                      color: Colors.white,
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(35.0)),
                      intensity: 10,
                      border: NeumorphicBorder(
                        color: Colors.white,
                        isEnabled: true,
                      )),
                  child: TextFormField(
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: cpass,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Icon(
                          Icons.lock,
                          size: 3.h,
                          color: Colors.indigo[900],
                        ),
                      ),
                      hintText: "Conferm Password",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.indigo[900],
                      ),
                      border: OutlineInputBorder(
                        // borderSide: BorderSide(color: Color(0xff1A237A)),
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 7.h,
                ),
                width: 60.w,
                height: 7.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(10.0),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.greenAccent),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff1A237A)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35.0),
                      ))),
                  onPressed: () async {
                    auth.createUserWithEmailAndPassword(
                        email: emaiU, password: passu);
                    userid = auth.currentUser!.uid;
                    Map<String, dynamic> data = {
                      'name': nameU,
                      'email': emaiU,
                      'uid': userid,
                    };
                    await reference
                        .add(data)
                        .then((value) => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginMember())))
                        .catchError((onError) =>
                            Get.snackbar("Try again", onError.message));

                    name.clear();
                    pass.clear();
                    cpass.clear();
                    email.clear();
                  },
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
