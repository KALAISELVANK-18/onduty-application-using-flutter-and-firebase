import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

import 'package:od_kec/connect.dart';
class LeaveRequest extends StatefulWidget {
  const LeaveRequest({Key? key}) : super(key: key);
  static const String routeName = "/Leavereq";
  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}
enum SingingCharacter { Yes, No }
class _LeaveRequestState extends State<LeaveRequest> {
  MongoDatabasee obj  = new MongoDatabasee();
  final _formkey = GlobalKey<FormState>();

  late final FocusNode _d1FocusNode;
  late final FocusNode _d2FocusNode;
  late final FocusNode _lFocusNode;
  late final FocusNode _rFocusNode;
  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInput1 = TextEditingController();
  TextEditingController _text = TextEditingController();
  TextEditingController text1= TextEditingController();
  List<List<TextEditingController>> edit=[];
  List<String> editt=[];
  int i = 0;
  int k=0;
  int l=0;
  int m=0;int n=-1;
  bool _validate = false;
  FilePickerResult? result;

  SingingCharacter? _character = SingingCharacter.Yes;
  String value1 = 'Sick Leave';
  var items = [
    'Sick Leave' ,
    'Non Sick Leave',
    'Others',
  ];
  var item = [
    'Full day',
    'First Half','Second half','select periods'
  ];
  bool submit() {
    FocusScope.of(context).unfocus();
    if(!_formkey.currentState!.validate()){
      return false;
    }

    _formkey.currentState!.save();
    return true;
  }


  @override
  void initstate()
  {

    _d1FocusNode = FocusNode();
    _d2FocusNode=FocusNode();
    _lFocusNode = FocusNode();
    _rFocusNode = FocusNode();
    dateInput.text="";
    dateInput1.text="";
    super.initState();
  }
  @override
  void dispose()
  {

    _d1FocusNode.dispose();
    _d2FocusNode.dispose();
    _lFocusNode.dispose();
    _rFocusNode.dispose();
    _text.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Leave Request",style: TextStyle(color: Colors.white),),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: SafeArea(
            child: Form(
              key: _formkey,
              child:
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 30),child: Text("From date",style: GoogleFonts.ptSans(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white))),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: SizedBox(

                            height: 40,
                            width: MediaQuery.of(context).size.width*0.25,
                            child: TextFormField(

                              // textInputAction: TextInputAction.next,
                              // focusNode: _d1FocusNode,
                              controller: dateInput,
                              // onFieldSubmitted: (_)async=>FocusScope.of(context).requestFocus(_d2FocusNode),
                              // onSaved: (value) {
                              //   _date1 = value!.trim();
                              // },
                              style: TextStyle(fontSize: 12,color: Colors.white),
                              decoration: InputDecoration(

                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)
                                  )
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter valid input";
                                }
                                return null;
                              },
                              readOnly: true,
                              onTap: () async {
                                i=1;

                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                  print(formattedDate); //formatted date output using intl package =>2021-03-16
                                  setState(() {
                                    dateInput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {

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

                              },

                            ),

                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30),child: Text("To date",style: GoogleFonts.ptSans(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white))),
                        Padding(
                          padding: EdgeInsets.only(top: 30,right: 10),
                          child: SizedBox(
                            height:40,
                            width: MediaQuery.of(context).size.width*0.25,
                            child: TextFormField(

                              // textInputAction: TextInputAction.next,
                              // focusNode: _d2FocusNode,
                              // onFieldSubmitted: (_)async=>FocusScope.of(context).requestFocus(_lFocusNode),
                              // onSaved: (value) {
                              //   _date2 = value!.trim();
                              // },
                              style: TextStyle(fontSize: 12,color: Colors.white),
                              controller: dateInput1,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)
                                  )
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter valid input";
                                }
                                if(int.parse(value.substring(0,2))<=int.parse(dateInput.text.substring(0,2))){
                                  return "Please check the dates";
                                }

                                return null;
                              },
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                  print(formattedDate); //formatted date output using intl package =>2021-03-16
                                  setState(() {
                                    dateInput1.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {
                                  k=1;

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
                              },
                            ),
                          ),
                        ),
                      ],mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ),),

                    Padding(padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Leavetype :", style: GoogleFonts.ptSans(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Container(
                                  child: DropdownButton(
                                    style: TextStyle(color: Colors.white),
                                    value: value1,
                                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                    dropdownColor: Color.fromARGB(20,220, 220, 220),

                                    items: items.map((String items)
                                    {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Container(
                                            decoration: BoxDecoration(

                                            ),
                                            child: Text(items,style: TextStyle(color: Colors.white),)),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue){
                                      setState((){
                                        value1 = newValue!;
                                      } );
                                      if(value1==Null)
                                        l=1;
                                    },
                                  ),

                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if(value1=="Others")
                      Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
                        child: bo(),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top:20),
                      child: Row(
                        children: [
                          Text("Reason for Leave",style: GoogleFonts.ptSans(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.start,),
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
                          // focusNode: _lFocusNode,
                          // textInputAction: TextInputAction.done,
                          //
                          // onSaved: (value) {
                          //   _leavetype = value!.trim();
                          // },
                          // onFieldSubmitted: (_)async{
                          //   submit();
                          // },
                          controller: _text,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              ),

                              hintText: "Write Reason For Leave,",
                              hintStyle: TextStyle(color: Colors.white24)
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter valid input";
                            }
                            else if (value!.length < 20) {
                              return "Please provide longer input";
                            }
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
                            
                            onPressed: ()async{

                                // Validate returns true if the form is valid, or false otherwise.
                                if(submit()){
                                obj.leavepush(dateInput.text, dateInput1.text,value1 , text1.text, _text.text,edit,editt);
                                setState(() {
                                  dateInput1.clear();
                                  dateInput.clear();

                                  value1= items[0];
                                  text1.clear();
                                  _text.clear();
                                });
                                }
                            

                            },
                            child:
                            Text("Apply",style: TextStyle(fontSize: 15,color: Colors.white),),
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
                        hintText: 'to period',
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


  Widget bo()
  {
    _LeaveRequestState obj = new _LeaveRequestState();
    return TextFormField(
      validator: (value){
        if(value1=="others"&&value!.isEmpty)return "enter valid input";

      },
      controller: obj.text1,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: "Purpose of leave",
        hintStyle: TextStyle(color: Colors.white24),
      ),

    );
  }
}
