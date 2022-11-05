import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_gen/models/postdatamodel.dart';
import 'package:form_gen/pages/pdf_page.dart';
import 'package:form_gen/webservices/webservices.dart';
import 'package:http/http.dart';
// ignore: depend_on_referenced_packages
// import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import '../models/models.dart';

int signarturnumber = 0;

int signarturnumbertwo = 0;
int signarturnumberthree = 0;
int signarturnumberfour = 0;
int signarturnumberfive = 0;

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController one = TextEditingController();
  TextEditingController two = TextEditingController();
  TextEditingController three = TextEditingController();
  TextEditingController four = TextEditingController();
  TextEditingController five = TextEditingController();
  TextEditingController six = TextEditingController();
  TextEditingController seven = TextEditingController();
  TextEditingController eight = TextEditingController();
  TextEditingController nine = TextEditingController();
  TextEditingController ten = TextEditingController();
  TextEditingController five_A = TextEditingController();

  String radioValueone = 'Not Applicable';
  String radiovaluetwo = 'Not Applicable';
  String radiovaluethree = 'Not Applicable';
  String radioValuefrou = 'Not Applicable';
  String radioValuefive = 'Not Applicable';
  String radioValuesix = 'Not Applicable';
  String radioValueseven = 'Not Applicable';
  String radioValueeight = 'Not Applicable';
  String radioValuenine = 'Not Applicable';
  String radioValueten = 'Not Applicable';
  String radioValueeleven = 'Not Applicable';
  String radioValuetwelwe = 'Not Applicable';
  bool isloading = true;
  var getpdff;
  var responseyorno = 'n';

  homepage() async {
    var res = await getpdf();
    setState(() {
      getpdff = Categorymodels.fromJson(res);
      isloading = false;
      clearText();
      // print('HomePage Data: ' + getpdff);
    });
    return getpdf;
  }

  var mypostdata;
  mydata() async {
    setState(() {
      if (data != null) {
        mypostdata = Postmodeldata.fromJson(data);
        isloading = false;
        // print('HomePage Data: ' + getpdff);
      }
    });

    mypostdata != null ? print(mypostdata.response) : print('wait');
    return mypostdata;
  }

  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   one.dispose();
  //   two.dispose();
  //   three.dispose();
  //   four.dispose();
  //   five.dispose();
  //   six.dispose();
  //   seven.dispose();
  //   eight.dispose();
  //   nine.dispose();

  //   super.dispose();
  // }

  TextEditingController dateInput = TextEditingController();
  TextEditingController bottomDate = TextEditingController();
  TextEditingController techsign = TextEditingController();
  @override
  void clearText() {
    // TODO: implement dispose
    one.clear();
    two.clear();
    three.clear();
    four.clear();
    five.clear();
    six.clear();
    seven.clear();
    eight.clear();
    nine.clear();
    five_A.clear();
    dateInput.clear();
    bottomDate.clear();
    // techsign.clear();

    // super.dispose();
  }

  static const List<String> mydropdownlist = <String>[
    'Select',
    'Person one',
    'Person two',
    'Person three',
    'Person four',
    'Person five',
  ];
  //  static const  List techsign = [
  //   'Person one sign',
  //   'Person two sign ',
  //   'Person three sign',
  //   'Person four sign ',
  //   'Person five sign ',
  // ];
  List signlist = [
    'Person one sign',
    'Person two sign ',
    'Person three sign',
    'Person four sign ',
    'Person five sign ',
  ];

  String dropdownValueone = mydropdownlist.first;
  String dropdownValuetwo = mydropdownlist.first;
  String dropdownValuethree = mydropdownlist.first;
  String dropdownValuefour = mydropdownlist.first;
  String dropdownValuefive = mydropdownlist.first;

  @override
  void initState() {
    // dateInput.text = ""; //set the initial value of text field
    // bottomDate.text = "";
    mydata();
    myresponse;
    print('this is init');
    getpdf();
    data != null ? data : null;
    responseyorno = 'n';
    mypostdata != null ? mypostdata : null;
    signarturnumber = 0;
    signarturnumbertwo = 0;
    signarturnumberthree = 0;
    signarturnumberfour = 0;
    signarturnumberfive = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      print('this is set state');
    });
    // clearText();
    myresponse;
    mydata();
    data;
    DateTime firstdata = DateTime(1990, 11, 1);
    DateTime finaldate = DateTime(2022, 11, 1);
    // TextEditingController dateinput = TextEditingController();
    DateTime selectdate = DateTime(2022, 11, 1);

    BoxDecoration mybodedxdecoration = BoxDecoration(boxShadow: const [
      BoxShadow(
          color: Colors.grey,
          blurRadius: 5.0,
          spreadRadius: 1,
          offset: Offset(2, 2)),
    ], borderRadius: BorderRadius.circular(50), color: Colors.deepPurple[100]);
    TextStyle mytextstyle = TextStyle(color: Colors.purple[300], fontSize: 18);
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[50],
        // elevation: 0,
        title: Text(
          ' Form 11',
          style: TextStyle(color: Colors.purple[300]),
        ),
        leading: IconButton(
          onPressed: (() {
            Navigator.pop(context);
          }),
          icon: const Icon(Icons.arrow_back),
          color: Colors.purple[300],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please fill the form',
                  style: TextStyle(fontSize: 20, color: Colors.purple[300]),
                ),
                const SizedBox(
                  height: 40,
                ),
                myformtextfield(mytextstyle, mybodedxdecoration,
                    '1. Name of the Occupier', one),
                myformtextfield(mytextstyle, mybodedxdecoration,
                    '2. Name & address of the Factory', two),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '3.(a) Type Identification number and description of hoist, lift'
                    'lifting machine, chains, ropes and lifting tackles.',
                    three),
//                 myformtextfield(mytextstyle, mybodedxdecoration, '(b) Date of construction or reconstruction and the date when thehoist, lift, lifting machine, chains, ropes and lifting tackles'
// 'were first taken into use in the factory.', four),

                // Text(
                //   'Name and Address of Factory',
                //   style: mytextstyle,
                // ),
                // Container(
                //   margin: const EdgeInsets.only(top: 10, bottom: 10),
                //   decoration: mybodedxdecoration,
                //   height: 50,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   constraints: const BoxConstraints(
                //       minHeight: 0, maxHeight: double.infinity),
                //   padding:
                //       const EdgeInsets.only(bottom: 2, left: 20, right: 30),
                //   child: TextFormField(
                //     autofocus: false,
                //     controller: two,
                //     decoration: InputDecoration(
                //         hintStyle: TextStyle(
                //             fontSize: 17, color: Colors.deepPurple[300]),
                //         hintText: 'Name and Address of Factory',
                //         border: InputBorder.none),
                //   ),
                // ),
                // const Divider(),
                // SizedBox(
                //   // color: Colors.amber,
                //   width: MediaQuery.of(context).size.width * 0.8,
                //   child: Text(
                //     ' Type Identification number and description of hoist, lift, lifting machine, chains, ropes, and lifting tackles',
                //     style: mytextstyle,
                //   ),
                // ),
                // Container(
                //   margin: const EdgeInsets.only(top: 10, bottom: 10),
                //   decoration: mybodedxdecoration,
                //   height: 50,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   constraints: const BoxConstraints(
                //       minHeight: 0, maxHeight: double.infinity),
                //   padding:
                //       const EdgeInsets.only(bottom: 2, left: 20, right: 30),
                //   child: TextFormField(
                //     controller: three,
                //     autofocus: false,
                //     decoration: InputDecoration(
                //         hintStyle: TextStyle(
                //             fontSize: 17, color: Colors.deepPurple[300]),
                //         // hintText: ' Name of the Occupier',
                //         border: InputBorder.none),
                //   ),
                // ),
                // const Divider(),
                //calander
                SizedBox(
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    '3.(b) Date of Constuction or Reconstruction and the date when  hoist, lift, lifting machine, chains, ropes, and lifting tackles',
                    style: mytextstyle,
                  ),
                ),

                Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: mybodedxdecoration,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding:
                        const EdgeInsets.only(bottom: 2, left: 20, right: 30),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
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
                                    DateFormat('yyyy/MM/dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateInput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                            icon: Icon(
                              Icons.calendar_month,
                              color: Colors.deepPurple[500],
                            )),
                        Container(
                          height: 50,
                          width: 150,
                          // color: Colors.amber,
                          child: TextFormField(
                              enabled: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter text';
                                }
                                return null;
                              },
                              controller: dateInput,
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                      color: Colors.redAccent, fontSize: 15),
                                  hintStyle: TextStyle(
                                      fontSize: 17,
                                      color: Colors.deepPurple[300]),
                                  hintText: DateTime.now().toString(),
                                  border: InputBorder.none)),
                        )
                      ],
                    )),
                const Divider(),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '4. Date of last examinations made under section 28 (1)(a)(ii)'
                    'and 29 (1) (a) (iii) and by whom it was carried out.',
                    four),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '5.(A) Maintenance: (List of parts, if any, which were inaccessible)'
                    'Are the following parts of the hoist of lift properly maintained'
                    'and in good working order? If not, state what defects havebeen found:-',
                    five),

                // SizedBox(
                //   // color: Colors.amber,
                //   width: MediaQuery.of(context).size.width * 0.8,
                //   child: Text(
                //     ' Date of Last Examination made under section 28 and (1)(a)(ii) and 29(1)(a)(iii) and by whom it was carried out ',
                //     style: mytextstyle,
                //   ),
                // ),
                // Container(
                //   margin: const EdgeInsets.only(top: 10, bottom: 10),
                //   decoration: mybodedxdecoration,
                //   height: 50,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   constraints: const BoxConstraints(
                //       minHeight: 0, maxHeight: double.infinity),
                //   padding:
                //       const EdgeInsets.only(bottom: 2, left: 20, right: 30),
                //   child: TextFormField(
                //     controller: four,
                //     autofocus: false,
                //     decoration: InputDecoration(
                //         hintStyle: TextStyle(
                //             fontSize: 17, color: Colors.deepPurple[300]),
                //         hintText: ' Name of the Occupier',
                //         border: InputBorder.none),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const Divider(),

                // SizedBox(
                //   // color: Colors.amber,
                //   width: MediaQuery.of(context).size.width * 0.8,
                //   child: Text(
                //     ' Date of Last Examination made under section 28 and (1)(a)(ii) and 29(1)(a)(iii) and by whom it was carried out ',
                //     style: mytextstyle,
                //   ),
                // ),
                // Container(
                //   margin: const EdgeInsets.only(top: 10, bottom: 10),
                //   decoration: mybodedxdecoration,
                //   height: 50,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   constraints: const BoxConstraints(
                //       minHeight: 0, maxHeight: double.infinity),
                //   padding:
                //       const EdgeInsets.only(bottom: 2, left: 20, right: 30),
                //   child: TextFormField(
                //     controller: five,
                //     autofocus: false,
                //     decoration: InputDecoration(
                //         hintStyle: TextStyle(
                //             fontSize: 17, color: Colors.deepPurple[300]),
                //         hintText: 'Name and Address of Factory',
                //         border: InputBorder.none),
                //   ),
                // ),
                //radio secton

                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(a) Enclosure of hoistway or lift.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValueone,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueone = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValueone,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueone = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(b) Landing gates and cage gate(s).',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radiovaluetwo,
                                  onChanged: (value) {
                                    setState(() {
                                      radiovaluetwo = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radiovaluetwo,
                                  onChanged: (value) {
                                    setState(() {
                                      radiovaluetwo = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(c) Interlocks on the landing gates and cage gate(s).(d) Other gates fastenings.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radiovaluethree,
                                  onChanged: (value) {
                                    setState(() {
                                      radiovaluethree = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radiovaluethree,
                                  onChanged: (value) {
                                    setState(() {
                                      radiovaluethree = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(d) Other gates fastenings.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValuefrou,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuefrou = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValuefrou,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuefrou = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(e) Cage and platform and fittings, cage guides, buffers,interior of the hoistway or liftway.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValuefive,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuefive = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValuefive,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuefive = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(f) Overrunning devices.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValuesix,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuesix = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValuesix,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuesix = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(g) Suspension ropes or chains and their attachments.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValueseven,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueseven = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValueseven,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueseven = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(h) Safety gear, i.e. arrangements for preventing fall of'
                            'platform or cage brakes Safety gear, i.e. arrangementsfor preventing fall of platform or cage brakes.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValueeight,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueeight = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValueeight,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueeight = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(i) Brakes.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValuenine,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuenine = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValuenine,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuenine = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(j) Work of spur gearing.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValueten,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueten = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValueten,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueten = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(k) Other electrical equipment.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValueeleven,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueeleven = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValueeleven,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValueeleven = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(l) Other parts.',
                            style: mytextstyle,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints:
                                    BoxConstraints(minWidth: 0, maxWidth: 200),
                                // height: 30,
                                width: 200,
                                child: RadioListTile(
                                  title: Text("Not Applicable "),
                                  value: "Not Applicable",
                                  groupValue: radioValuetwelwe,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuetwelwe = value.toString();
                                    });
                                  },
                                ),
                              ),
                              Container(
                                // color: Colors.amber,
                                width: 120,
                                // height: 30,
                                child: RadioListTile(
                                  title: Text("ok"),
                                  value: "ok",
                                  groupValue: radioValuetwelwe,
                                  onChanged: (value) {
                                    setState(() {
                                      radioValuetwelwe = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '5(B). Date and number of certificate relating to any test and'
                    'examination made under sub-rule (1) of rule 64 together with'
                    'the name of the person who issued the certificate.',
                    five_A),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '5(C) Date and number of certificate relating to any test and'
                    'examination made under sub-rule (1) of rule 64 together with'
                    'the name of the person who issued the certificate.',
                    six),
                // const Divider(),
                // SizedBox(
                //   // color: Colors.amber,
                //   width: MediaQuery.of(context).size.width * 0.8,
                //   child: Text(
                //     ' Date of Last Examination made under section 28 and (1)(a)(ii) and 29(1)(a)(iii) and by whom it was carried out ',
                //     style: mytextstyle,
                //   ),
                // ),

                // myformtextfield(mytextstyle, mybodedxdecoration, text, textcontroller)
                // Container(
                //   margin: const EdgeInsets.only(top: 10, bottom: 10),
                //   decoration: mybodedxdecoration,
                //   height: 50,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   constraints: const BoxConstraints(
                //       minHeight: 0, maxHeight: double.infinity),
                //   padding:
                //       const EdgeInsets.only(bottom: 2, left: 20, right: 30),
                //   child: TextFormField(
                //     controller: six,
                //     autofocus: false,
                //     decoration: InputDecoration(
                //         hintStyle: TextStyle(
                //             fontSize: 17, color: Colors.deepPurple[300]),
                //         hintText: 'Name and Address of Factory',
                //         border: InputBorder.none),
                //   ),
                // ),

                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    ' (i) Date of annealing or the heat treatment of the chain &'
                    'lifting tackle carried out under sub-rule (5) of rule 64 and by whom it was carried out.',
                    seven)
                // SizedBox(
                //   // color: Colors.amber,
                //   width: MediaQuery.of(context).size.width * 0.8,
                //   child: Text(
                //     ' (i) Date of annealing or the heat treatment of the chain &'
                //     'lifting tackle carried out under sub-rule (5) of rule 64 and by whom it was carried out.',
                //     style: mytextstyle,
                //   ),
                // ),
                // Container(
                //   margin: const EdgeInsets.only(top: 10, bottom: 10),
                //   decoration: mybodedxdecoration,
                //   height: 50,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   constraints: const BoxConstraints(
                //       minHeight: 0, maxHeight: double.infinity),
                //   padding:
                //       const EdgeInsets.only(bottom: 2, left: 20, right: 30),
                //   child: TextFormField(
                //     controller: seven,
                //     autofocus: false,
                //     decoration: InputDecoration(
                //         hintStyle: TextStyle(
                //             fontSize: 17, color: Colors.deepPurple[300]),
                //         hintText: '',
                //         border: InputBorder.none),
                //   ),
                // ),
                // const Divider(),

                ,
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '(ii) Perticulars of any defect found at any such examination'
                    'or after annealing and affecting the safe working load'
                    'and of steps taken to remedy such defect.',
                    eight),
                // SizedBox(
                //   // color: Colors.amber,
                //   width: MediaQuery.of(context).size.width * 0.8,
                //   child: Text(
                //     '(ii) Perticulars of any defect found at any such examination'
                //     'or after annealing and affecting the safe working load'
                //     'and of steps taken to remedy such defect.',
                //     style: mytextstyle,
                //   ),
                // ),
                // Container(
                //   margin: const EdgeInsets.only(top: 10, bottom: 10),
                //   decoration: mybodedxdecoration,
                //   height: 50,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   constraints: const BoxConstraints(
                //       minHeight: 0, maxHeight: double.infinity),
                //   padding:
                //       const EdgeInsets.only(bottom: 2, left: 20, right: 30),
                //   child: TextFormField(
                //     controller: eight,
                //     autofocus: false,
                //     decoration: InputDecoration(
                //         hintStyle: TextStyle(
                //             fontSize: 17, color: Colors.deepPurple[300]),
                //         hintText: '',
                //         border: InputBorder.none),
                //   ),
                // ),
                // const Divider(),
                myformtextfield(
                    mytextstyle,
                    mybodedxdecoration,
                    '(iii)Repairs,renewals or alterations (if any) required and'
                    'the period within which they should be executed and'
                    ' maximum safe working load subject to repairs, renewals'
                    ' or alternations (if any).',
                    nine)
                // SizedBox(
                //   // color: Colors.amber,
                //   width: MediaQuery.of(context).size.width * 0.8,
                //   child: Text(
                //     '(iii)Repairs,renewals or alterations (if any) required and'
                //     'the period within which they should be executed and'
                //     ' maximum safe working load subject to repairs, renewals'
                //     ' or alternations (if any).',
                //     style: mytextstyle,
                //   ),
                // ),
                // Container(
                //   margin: const EdgeInsets.only(top: 10, bottom: 10),
                //   decoration: mybodedxdecoration,
                //   height: 50,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   constraints: const BoxConstraints(
                //       minHeight: 0, maxHeight: double.infinity),
                //   padding:
                //       const EdgeInsets.only(bottom: 2, left: 20, right: 30),
                //   child: TextFormField(
                //     controller: nine,
                //     autofocus: false,
                //     decoration: InputDecoration(
                //         hintStyle: TextStyle(
                //             fontSize: 17, color: Colors.deepPurple[300]),
                //         // hintText: 'Name and Address of Factory',
                //         border: InputBorder.none),
                //   ),
                // ),
                ,
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'I/we certify that on ',
                      style: TextStyle(fontSize: 17),
                    ),
                    IconButton(
                        onPressed: () async {
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
                                DateFormat('yyyy/MM/dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              bottomDate.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
                        icon: Icon(
                          Icons.calendar_month,
                          color: Colors.deepPurple[500],
                        )),
                    Container(
                      height: 50,
                      width: 90,
                      // color: Colors.amber,
                      child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter text';
                            }
                            return null;
                          },
                          controller: bottomDate,
                          decoration: InputDecoration(
                              enabled: false,
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 15),
                              hintStyle: TextStyle(
                                  fontSize: 17, color: Colors.deepPurple[300]),
                              hintText: DateTime.now().toString(),
                              border: InputBorder.none)),
                    )
                  ],
                ),
                const Text(
                  'I/we throughly examine the boist, lifting machine, ropes, lifting trackes and details examination test carried out ',
                  style: TextStyle(fontSize: 17),
                ),
                Row(
                  children: [
                    const Text('Signature one*:',
                        style: TextStyle(fontSize: 22)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: dropdownValueone,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple[500]),
                      underline: Container(
                          // height: 2,
                          // color: Colors.deepPurpleAccent,
                          ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValueone = value!;
                          print(mydropdownlist.indexOf(value));
                          signarturnumber = mydropdownlist.indexOf(value);
                          print(signarturnumber);

                          print(value);
                        });
                      },
                      items: mydropdownlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: mytextstyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Image.asset(
                  signatures[signarturnumber].toString(),
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Divider(),
                Row(
                  children: [
                    const Text('Signature two :',
                        style: TextStyle(fontSize: 22)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: dropdownValuetwo,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple[500]),
                      underline: Container(
                          // height: 2,
                          // color: Colors.deepPurpleAccent,
                          ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValuetwo = value!;
                          print(mydropdownlist.indexOf(value));
                          signarturnumbertwo = mydropdownlist.indexOf(value);
                          print(signarturnumber);

                          print(value);
                        });
                      },
                      items: mydropdownlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: mytextstyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Image.asset(
                  signatures[signarturnumbertwo].toString(),
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Divider(),
                Row(
                  children: [
                    const Text('Signature three :',
                        style: TextStyle(fontSize: 22)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: dropdownValuethree,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple[500]),
                      underline: Container(
                          // height: 2,
                          // color: Colors.deepPurpleAccent,
                          ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValuethree = value!;
                          print(mydropdownlist.indexOf(value));
                          signarturnumberthree = mydropdownlist.indexOf(value);
                          print(signarturnumber);

                          print(value);
                        });
                      },
                      items: mydropdownlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: mytextstyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Image.asset(
                  signatures[signarturnumberthree].toString(),
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Divider(),
                Row(
                  children: [
                    const Text('Signature four  :',
                        style: TextStyle(fontSize: 22)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: dropdownValuefour,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple[500]),
                      underline: Container(
                          // height: 2,
                          // color: Colors.deepPurpleAccent,
                          ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValuefour = value!;
                          print(mydropdownlist.indexOf(value));
                          signarturnumberfour = mydropdownlist.indexOf(value);
                          print(signarturnumber);

                          print(value);
                        });
                      },
                      items: mydropdownlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: mytextstyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Image.asset(
                  signfour[signarturnumberfour].toString(),
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Divider(),
                Row(
                  children: [
                    const Text('Signature five:',
                        style: TextStyle(fontSize: 22)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: dropdownValuefive,
                      icon: const Icon(Icons.arrow_drop_down_outlined),
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple[500]),
                      underline: Container(),
                      onChanged: (String? value) {
                        setState(() {
                          mydata();
                          dropdownValuefive = value!;

                          signarturnumberfive = mydropdownlist.indexOf(value);
                        });
                      },
                      items: mydropdownlist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: mytextstyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Image.asset(
                  signfive[signarturnumberfive].toString(),
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Divider(),
                SizedBox(
                    height: 50,
                    child: Column(
                      children: [
                        Center(
                            child: responseyorno == 'y'
                                ? CircularProgressIndicator()
                                : null)
                      ],
                    )),

                ElevatedButton(
                    onPressed: () async {
                      // signarturnumber = 0
                      print(dateInput.text.toString() + 'mydate value');

                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          responseyorno = 'y';
                        });

                        await postData(
                          one.text,
                          two.text,
                          three.text,
                          dateInput.text,
                          four.text,
                          five_A.text,
                          radioValueone,
                          radiovaluetwo,
                          radiovaluethree,
                          radioValuefrou,
                          radioValuefive,
                          radioValuesix,
                          radioValueseven,
                          radioValueeight,
                          radioValuenine,
                          radioValueten,
                          radioValueeleven,
                          radioValuetwelwe,
                          five.text,
                          six.text,
                          seven.text,
                          eight.text,
                          bottomDate.text,
                          signarturnumber != 0
                              ? signatures[signarturnumber]
                              : '',
                          signarturnumbertwo != 0
                              ? signatures[signarturnumbertwo]
                              : '',
                          signarturnumberthree != 0
                              ? signatures[signarturnumberthree]
                              : '',
                          signarturnumberfour != 0
                              ? signatures[signarturnumberfour]
                              : '',
                          signarturnumberfive != 0
                              ? signatures[signarturnumberfive]
                              : '',
                        );

                        // sleep(Duration(seconds: 1));
                        clearText();
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Report Generated succesfully'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil<void>(
                                            context,
                                            MaterialPageRoute<void>(
                                                builder:
                                                    (BuildContext context) =>
                                                        const MyPdf()),
                                            (route) => false);
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) {
                                        //   return MyPdf();
                                        // }));
                                        // Navigator.pop(context);
                                      },
                                      child: const Text('ok'))
                                ],
                              );
                            });
                      }
                      // if(_formKey.currentState!.validate()&& signarturnumber==0 ) {
                      //     Fluttertoast.showToast(
                      //     msg: "Please select one sign.", // message
                      //     toastLength: Toast.LENGTH_SHORT, // length
                      //     gravity: ToastGravity.CENTER, // location

                      //     // duration
                      //   );

                      // }

                      else {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //       content: Text('All fields are required.')),
                        // );
                        Fluttertoast.showToast(
                          msg: "All fields are required.", // message
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.CENTER, // location

                          // duration
                        );
                      }
                      print(signarturnumber.toString() + 'my sign vale');
                      print(signatures[signarturnumber] + 'my persone one val');
                      // print(myresponse.response);
                      // mydata();
                      // print();

                      // Dialog(context, false, responsemessage, responseresponse);

                      setState(() {
                        // AlertDialog(
                        //   shape: const RoundedRectangleBorder(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(0.0))),
                        //   title: myresponse != null
                        //       ? Text(responsemessage)
                        //       : null,
                        //   actions: [
                        //     TextButton(
                        //         onPressed: () {
                        //           myresponse != null
                        //               ? myresponse.response == 'y'
                        //                   ? Navigator.push(context,
                        //                       MaterialPageRoute(
                        //                           builder: (context) {
                        //                       return MyPdf();
                        //                     }))
                        //                   : Navigator.pop(context)
                        //               : null;
                        //         },
                        //         child: Text('OK'))
                        //   ],
                        // );
                      });
                      // setState(() {
                      //   showDialog;
                      //   mydata();
                      // });
                      // mydata();
                      // mydata();pri
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return mypostdata != null
                      //           ? AlertDialog(
                      //               title: Text(mypostdata.message),
                      //             )
                      //           : CircularProgressIndicator();
                      //     });
                      // print(myresponse.response);
                      // myresponse;

                      // if (data != null) {
                      //   print(mypostdata);
                      // }

                      // if (mypostdata != null) {
                      //   print(mypostdata + 'my post data');
                      // }
                      // mypostdata != null
                      //     ? Dialog(context, false, mypostdata.message)
                      //     : const Center(
                      //         child: CircularProgressIndicator(),
                      //       );

                      // print(mypostdata.message);

                      // print(radioValueone);
                      // print(dateInput.text);
                      // clearText();
                      mydata();
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: const Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                //  Dialog(context, false, mypostdata.message, mypostdata.response)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column myformtextfield(TextStyle mytextstyle,
      BoxDecoration mybodedxdecoration, String text, textcontroller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: mytextstyle,
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: mybodedxdecoration,
          height: 50,
          padding: const EdgeInsets.only(bottom: 2, left: 20, right: 30),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter text';
              }
              return null;
            },
            controller: textcontroller,
            autofocus: false,
            decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 11),
                hintStyle:
                    TextStyle(fontSize: 17, color: Colors.deepPurple[300]),
                border: InputBorder.none),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
      ],
    );
  }
}

List signone = List.from(signatures);
List signtwo = List.from(signatures);
List signthree = List.from(signatures);
List signfour = List.from(signatures);
List signfive = List.from(signatures);

List signatures = [
  'assets/sign/nullsign.png',
  'assets/sign/sign1.jpg',
  'assets/sign/sign2.png',
  'assets/sign/sign3.jpg',
  'assets/sign/sign4.png',
  'assets/sign/sign5.png'
];
Dialog(BuildContext context, bool succ, String data, respons) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: ((context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0))),
          title: Text(data),
          actions: [
            TextButton(
                onPressed: () {
                  respons == 'y'
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                          return MyPdf();
                        }))
                      : Navigator.pop(context);
                },
                child: Text('OK'))
          ],
        );
      }));
}
