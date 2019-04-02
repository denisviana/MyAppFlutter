

import 'package:flutter/material.dart';
import 'package:my_flutter_app/src/api/api.dart';
import 'package:my_flutter_app/src/helper/assets.dart';
import 'package:my_flutter_app/src/models/response/response.dart';
import 'package:my_flutter_app/src/models/user.dart';
import 'package:my_flutter_app/src/widgets/custom_button.dart';
import 'package:my_flutter_app/src/widgets/margin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ApiUtil api = ApiUtil();

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[

              //Custom widget to set a margin vertically
              MarginVertically(20.0),

              //A widget Center which contains a Text inside
              Center(
                child: Text("Welcome", style:
                  TextStyle(fontSize: 60, color: Theme.of(context).primaryColor
                  )
                ),
              ),

              MarginVertically(10.0),

              Center(
                //The image is retrieved using a helper created for me, passing they name with extension
                //See more about handle images here:
                // https://flutter.dev/docs/development/ui/assets-and-images;
                // https://docs.flutter.io/flutter/painting/BoxFit-class.html;
                // https://docs.flutter.io/flutter/widgets/Image-class.html
                child: Image.asset(AssetsHelper.pathOf('game_controller.png'),
                  width: 100.0,
                ),
              ),

              MarginVertically(20.0),

              TextFormField(
                keyboardType: TextInputType.emailAddress, //Input type, in this case is e-mail
                textInputAction: TextInputAction.next, //Action when press enter in keyboard
                onSaved: (String value){
                  this._email = value;
                },
                style: TextStyle(color: Colors.black), //Input text style
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Please enter your e-mail",
                ),
              ),

              MarginVertically(10.0),

              TextFormField(
                obscureText: true, //To hide password
                textInputAction: TextInputAction.done, //Action when press enter in keyboard
                style: TextStyle(color: Colors.black), //Input text style
                onSaved: (String value){
                  this._password = value;
                },
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Please enter your password",
                ),
              ),

              MarginVertically(10.0),

              Text("Forgot password", style: TextStyle(color: Colors.black45),textAlign: TextAlign.right,),


              MarginVertically(30.0),

              CustomButton(
                title: "LOGIN",
                onPressed: (){
                  this._submit();
                },
              )

            ],
          ),
        ),
      ),
    );
  }

  void _submit() async{

    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
    }

    Response response = await api.login(User(email: this._email, password: this._password));

    if(response!=null){
      switch(response.state){
        case HttpState.SUCCESSFUL:
          _showSnackbar("Login successful");
          break;
        case HttpState.ERROR :
          _showSnackbar(response.message);
          break;
      }
    }


  }

  void _showSnackbar(String text){
    final snackBar = SnackBar(content: Text(text));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}
