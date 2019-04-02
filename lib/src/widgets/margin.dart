
import 'package:flutter/material.dart';

class MarginVertically extends StatelessWidget {

  double _margin = 0.0;

  MarginVertically(double margin){
    this._margin = margin;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _margin
    );
  }
}

class MarginHorizontally extends StatelessWidget {

  double _margin = 0.0;

  MarginHorizontally(double margin){
    this._margin = margin;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: _margin
    );
  }
}