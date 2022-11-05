import 'package:flutter/material.dart';

class FormFieldEdit extends StatefulWidget {
  const FormFieldEdit({super.key});

  @override
  State<FormFieldEdit> createState() => _FormFieldEditState();
}

class _FormFieldEditState extends State<FormFieldEdit> {
  TextEditingController _mytextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ERROR:C:\Users\abc\Desktop\pdf_generator\form_gen\build\app\intermediates\packaged_manifests\debug\AndroidManifest.xml:23: AAPT: error: unexpected element <uses-permission> found in <manifest><application>.
// 2

