
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_flutter_app/src/models/response/response.dart';
import 'package:my_flutter_app/src/models/user.dart';

class ApiUtil{

  final String url = "https://reqres.in/api/";

  Future<Response> login(User user) async {

    var response = await http.post(url+"login", body: {"email":user.email, "password":user.password})
        .then((response){

          Map<String,dynamic> result = jsonDecode(response.body);
          print(response.body);
          if(result.containsKey('error'))
            return Response(state : HttpState.ERROR, message: result['error']);
          else if(result.containsKey('token'))
            return Response(state : HttpState.SUCCESSFUL, message: result['token']);
    });

    return response;
  }

}