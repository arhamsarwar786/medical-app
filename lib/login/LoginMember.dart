import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical_app/firebaseAuth.dart';
import 'package:medical_app/login/SigUpMem.dart';
import 'package:medical_app/main.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class LoginMember extends StatefulWidget {
  const LoginMember({ Key? key }) : super(key: key);

  @override
  _LoginMemberState createState() => _LoginMemberState();
}

class _LoginMemberState extends State<LoginMember> {
    FirebaseService service = FirebaseService();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NeumorphicText(
                "LOGIN",
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
                margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 8.h),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    oppositeShadowLightSource: true,
                    color: Colors.white,
                    shape: NeumorphicShape.flat,
                    lightSource: LightSource.bottom,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(35.0)),
                    intensity: 10,
                    border: NeumorphicBorder(
                      color: Colors.white,
                      isEnabled: true,
                    ),
                  ),
                  child: TextFormField(
                    controller: email,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.person,
                            size: 3.5.h,
                            color: Colors.indigo[900],
                          ),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(
                            color: Colors.indigo[900], fontSize: 14.sp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 5.h),
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
                    controller: pass,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900],
                        fontSize: 14.sp),
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(
                            Icons.lock,
                            size: 3.h,
                            color: Colors.indigo[900],
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            color: Colors.indigo[900], fontSize: 14.sp),
                        border: OutlineInputBorder(
                            // borderSide: BorderSide(color: Color(0xff1A237A)
                            // ),
                            borderRadius: BorderRadius.circular(35.0))),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 5.w),
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h, bottom: 1.5.h),
                width: 50.w,
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
                  onPressed: () {
                    try{
                    service
                        .login(email.text, pass.text)
                        .then((value) =>
                            {Get.snackbar("LogIn Successfully", "Success")})
                        .then(
                          (value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ali(),
                            ),
                          ),
                        ).catchError((onerror)=>Get.snackbar("Try Again", onerror.message));}catch(e){
                          print(e);
                        }
                  },
                  child: Text(
                    "Sign In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpMeme()));
                },
                child: Text(
                  "Dont have an account?Sign up here",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}