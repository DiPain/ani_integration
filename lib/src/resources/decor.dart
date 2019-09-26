import 'package:flutter/material.dart';

BoxDecoration bxdecor({double radius = 12, Color color= Colors.white, String img}) => BoxDecoration(
  borderRadius: BorderRadius.circular(radius),
  color: color,
  
  // image: Image.asset(img)
);

Widget leading()=>IconButton(
  icon: Icon(Icons.menu, color: Color.fromRGBO(42, 42, 42, 1),),
  onPressed: (){},
);

class DropAction extends StatefulWidget{
_DropActionState createState()=>_DropActionState();
}
class _DropActionState extends State<DropAction>{
  List <DropdownMenuItem<String>> cities = [DropdownMenuItem<String>(
              child: Text('California'),
              value: 'one',
            ),
            DropdownMenuItem<String>(
              child: Text('Dallas'),
              value: 'two',
            ),
            DropdownMenuItem<String>(
              child: Text('Texas'),
              value: 'three',
            ),];

  String _value='one';

  Widget build(BuildContext context){
    return DropdownButton(
      underline: Container(child: txt(''),),
      items:cities,
      value: _value,
      onChanged: (val){
        setState(() {
          _value = val;
        });
      },
    );
  }
}

Widget appbar({double x=0}){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: leading(),
    title:circInCirc(),
    actions: <Widget>[
      DropAction(),
      SizedBox(width: x,),
      IconButton(
        icon: Icon(Icons.search, color: Colors.black,),
        onPressed: (){},
      ),
      SizedBox(width: 15,),
    ],
  );
  
}

Widget circInCirc({double outerSize = 32,double innerSize = 30, double innerRad = 15, double outerRad = 16, Color innerColor = Colors.white, Color outerColor =Colors.white})=> Container(
  height: outerSize,
  width: outerSize,
  decoration: bxdecor(radius: outerRad, color: outerColor),
  child: Center( 
    child: Container(
      height: innerSize,
      width: innerSize,
      decoration: bxdecor(radius: innerRad,color: innerColor),
    ),
  )
);

Text txt(String value,{double size = 16, FontWeight fw = FontWeight.normal, String font='OpenSans', Color color = Colors.black, double ln =0, TextDecoration under = TextDecoration.none }) => Text(
  (value==null?'':value),
  style: TextStyle(
    color: color,
    fontSize: size,
    fontWeight: fw,
    fontFamily: font,
    letterSpacing: ln,
    decoration: under   
  ),
);

