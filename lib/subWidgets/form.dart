import 'package:flutter/material.dart';
import 'package:flutter_widgets/subWidgets/test.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Widgett')),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hint: Text('Enter your name'),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name cannot be empty';
                      }
                      if (value.length < 3) {
                        return 'Name Must Be more then 3 letters long';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                // onPressed: () {
                //   if (_formkey.currentState!.validate()) {
                //     _Mydialogue(context);
                //   }
                // },
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    // _Mydialogue(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Testpage()),
                    );
                  }
                },

                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void _Mydialogue(BuildContext context) {
//   Navigator.push(context, MaterialPageRoute(builder: (context) => Testpage()));
// }
