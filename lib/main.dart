import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:od_kec/firebase_options.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:od_kec/connect.dart';
import 'package:od_kec/allconnect.dart';
import 'package:od_kec/screens/Home.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:realm/realm.dart';

final user = FirebaseAuth.instance.currentUser;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyHomePage.routeName,

      title: 'Flutter Demo',
      /*routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        MyHomePage.routeName: (context) => const MyHomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        MyHomePage1.routeName: (context) => const MyHomePage1(),
      },*/
      home: (user!=null)?const MyHomePage1():const MyHomePage(),
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const String routeName = "/";




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MongoDatabasee obj=new MongoDatabasee();


  @override
  Widget build(BuildContext context) {
      TextEditingController email=new TextEditingController();
      TextEditingController pass=new TextEditingController();
      return WillPopScope(
        onWillPop: ()async=>false,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          body: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Icon(
                  Icons.swipe_down,
                  size: 100,
                  color: Colors.blueAccent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Hello Again!',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Welcome Back you have been missed !',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 23),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter Email'),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    controller: pass,
                    decoration: InputDecoration(
                        filled: true, //<-- SEE HERE
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter Password'),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 220, top: 10),
                child: Text('Recovery Password',
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.blueAccent)),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      padding: MaterialStateProperty.all(EdgeInsets.only(
                          top: 15, bottom: 15, right: 130, left: 130)),
                      backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async{
                      String vv=await obj.zz(email.text,pass.text);
                      if(vv=="success")
                        {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage1(),
                            ),
                          );
                        }
                     else if(vv=="fgd"){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MyHomePage1(),
                          ),
                        );
                      }
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Or continue with',
                  style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    //child: Image.asset('assets/gg.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    //child: Image.asset('assets/apple.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    //child: Image.asset('assets/fb.png'),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, left: 90),
                    child: Text(
                      'Not a member?',
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                  ),


                ],
              ),
            ]),
          ),
        ),
      );
  }
}




