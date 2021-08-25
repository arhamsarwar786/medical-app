import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medical_app/medcineform.dart';
import 'AllDonation.dart';

String ytyt() {
  return File('medical.png').path;
}

// import 'package:path/path.dart';
// import 'package:file/file.dart';
class Donation extends StatelessWidget {
  // List<dynamic> price;
  // List<dynamic> name;
  // List<dynamic> exp;
   final price;
  final name;
  final exp;
  Donation({required this.images, required this.price, required this.name, required this.exp});
   List<dynamic> images;

  
  @override
  Widget build(BuildContext context) {
    print("price is $price");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>MedicineDetail()));
        },
        backgroundColor: Colors.blueGrey[700],
     
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("All Donation", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        
        shrinkWrap: true,
        itemCount: price.length,
        itemBuilder: (BuildContext context, int index) {
          return AllDoMedicine(image: images[index],priceMedd:price[index] ,nameMedd: name[index],expMedd: exp[index],);
        },
      ),
    );
  }
}
