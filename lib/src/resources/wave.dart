import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Wave extends StatefulWidget{
  int i;
  Wave({this.i=0});
_WaveState createState()=> _WaveState(i: i);
}
class _WaveState extends State<Wave>{
  int i;
  _WaveState({this.i=0});
  String _animation='Build';
  @override 
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(1, 1, 1, 0),
      child: Stack(children: <Widget>[
        FlareActor(
          'assets/flare/wave.flr',
          fit: BoxFit.contain,
          animation: _animation,
        ),
      ],),
    );

  }
}
