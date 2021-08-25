import 'package:flutter/material.dart';
import 'package:medical_app/Constant1.dart';
import 'package:medical_app/data/AllDonation.dart';

class Irfan extends StatefulWidget {
  const Irfan({ Key? key }) : super(key: key);

  @override
  _IrfanState createState() => _IrfanState();
}

class _IrfanState extends State<Irfan> {
   List name = [
  
    "Add ",
    "Add ",
    "Set ",
    "Check ",
  ];
  List name1=[
     " Students",
    " Teachers",
    " TimeTable",
    "Attendence",

  ];
  List name2=[
    "assets/th.jpg",
    "assets/th (1).jpg",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                    ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
               
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Container(
                      width: MediaQuery.of(context).size.width*0.60,
                    
                      child: Text(
                        "Admin Name ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      height: 55.0,
                      margin: EdgeInsets.symmetric(horizontal: 18.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: kGrey1Color,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            icon: Icon(
                              Icons.search,
                              size: 20.0,
                              color: Colors.black54,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
          Positioned(
            top: 160,
            left: 10,
            right: 10,
            child: Container(
    
              padding: EdgeInsets.symmetric(horizontal: 15,),
              
              height: MediaQuery.of(context).size.height - 245,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  buildTitleRow("Admin Dashboard" ),
                  SizedBox(
                    height: 10,
                  ),
                   SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                     
                       child:Row(
                        //  mainAxisAlignment: MainAxisAlignment.spac,
                         children: [
                           buildTaskItem(
                           "Monthly", "Reports",'assets/th (1).jpg'),
                            buildTaskItem(
                           "Medicine", "Verify","assets/th.jpg"),
                          //   buildTaskItem(
                          //  "Add", "Students",""),
                          
                        
                         ],
                       ),
                     ),
                  SizedBox(
                    height: 10,
                  ),
                   buildTitleRow("Live Report's" ),
                   SingleChildScrollView(
                     
                     child:Column(
                       children: [
                     SizedBox(height: 10,),
                     Tiles(),
                     Tiles(),
                    // buildClassItem(),
                    // buildClassItem(),
                       ],
                     ),
                   )
                  
        
                ],
              ),
            ),
          )
        ],
      ),
    ),
    );
  }

  Container buildTaskItem( String courseTitle, String name1,String name2) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(0),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
      
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
                    color: Colors.blue,
                    width: 1,
                    ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
          Container(
            height: 80,
            width: 150,
            // color: Colors.black,
            decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
             topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          image: DecorationImage(
            image: AssetImage(name2),
            fit:BoxFit.fitHeight
            ),

            ),
          ),
 SizedBox(height: 3,),


          Text(
            courseTitle,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(
            name1,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
  Row buildTitleRow(String title,) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          
              "$title" ,
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
      
        ),     
        
      ],
    );
  }

  Container buildClassItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
         color: Colors.blue.withOpacity(0.18),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "07:00",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
              ),
              Text(
                "AM",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 2,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  "The Basic of Typography II",
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "Room C1, Faculty of Art & Design Building",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=200&q=80"),
                    radius: 10,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Gabriel Sutton",
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class Tiles extends StatelessWidget {


  @override
  var id;
  var nameMed;
  var priceMed;
  var expMed;
  var lenghtM=2;
  List<dynamic> namelist = ['ab'];
  List<dynamic> nameprice = ['10'];
  List<dynamic> nameexp = ["4"];
  List<dynamic> Images=['assets/aq1.jpg'];
  Widget build(BuildContext context) {
 return   Container(
  //  color: Colors.red,
      child: ListView.builder(
        itemCount: 1,
        // scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return AllDoMedicine(
            image: Images[index],
            priceMedd: nameprice[index],
            nameMedd: namelist[index],
            expMedd: nameexp[index],
          );
        },
      ),
    );
  }
}