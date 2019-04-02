
/*
* This class help you to retrieve a image just passing your name
* like image.jpg provided it is within the directory defined in _path
* */

class AssetsHelper{

  static final String _path = "images/";

  static String pathOf(String imageName) => _path+imageName;

}