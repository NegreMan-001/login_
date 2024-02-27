import 'package:flutter/material.dart';


int main(){
 	runApp(MyMain());
}


// the main class
class MyMain extends StatelessWidget{

	 	
 	Widget build(BuildContext cont){
 	    return MaterialApp(
 	        titile: "login",
 	        home: TheLoginScreen(),
 	    );
 	}
 

}

// to manage the state
class TheLogin extends StatefulWidget{

	const TheLogin({Key? key}) : super(key: key);
 
 	TheLoginScreen createState() => TheLoginScreen();
}



class TheLoginScreen extends State<TheLogin>{
String email;
String password;


final _keyToControlMyForm = GlobalKey<FormState>();

bool _isChecked = false;


void onSubmit(){
   print();
}




// first state---------------------------- 
void initState(){
super.initState();
}


//------------------------------
@override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Login',
              hintText: 'Your login',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter your login';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Mot de passe',
              hintText: 'Your password',
            ),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Your password please';
              }
              return null;
            },
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value;
                  });
                },
              ),
              Text('Remembering... '),
            ],
          ),
          ElevatedButtom(
            onPressed: () {
              if (_formKey.currentState.validate()) {
              
              }
            },
            child: Text('Se connecter'),
          ),
        ],
      ),
    );
  }



}









