import 'package:flutter/material.dart';

import 'package:form_gen/pages/form_page.dart';
import 'package:form_gen/pages/pdf_page.dart';
import 'package:form_gen/webservices/webservices.dart';

import '../widgets/textediting.dart';
import 'simpleform.dart';

class MyAppbar extends StatefulWidget {
  const MyAppbar({super.key});

  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  void initState() {
    super.initState();
    // postData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      // backgroundColor: Color.fromARGB(218, 231, 224, 243),
      appBar: AppBar(
        title: const Text('Smartest Consultants'),
        centerTitle: true,
        backgroundColor: Colors.purple[400],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MyForm();
                    }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Container(
                        constraints:
                            const BoxConstraints(minHeight: 0, maxHeight: 60),
                        width: MediaQuery.of(context).size.width / 3.2,
                        child: const Text(
                          'Form 11',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MyPdf();
                    }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width / 3,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                      child: Container(
                        constraints:
                            const BoxConstraints(minHeight: 0, maxHeight: 60),
                        width: MediaQuery.of(context).size.width / 3.2,
                        child: const Text(
                          'View Reports',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  const HtmlEditorExample();
                  }));
                },
                child: Container(
                  height: MediaQuery.of(context).size.width / 3,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(7)),
                  child: Center(
                    child: Container(
                      constraints:
                          const BoxConstraints(minHeight: 0, maxHeight: 60),
                      width: MediaQuery.of(context).size.width / 3.2,
                      child: const Text(
                        'Plain form',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
