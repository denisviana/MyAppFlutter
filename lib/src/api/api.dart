
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_flutter_app/src/models/response/response.dart';
import 'package:my_flutter_app/src/models/user.dart';

class ApiUtil{


  Future<Response> login(User user) async {

    var uname = user.email;
    var psswd = user.password;

    String url = "http://etqm.host/auth.cfm?uname=$uname&psswd=$psswd";

    /*Does an asynchronous http POST passing as parameter in body the email and password of user,
    the complete url is https://reqres.in/api/login*/
    var response = await http.get(url)
        .then((response){

          //Convert response string in a Map (the response is like 'key':'value')
          Map<String,dynamic> result = jsonDecode(response.body);

          print(response.body); //Just print the result

          //If key is 'error' so the request has been failed
          //If key is 'token' so the request has been successful
          if(result.containsKey('returnmessage') && result['returnmessage'] == "invalid")
            //I have created a custom entity for handle response state
            return Response(state : HttpState.ERROR, message: result['returnmessage']);
          else if(result.containsKey('returnmessage') && result['returnmessage'] == "ok")
            return Response(state : HttpState.SUCCESSFUL, message: result['Success']);
    });

    return response;
  }

}