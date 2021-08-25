import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/main.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

class MedicineDetail extends StatefulWidget {
  const MedicineDetail({Key? key}) : super(key: key);

  @override
  _MedicineDetailState createState() => _MedicineDetailState();
}

class _MedicineDetailState extends State<MedicineDetail> {
  FirebaseFirestore store = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  XFile? _image;
  XFile? _camra;
  final _picker = ImagePicker();

  String? retrieveDataError;

  imgFromGallery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  imageFromCamra() async {
    XFile? camra = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _camra = camra;
    });
  }

  Future retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    // if (response == null) {
    //   return;
    // }
    if (response.file != null) {
      setState(() {
        if (response.type != null) {
          setState(() {
            _camra = response.file!;
            _image = response.file!;
          });
        } else {
          retrieveDataError = response.exception!.code;
        }
      });
    }
  }

  imageFile() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.04.h,
        width: MediaQuery.of(context).size.width,
        child: Image.file(File(_image!.path)));
  }

  camarFile() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.04.h,
        width: MediaQuery.of(context).size.width,
        child: Image.file(File(_camra!.path)));
  }

  dialoge(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            backgroundColor: Colors.indigo[900],
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            title: Text(
              'Select the file',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
              ),
            ),
            actionsPadding: EdgeInsets.only(right: 20.w),
            actions: [
              IconButton(
                  onPressed: () {
                    imgFromGallery();
                  },
                  icon: Icon(Icons.photo),
                  color: Colors.white),
              IconButton(
                onPressed: () {
                  imageFromCamra();
                },
                icon: Icon(Icons.camera),
                color: Colors.white,
              )
            ],
          ),
        );
      },
    );
  }

  var name;
  var price;
  var exp;
  TextEditingController nameMed = TextEditingController();
  TextEditingController priceMed = TextEditingController();
  TextEditingController expMed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(_image);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.indigo[900],
              height: MediaQuery.of(context).size.height * 0.04.h,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: _image != null || _camra != null
                    ? _camra != null
                        ? camarFile()
                        : imageFile()
                    : IconButton(
                        onPressed: () {
                          dialoge(context);
                        },
                        icon: Icon(
                          Icons.select_all,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07.h,
              margin: EdgeInsets.all(7.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "MEDICINE INFO",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 5.w, right: 5.w,
                      // top: 1.h
                    ),
                    child: TextFormField(
                        controller: nameMed,
                        onChanged: (val) {
                          name = val;
                        },
                        decoration: InputDecoration(
                          labelText: "Name",
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 5.w, right: 5.w,
                      //  top: 2.h
                    ),
                    child: TextFormField(
                        controller: priceMed,
                        onChanged: (val2) {
                          price = val2;
                        },
                        decoration: InputDecoration(
                          labelText: "price",
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 5.w, right: 5.w,
                      //  top: 1.h
                    ),
                    child: TextFormField(
                        controller: expMed,
                        onChanged: (val3) {
                          exp = val3;
                        },
                        decoration: InputDecoration(
                          labelText: "Expire Date",
                        )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 5.h,
                    width: MediaQuery.of(context).size.width * 0.1.w,
                    margin: EdgeInsets.only(
                      left: 5.w, right: 5.w,
                      // top: 1.h
                    ),
                    decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.circular(35)),
                    child: MaterialButton(
                      onPressed: () {
                        try {
                          CollectionReference reference = FirebaseFirestore
                              .instance
                              .collection("medicine info");
                          reference.add({
                            "name": name,
                            "price": price,
                            'exp': exp,
                            'uid':auth.currentUser!.uid,
                          }).then((value) => Get.snackbar("Submitted", "Success")).then((value) => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Ali())));
                        } catch (e) {
                          print(e);
                        }
                        nameMed.clear();
                        priceMed.clear();
                        expMed.clear();
                      },
                      child: Text(
                        "Submitt",
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
          ],
        ),
      ),
    );
  }
}
