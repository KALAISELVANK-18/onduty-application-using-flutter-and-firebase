// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:od_kec/connect.dart';
// import 'package:textfield_search/textfield_search.dart';
// import 'package:http/http.dart' as http;
// import 'package:csv/csv.dart';
// import 'dart:convert';
//
// class Odrequest extends StatefulWidget {
//   const Odrequest({Key? key}) : super(key: key);
//   static const String routeName = "/OD";
//   @override
//   State<Odrequest> createState() => _OdrequestState();
// }
//
// class _OdrequestState extends State<Odrequest> {
//   final _formkey = GlobalKey<FormState>();
//   MongoDatabasee k = new MongoDatabasee();
//   TextEditingController dateInput = TextEditingController();
//   TextEditingController dateInput1 = TextEditingController();
//   TextEditingController tom = TextEditingController();
//   FilePickerResult? result;
//
//   Future<List<dynamic>> d = University.getData();
//
//   String searchValue = '';
//   final List<String> _suggestions = [];
//   var label = "Some Label";
//   TextEditingController myController = TextEditingController();
//   int m=0;
//
//   String value1 = 'Sports';
//   var items = [
//     'Sports',
//     'Technical',
//     'Non Technical',
//   ];
//
//   int j=0;
//   int l=0;
//   int i=0;
//   String value2 = 'Inside';
//   String value3 = 'Select';
//   var it = [
//     'Inside',
//     'Outside',
//   ];
//
//   get errorText => null;
//   @override
//   void initstate() {
//     dateInput.text = "";
//     dateInput1.text = "";
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: Text("OD Request",style: TextStyle(color:Colors.white ),),
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.only(left: 10, right: 10),
//             child: Form(
//               child:
//               Container(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Padding(
//                             padding: EdgeInsets.only(top: 30),
//                             child: Text("From date",
//                                 style: GoogleFonts.ptSans(
//                                     fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white))),
//                         Padding(
//                           padding: EdgeInsets.only(top: 30),
//                           child: SizedBox(
//                             height: 40,
//                             width: MediaQuery.of(context).size.width * 0.25,
//                             child: TextField(
//                               controller: dateInput,
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.white
//                               ),
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.grey),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.grey)
//                                   )
//                               ),
//                               readOnly: true,
//                               onTap: () async {
//                                 DateTime? pickedDate = await showDatePicker(
//                                     context: context,
//                                     initialDate: DateTime.now(),
//                                     firstDate: DateTime(1950),
//                                     //DateTime.now() - not to allow to choose before today.
//                                     lastDate: DateTime(2100));
//
//                                 if (pickedDate != null) {
//                                   print(
//                                       pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                                   String formattedDate =
//                                   DateFormat('dd-MM-yyyy').format(pickedDate);
//                                   print(
//                                       formattedDate); //formatted date output using intl package =>2021-03-16
//                                   setState(() {
//                                     dateInput.text =
//                                         formattedDate; //set output date to TextField value.
//                                   });
//                                 } else {
//
//                                 }
//                               },
//                             ),
//                           ),
//                         ),
//                         Padding(
//                             padding: EdgeInsets.only(top: 30),
//                             child: Text("To date",
//                                 style: GoogleFonts.ptSans(
//                                     fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white))),
//                         Padding(
//                           padding: EdgeInsets.only(top: 30, right: 10),
//                           child: SizedBox(
//                             height: 40,
//                             width: MediaQuery.of(context).size.width * 0.25,
//                             child: TextField(
//                               style: TextStyle(fontSize: 12,color: Colors.white),
//                               controller: dateInput1,
//                               decoration: InputDecoration(
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.grey),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(color: Colors.grey)
//                                   )
//                               ),
//                               readOnly: true,
//                               onTap: () async {
//                                 DateTime? pickedDate = await showDatePicker(
//                                     context: context,
//                                     initialDate: DateTime.now(),
//                                     firstDate: DateTime(1950),
//                                     //DateTime.now() - not to allow to choose before today.
//                                     lastDate: DateTime(2100));
//
//                                 if (pickedDate != null) {
//                                   print(
//                                       pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                                   String formattedDate =
//                                   DateFormat('dd-MM-yyyy').format(pickedDate);
//                                   print(
//                                       formattedDate); //formatted date output using intl package =>2021-03-16
//                                   setState(() {
//                                     dateInput1.text =
//                                         formattedDate; //set output date to TextField value.
//                                   });
//                                 } else {
//                                   throw new Exception("please enter valid date");
//                                 }
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Category :",
//                             style: GoogleFonts.ptSans(
//                                 fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Column(
//                               children: [
//                                 DropdownButton(
//                                   value: value1,
//                                   dropdownColor: Colors.black,
//                                   icon: const Icon(
//                                       Icons.keyboard_arrow_down_outlined),
//                                   items: items.map((String items) {
//                                     return DropdownMenuItem(
//                                       value: items,
//                                       child: Text(items,style: GoogleFonts.ptSans(color: Colors.white,fontSize: 16)),
//                                     );
//                                   }).toList(),
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       value1 = newValue!;
//                                     });
//                                     print(value1);
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Participated:",
//                             style: GoogleFonts.ptSans(
//                                 fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 10),
//                             child: Column(
//                               children: [
//                                 DropdownButton(
//                                   value: value2,
//                                   dropdownColor: Colors.black,
//                                   icon: const Icon(
//                                       Icons.keyboard_arrow_down_outlined),
//                                   items: it.map((String it) {
//                                     return DropdownMenuItem(
//                                       value: it,
//                                       child: Text(it,style: GoogleFonts.ptSans(color: Colors.white,fontSize: 16)),
//                                     );
//                                   }).toList(),
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       value2 = newValue!;
//                                       print(value2);
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     if (value2 == "Outside")
//                       Padding(
//
//                         padding: const EdgeInsets.only(top:20,bottom: 20),
//                         child: Column(
//                           children: [
//
//                             Row(
//                               children: [
//                                 Text("Select College",textAlign: TextAlign.start,style: GoogleFonts.ptSans(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
//                               ],
//                               mainAxisAlignment: MainAxisAlignment.start,
//                             ),
//                             bo(),
//                           ],
//                           mainAxisAlignment: MainAxisAlignment.start,
//                         ),
//
//                       ),
//                     Row(
//                       children: [
//                         Padding(padding: EdgeInsets.only(top: 20),
//                           child: Text("Attachment",style: GoogleFonts.ptSans(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
//                         ),
//                       ],mainAxisAlignment: MainAxisAlignment.start,
//                     ),
//                     Padding(padding: EdgeInsets.only(top: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(
//                             height: 50,
//                             width: MediaQuery.of(context).size.width*0.7,
//                             child: TextButton(
//                               onPressed: ()async{
//                                 result = await FilePicker.platform.pickFiles();
//                                 if(result!=null)
//                                 {
//                                   setState(() {
//                                     m=1;
//                                   });
//                                   result?.files.forEach((element) {print(element.name);});
//                                 }
//                                 else{
//                                   print("No file selected");
//                                 }
//                               },
//                               child: Text("Attach Document Proof",style: GoogleFonts.ptSans(fontSize: 16,color: Colors.white),),
//                               style: TextButton.styleFrom(
//                                   backgroundColor: Colors.blueGrey,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20)
//                                   )
//                               ),
//                             ),
//                           ),
//                           if(result==null)
//                             Icon(
//                               Icons.check,
//                               color: Colors.redAccent,
//
//                             )
//                           else
//                             Icon(
//                               Icons.check,
//                               color: Colors.green,
//                             )
//                         ],
//                       ),
//                     ),
//
//                     Padding(padding: EdgeInsets.only(top: 20,bottom: 25),
//
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//
//                           TextButton(
//                             onPressed: (){},
//                             child: Text("Cancel",style: TextStyle(fontSize: 15,color: Colors.white),),
//                             style: TextButton.styleFrom(
//
//                               backgroundColor: Colors.redAccent,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 //set border radius more than 50% of height and width to make circle
//                               ),
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: ()=>{
//
//                             },
//                             child: Text("Apply",style: TextStyle(fontSize: 15,color: Colors.white),),
//                             style: TextButton.styleFrom(
//
//                               backgroundColor: Colors.green,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 //set border radius more than 50% of height and width to make circle
//                               ),
//                             ),
//
//                           ),
//
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget bo() {
//     myController = TextEditingController();
//     return TextFieldSearch(
//       textStyle: TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.grey)
//           )
//       ),
//       initialList: ['Anna university, college of engineering'],
//       minStringLength: 0,
//       future: () {
//         return d;
//       },
//
//       label: label,
//       controller: myController,
//     );
//   }
// }
//
//
// class University {
//   String webPage;
//
//   University({
//     required this.webPage,
//   });
//
//   static Future<List<dynamic>> getData() async {
//     Uri url = Uri.parse(
//         "https://data.gov.in/files/ogdpv2dms/s3fs-public/Report-66-2704201512525131PM-2012-2013.csv");
// // "http://universities.hipolabs.com/search?country=india",
//     http.Response response = await http.get(url);
//
//     List<List<dynamic>> rowsAsListOfValues = [];
//     List<dynamic> ll = [1, 1, 'Anna university,college of engineering, guindy'];
//     rowsAsListOfValues.add(ll);
//     rowsAsListOfValues
//         .addAll(const CsvToListConverter().convert(response.body));
//
//     List<dynamic> universities = rowsAsListOfValues.map((e) {
//       return e[2];
//     }).toList();
//     return universities;
//   }
// }




import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'dart:convert';
import 'package:od_kec/connect.dart';
class Odrequest extends StatefulWidget {
  const Odrequest({Key? key}) : super(key: key);
  static const String routeName = "/OD";
  @override
  State<Odrequest> createState() => _OdrequestState();
}

class _OdrequestState extends State<Odrequest> {
  final _formkey = GlobalKey<FormState>();
  MongoDatabasee k = new MongoDatabasee();
  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInput1 = TextEditingController();
  TextEditingController tom = TextEditingController();
  FilePickerResult? result;
  List<List<TextEditingController>> edit=[];
  List<String> editt=[];
  Future<List<dynamic>> d = University.getData();

  String searchValue = '';
  final List<String> _suggestions = [];
  var label = "Some Label";
  TextEditingController myController = TextEditingController();
  TextEditingController myController1 = TextEditingController();
  TextEditingController myController2 = TextEditingController();
  TextEditingController reason = TextEditingController();
  int m=0;

  int n=-1;

  String value1 = 'Sports';
  var items = [
    'Sports',
    'Technical',
    'Non Technical','others'
  ];

  int j=0;
  int l=0;
  int i=0;
  String value2 = 'Inside';

  var it = [
    'Inside',
    'Outside',
    'others'
  ];

  var item = [
    'Full day',
    'First Half','Second half','select periods'
  ];

  get errorText => null;

  bool submit() {
    FocusScope.of(context).unfocus();
    if(!_formkey.currentState!.validate()){
      return false;
    }

    _formkey.currentState!.save();
    return true;
  }

  @override
  void initstate() {
    dateInput.text = "";
    dateInput1.text = "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Pre Od Request"),
      ),
      body: SingleChildScrollView(

        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Form(
                key: _formkey,
              child:
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text("From date",
                                style: GoogleFonts.ptSans(
                                    fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white))),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter valid input";
                                }

                                String s2=dateInput.text;
                                var arr1 = s2.split('-');

                                if(dateInput1.text!=""){
                                  var arr=dateInput1.text.split('-');
                                  final birthday =  DateTime(int.parse(arr1[2]),int.parse(arr1[1]),int.parse(arr1[0]));
                                  final date2 = DateTime(int.parse(arr[2]),int.parse(arr[1]),int.parse(arr[0]));
                                  var n = date2.difference(birthday).inDays;
                                  if(n<0)return "enter correct dates";
                                }

                                return null;
                              },
                              controller: dateInput,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white
                              ),

                              decoration: InputDecoration(

                                  hintStyle:TextStyle(fontSize: 10,color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.5)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.5)
                                  ),
                                  hintText: 'From date',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius
                                          .circular(
                                          6))),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>2021-03-16
                                  setState(() {
                                    dateInput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {

                                }
                                String s2=dateInput.text;
                                var arr1 = s2.split('-');

                                if(dateInput1.text!=""){
                                  var arr=dateInput1.text.split('-');
                                  final birthday =  DateTime(int.parse(arr1[2]),int.parse(arr1[1]),int.parse(arr1[0]));
                                  final date2 = DateTime(int.parse(arr[2]),int.parse(arr[1]),int.parse(arr[0]));
                                  n = date2.difference(birthday).inDays;
                                }
                                setState(() {
                                  edit=[];
                                  editt=[];
                                  if(n>=0){
                                    for(int j=0;j<n+1;j++){
                                      edit.add(<TextEditingController>[TextEditingController(text: "ii"),TextEditingController(text:"jj" )]);
                                      edit[j][0].clear();
                                      edit[j][1].clear();

                                      editt.add("Full day");}
                                  }});
                              },
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text("To date",
                                style: GoogleFonts.ptSans(
                                    fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white))),
                        Padding(
                          padding: EdgeInsets.only(top: 30, right: 10),
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter valid input";
                                }


                                String s2=dateInput1.text;
                                var arr = s2.split('-');

                                if(dateInput.text!=""){
                                  var arr1=dateInput.text.split('-');
                                  final birthday =  DateTime(int.parse(arr1[2]),int.parse(arr1[1]),int.parse(arr1[0]));
                                  final date2 = DateTime(int.parse(arr[2]),int.parse(arr[1]),int.parse(arr[0]));
                                  var n = date2.difference(birthday).inDays;
                                  if(n<0)return "enter correct dates";
                                }

                                return null;
                              },
                              style: TextStyle(fontSize: 12,color: Colors.white),
                              controller: dateInput1,
                              decoration: InputDecoration(

                                  hintStyle:TextStyle(fontSize: 10,color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.5)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.5)
                                  ),
                                  hintText: 'To date',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius
                                          .circular(
                                          6))),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);

                                  setState(() {
                                    dateInput1.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  throw new Exception("please enter valid date");
                                }
                                String s2=dateInput1.text;
                                var arr = s2.split('-');

                                if(dateInput.text!=""){
                                  var arr1=dateInput.text.split('-');
                                  final birthday =  DateTime(int.parse(arr1[2]),int.parse(arr1[1]),int.parse(arr1[0]));
                                  final date2 = DateTime(int.parse(arr[2]),int.parse(arr[1]),int.parse(arr[0]));
                                  n = date2.difference(birthday).inDays;
                                }
                                setState((){
                                  edit=[];
                                  editt=[];
                                  if(n>=0){
                                    for(int j=0;j<n+1;j++){
                                  edit.add(<TextEditingController>[TextEditingController(text: "ii"),TextEditingController(text:"jj" )]);
                                  edit[j][0].clear();
                                  edit[j][1].clear();

                                    editt.add("Full day");}
                                  }});
                                print(n);
                              },
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    if(n>=0)


                          for(i=0;i<n+1;i++)

                          Padding(padding: EdgeInsets.only(top: 10),child: Column(
                            children: [
                              Row(
                                children: [
                                  Text("Day "+(i).toString()+" :",style: GoogleFonts.ptSans(color: Colors.white),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: drop(i),
                                  ),
                                ],mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              if(editt[i]=="select periods")
                              Textf(i),

                            ],
                          ),
                          ),






                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Category:  ",
                            style: GoogleFonts.ptSans(
                                fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 21),
                            child: Column(
                              children: [
                                DropdownButton(
                                  value: value1,
                                  dropdownColor: Colors.black,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,style: GoogleFonts.ptSans(color: Colors.white,fontSize: 16)),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      value1 = newValue!;
                                    });
                                    print(value1);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    if(value1=="others")
                      Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: bo1(),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Participated:",
                            style: GoogleFonts.ptSans(
                                fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                DropdownButton(
                                  value: value2,
                                  dropdownColor: Colors.black,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                  items: it.map((String it) {
                                    return DropdownMenuItem(
                                      value: it,
                                      child: Text(it,style: GoogleFonts.ptSans(color: Colors.white,fontSize: 16)),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      value2 = newValue!;
                                      print(value2);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (value2 == "Outside")
                      Padding(

                        padding: const EdgeInsets.only(top:20,bottom: 20),
                        child: Column(
                          children: [

                            Row(
                              children: [
                                Text("Select College",textAlign: TextAlign.start,style: GoogleFonts.ptSans(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),
                            SizedBox(height: 5,),
                            bo(),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),



                      ),

                    if(value2=="others")
                      Padding(

                        padding: const EdgeInsets.only(top:20,bottom: 20),
                        child: Column(
                          children: [

                            Row(
                              children: [
                                Text("Enter organization",textAlign: TextAlign.start,style: GoogleFonts.ptSans(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),
                            SizedBox(height: 5,),
                            TextFormField(
                              validator: (value){
                                if(value2=="others"&&value!.isEmpty)return "enter valid input";

                                return null;
                              },
                              decoration: InputDecoration(

                                  hintStyle:TextStyle(fontSize: 10,color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white,
                                          width: 1.5)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.5)
                                  ),
                                  hintText: 'Enter Oraganization',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius
                                          .circular(
                                          6))),
                              controller: myController1,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white
                              ),

                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),



                      ),

                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Row(
                        children: [
                          Text("Reason for OD",style: GoogleFonts.ptSans(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.start,),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.9,
                        height: 200,
                        child: TextFormField(

                          style: TextStyle(color: Colors.white),

                          controller: reason,
                          decoration: InputDecoration(

                              hintStyle:TextStyle(fontSize: 10,color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.5)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 1.5)
                              ),
                              hintText: 'Enter reason fro OD',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(
                                      6))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter valid input";
                            }
                            else if (value!.length < 20) {
                              return "Please provide longer input";
                            }
                            if(myController.text.isEmpty&&value2=="Outside")
                              return "Enter college details";
                            return null;
                          },
                          maxLines: 8,
                        ),
                      ),
                    ),



                    Padding(padding: EdgeInsets.only(top: 20,bottom: 25),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          TextButton(
                            onPressed: (){},
                            child: Text("Cancel",style: TextStyle(fontSize: 15,color: Colors.white),),
                            style: TextButton.styleFrom(

                              backgroundColor: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                //set border radius more than 50% of height and width to make circle
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: ()=>{
                                    if(submit()){
                                      print(676767),
                                   k.preodpush(dateInput.text, dateInput1.text, edit, editt, value1, myController2.text, value2, myController.text, myController1.text, reason.text),
                                    Navigator.pop(context)
                                    }
                            },
                            child: Text("Apply",style: TextStyle(fontSize: 15,color: Colors.white),),
                            style: TextButton.styleFrom(

                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                //set border radius more than 50% of height and width to make circle
                              ),
                            ),

                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }

  Widget bo() {
    myController =new TextEditingController();
    return TextFieldSearch(


      textStyle: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          )
      ),
      initialList: ['Anna university, college of engineering'],
      minStringLength: 0,
      future: () {
        return d;
      },

      label: label,
      controller: myController,
    );
  }
  Widget drop(int i){

    return Column(
      children: [
        DropdownButton(
          value: editt[i],
          dropdownColor: Colors.black,
          icon: const Icon(
              Icons.keyboard_arrow_down_outlined),
          items: item.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item,style: GoogleFonts.ptSans(color: Colors.white,fontSize: 16)),
            );
          }).toList(),
          onChanged: (String? newValue){
            setState(() {
               edit[i][0].clear();
               edit[i][1].clear();
              editt[i] = newValue!;

            });}),
      ],
    );
  }
  Widget Textf(int i) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Column(
        children: [
          Row(
          children: [
            Text("From period",style: TextStyle(color: Colors.white),),
            Padding(
              padding: const EdgeInsets.only(left: 5,),
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.25,
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty &&editt[i]=="select periods") {
                        return "Please enter valid input";
                      }

                      if(int.parse(value)<1||int.parse(value)>7)
                        return "enter correctly";
                      return null;
                      },
                  decoration: InputDecoration(

                      hintStyle:TextStyle(fontSize: 10,color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.5)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.5)
                      ),
                      hintText: 'From period',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius
                              .circular(
                              6))),
                  controller: edit[i][0],
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                  ),

                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text("To period",style: TextStyle(color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.25,
                child: TextFormField(
                  validator: (value) {
                  if (value!.isEmpty &&editt[i]=="select periods") {
                  return "Please enter valid input";
                  }
                  if(int.parse(value)<1||int.parse(value)>7)
                    return "enter correctly";
                  if(int.parse(value)-int.parse(edit[i][0].text)<0)return "check from";
                  return null;
                  },

                  decoration: InputDecoration(

                      hintStyle:TextStyle(fontSize: 10,color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.5)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.5)
                      ),
                      hintText: 'To period',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius
                              .circular(
                              6))),
                  controller: edit[i][1],
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                  ),


                ),),
            ),      ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
        ],
      ),
    );
  }
  Widget bo1()
  {

    return TextFormField(


      validator: (value){
        if(value1=="others"&&value!.isEmpty)return "enter valid input";


      },
      controller: myController2,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(

          hintStyle:TextStyle(fontSize: 10,color: Colors.white),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.5)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.5)
          ),
          hintText: 'Reason for OD',
          border: OutlineInputBorder(
              borderRadius: BorderRadius
                  .circular(
                  6))),

    );
  }
}

class University {
  String webPage;

  University({
    required this.webPage,
  });

  static Future<List<dynamic>> getData() async {
    Uri url = Uri.parse(
        "https://data.gov.in/files/ogdpv2dms/s3fs-public/Report-66-2704201512525131PM-2012-2013.csv");
// "http://universities.hipolabs.com/search?country=india",
    http.Response response = await http.get(url);

    List<List<dynamic>> rowsAsListOfValues = [];
    List<dynamic> ll = [1, 1, 'Anna university,college of engineering, guindy'];
    rowsAsListOfValues.add(ll);
    rowsAsListOfValues
        .addAll(const CsvToListConverter().convert(response.body));

    List<dynamic> universities = rowsAsListOfValues.map((e) {
      return e[2];
    }).toList();
    return universities;
  }



}





/*
 ListView.builder(
                        shrinkWrap: true,
                          itemCount: n+1,
                          itemBuilder: (BuildContext context,i){

                          return Column(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 10),child: Row(
                                children: [
                                  Text("Day "+(i+1).toString()+":",style: GoogleFonts.ptSans(color: Colors.white),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: drop(),
                                  ),
                                ],mainAxisAlignment: MainAxisAlignment.start,
                              ),
                              ),
                              Row(
                                children: [
                                  Textf(),
                                ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          );
                        }),
*/














/*
 Row(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 20),
                          child: Text("Attachment",style: GoogleFonts.ptSans(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                        ),
                      ],mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    Padding(padding: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.7,
                            child: TextButton(
                              onPressed: ()async{
                                result = await FilePicker.platform.pickFiles();
                                if(result!=null)
                                {
                                  setState(() {
                                    m=1;
                                  });
                                  result?.files.forEach((element) {print(element.name);});
                                }
                                else{
                                  print("No file selected");
                                }
                              },
                              child: Text("Attach Document Proof",style: GoogleFonts.ptSans(fontSize: 16,color: Colors.white),),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              ),
                            ),
                          ),
                          if(result==null)
                            Icon(
                              Icons.check,
                              color: Colors.redAccent,

                            )
                          else
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                        ],
                      ),
                    ),
*/