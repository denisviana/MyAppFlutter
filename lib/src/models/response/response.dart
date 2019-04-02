
class Response{

  HttpState state;
  int statusCode;
  String message;

  Response({this.state, this.statusCode, this.message});

}

enum HttpState {
  ERROR, SUCCESSFUL
}