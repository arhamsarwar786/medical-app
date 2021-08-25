import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/Constant1.dart';
import 'package:medical_app/chatSc/chat_body.dart';
import 'package:medical_app/data/Admin%20Dashboard.dart';
import 'package:medical_app/data/AllDonation.dart';
import 'package:medical_app/data/Profile.dart';
import 'package:medical_app/data/fila.dart';
import 'package:medical_app/data/test.dart';
import 'package:medical_app/main_page.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
Color color = Colors.red;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext context, orientation, devicetype) {
      return MaterialApp(
        title: 'Health App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
       
        home: AliMola(),
        
      );
    });
  }
}

class Ali extends StatelessWidget {
  List<String> Images = [
    "assets/medi1.png",
    "assets/medi2.jpg",
    "assets/medi3.jpg",
  ];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  var id;
  var nameMed;
  var priceMed;
  var expMed;
  var lenghtM;
  List<dynamic> namelist = [];
  List<dynamic> nameprice = [];
  List<dynamic> nameexp = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection("medicine info").snapshots(),
          builder: (context, snapshot) {
            lenghtM = snapshot.data!.docs;
            if (snapshot.hasData == false || snapshot.hasError) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              snapshot.data!.docs.forEach((element) {
                nameMed = element.data();
                namelist.add(nameMed["name"]);
                namelist = namelist.toSet().toList();
                priceMed = element.data();
                nameprice.add(priceMed["price"]);
                nameprice = nameprice.toSet().toList();
                expMed = element.data();
                nameexp.add(expMed['exp']);
                nameexp = nameexp.toSet().toList();
                print(nameexp);
              });
            }

            return Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage("assets/trans.jpg"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Hello,\n",
                                  style: kTitleStyle.copyWith(
                                    fontSize: 26.0,
                                    // color: kGrey2Color,
                                  ),
                                ),
                                TextSpan(
                                  text: "Ali",
                                  style: kTitleStyle.copyWith(
                                    fontSize: 21.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: kGrey2Color,
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage()));
                                },
                                icon: Icon(
                                  Icons.notifications_none,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                    SizedBox(height: 25.0),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            height: 150.0,
                            autoPlay: true,
                            enlargeCenterPage: true),
                        items: [
                          "assets/aq.jpg",
                          "assets/aq1.jpg",
                          "assets/aq2.png",
                          "assets/aq3.jpg"
                        ].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: 60078,
                                height: 150.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: kBlue2Color,
                                  image: DecorationImage(
                                    image: AssetImage(i),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      height: 100,
                      // width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                  onPressed: () {},
                                  child: CategoriesItem(
                                      title: "Donator",
                                      color: Colors.red[300])),
                              CategoriesItem(
                                  title: "Consumer", color: Colors.pink[300]),
                              CategoriesItem(
                                  title: "Appointment",
                                  color: Colors.grey[300]),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Recent Donation",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Spacer(),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Donation(
                                                images: Images,
                                                price: nameprice,
                                                exp: nameexp,
                                                name: namelist,
                                              )));
                                },
                                child: Text(
                                  "See all",
                                ),
                              )
                            ],
                          ),
                          DonationTiles(lenghtM: lenghtM, Images: Images, nameprice: nameprice, namelist: namelist, nameexp: nameexp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class DonationTiles extends StatelessWidget {
  const DonationTiles({
    Key? key,
    required this.lenghtM,
    required this.Images,
    required this.nameprice,
    required this.namelist,
    required this.nameexp,
  }) : super(key: key);

  final  lenghtM;
  final List<String> Images;
  final List nameprice;
  final List namelist;
  final List nameexp;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: lenghtM.length,
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

class CategoriesItem extends StatelessWidget {
  // final String title;
  // final Color color;
  var color;
  var title;
  CategoriesItem({
    this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width / 30, vertical: size.height / 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height / 40),
          color: color,
        ),
        child: Center(
          child: Text(title,
              style: kCategoryStyle.copyWith(
                  color: Colors.white,
                  fontSize: size.height / 50,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class AliMola extends StatefulWidget {
  @override
  _AliMolaState createState() => _AliMolaState();
}

class _AliMolaState extends State<AliMola> {
  int _currentIndex = 0;

  Widget buildpage() {
    switch (_currentIndex) {
      case 1:
        return Chart();
      case 2:
        return Ali();
      case 3:
        return Profile();
      case 0:
      default:
        return Irfan();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildpage(),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.graphic_eq),
            title: Text('Statistics'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text(
              'Messages test for mes teset test test ',
            ),
            activeColor: Colors.pink,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('profile'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
