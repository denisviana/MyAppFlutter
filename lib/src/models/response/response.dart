

/*This class was created for handle http response state and tell view what is happening*/
class Response{

  HttpState state;
  int statusCode; //Http status code
  String message; //Message, if has

  Response({this.state, this.statusCode, this.message});

}

//Enum class for http response states
enum HttpState {
  ERROR, SUCCESSFUL
}