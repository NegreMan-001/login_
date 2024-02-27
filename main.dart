import 'package:flutter/material.dart';

void main() {
  runApp(MyMain());
}

class MyMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: TheLoginScreen(),
    );
  }
}

class TheLoginScreen extends StatefulWidget {
  const TheLoginScreen({Key? key}) : super(key: key);

  @override
  _TheLoginScreenState createState() => _TheLoginScreenState();
}

class _TheLoginScreenState extends State<TheLoginScreen> {
  String? email;
  String? password;

  final _formKey = GlobalKey<FormState>();

  bool _isChecked = false;

  void onSubmit() {
    print('Form submitted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Login',
                  hintText: 'Your login',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your login';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Your password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Your password please';
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                  Text('Remember me'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    onSubmit();
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
