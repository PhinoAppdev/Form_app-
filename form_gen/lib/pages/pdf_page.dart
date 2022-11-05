import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:form_gen/pages/pdfapi.dart';
import 'package:form_gen/pages/tab_bar.dart';
import 'package:native_pdf_view/native_pdf_view.dart';


import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../models/models.dart';
import '../webservices/webservices.dart';

class MyPdf extends StatefulWidget {
  const MyPdf({super.key});

  @override
  State<MyPdf> createState() => _MyPdfState();
}

class _MyPdfState extends State<MyPdf> {
  String assetpath = '';

  PdfViewerController mypdfcontroller = PdfViewerController();
  bool isloading = true;
  var getpdff;
  homepage() async {
    var res = await getpdf();
    setState(() {
      getpdff =  Categorymodels.fromJson(res);
      isloading = false;
      // print('HomePage Data: ' + getpdff);
    });
    return getpdff;
  }

  @override
  @override
  void initState() {
    // mypdfcontroller = PdfViewerController();
    // TODO: implement initState
    getpdf();
    homepage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getpdf();
    return Scaffold(
        backgroundColor: Colors.deepPurple[50],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[50],
          elevation: 0,
          title: Text(
            'View Pdf',
            style: TextStyle(color: Colors.purple[300]),
          ),
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const MyAppbar()),
                  (route) => false);
            }),
            icon: const Icon(Icons.arrow_back),
            color: Colors.purple[300],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [

                // FutureBuilder(
                  
                //   future: getpdf(),
                //   builder:  (context, snapshot) {
                //   return InkWell(
                //     onTap:(){},child:
                //      Container(
                //        margin: EdgeInsets.only(top: 10),
                //        height: 60,
                //        width:
                //            MediaQuery.of(context).size.width * 0.3,
                //        decoration: BoxDecoration(
                //            color: Colors.white,
                //            borderRadius: BorderRadius.circular(12)),
                //        child: Row(
                //          children: [
                //            IconButton(
                //              onPressed: () async {
                //                Navigator.push(context,
                //                    MaterialPageRoute(
                //                        builder: (context) {
                //                  return Mypdfview(
                //                    url: getpdff
                //                        .resultArray[index].reportPath
                //                        .toString(),
                //                    name: getpdff
                //                        .resultArray[index].reportName
                //                        .toString(),
                //                  );
                //                }));
                //                // getpdf();
                //                final url = getpdff
                //                    .resultArray[index].reportPath
                //                    .toString();

                //                print(getpdff
                //                    .resultArray[0].reportPath);
                //                // print(getpdff.resultArray[0].);

                //                // homepage();
                //              },
                //              icon: Icon(Icons.picture_as_pdf,
                //                  color: Colors.purpleAccent[300]),
                //            ),
                //            Text(getpdff.resultArray[index].reportName
                //                .toString()),
                //          ],
                //        ),
                //      )
                //   );
                // })

                  ListView.builder(
                      // physics: AlwaysScrollableScrollPhysics(),
                      physics: NeverScrollableScrollPhysics(),
                      // physics
                      shrinkWrap: true,
                      itemCount:
                          getpdff != null ? getpdff.resultArray.length : 1,
                      itemBuilder: (context, index) {
                        return  getpdff != null
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Mypdfview(
                                      url: getpdff.resultArray[index].reportPath
                                          .toString(),
                                      name: getpdff
                                          .resultArray[index].reportName
                                          .toString(),
                                    );
                                  }));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Mypdfview(
                                              url: getpdff
                                                  .resultArray[index].reportPath
                                                  .toString(),
                                              name: getpdff
                                                  .resultArray[index].reportName
                                                  .toString(),
                                            );
                                          }));
                                          // getpdf();
                                          final url = getpdff
                                              .resultArray[index].reportPath
                                              .toString();

                                          print(getpdff
                                              .resultArray[0].reportPath);
                                          // print(getpdff.resultArray[0].);

                                          // homepage();
                                        },
                                        icon: Icon(Icons.picture_as_pdf,
                                            color: Colors.purpleAccent[300]),
                                      ),
                                      Text(getpdff.resultArray[index].reportName
                                          .toString()),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                height: MediaQuery.of(context).size.height - 100,
                                child: const Center (child:
                                   CircularProgressIndicator()
                  ));
                      }),
                  // SizedBox(
                  //   height: 1000,
                  // )
                ],
              ),
            ),
          ),
        ));
  }
}
