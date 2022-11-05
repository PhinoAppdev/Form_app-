
import 'package:flutter/material.dart';

class HtmlEditorExample extends StatefulWidget {
  const HtmlEditorExample({Key? key, required }) : super(key: key);



  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  TextEditingController _mytextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hlsdf'),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_sharp)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter The text'),
            SizedBox(
              // height: 50,
              width: MediaQuery.of(context).size.width / 1.2,
              child: TextFormField(
                maxLines: 20,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                controller: _mytextController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    // ignore: prefer_const_constructors

                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
