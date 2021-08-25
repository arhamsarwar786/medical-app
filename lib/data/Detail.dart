import 'package:flutter/material.dart';
import 'package:medical_app/Constant1.dart';
import 'package:medical_app/main.dart';

import 'package:sizer/sizer.dart';
class Detail extends StatelessWidget {
  var price;
  var name;
  var exp;
  Detail({this.image, this.exp, this.price, this.name});
// final String image;
  var image;
  var day = DateTime.now().day.toString();
  var month = DateTime.now().month.toString();
  var t=DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      print(name);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text(
            "Detail",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Image.asset(image),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 380,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                        color: kGrey1Color,
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child:price==null?Center(child: CircularProgressIndicator(),): Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text("$day / ${DateTime.now().month.toString()} / $t ")
                              ],
                            ),

                            // SizedBox(height: 6.0),
                            Text(
                              "price",
                              // doctor.specialist,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              price,
                              // doctor.specialist,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),

                            Text(
                              "Expire date",
                              // doctor.specialist,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              exp.toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blueGrey
                                            ),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(35.0),
                                    ))),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Ali()));
                                },
                                child: Container(
                                  width: 300,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Landing Page",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
