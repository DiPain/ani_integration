import 'package:ani_integration/main.dart';
import 'package:ani_integration/src/backends/_details.dart';
import 'package:ani_integration/src/backends/_home.dart';
import 'package:ani_integration/src/models/event_data.dart';
import 'package:ani_integration/src/pages/home.dart';
import 'package:ani_integration/src/pages/menu.dart';
import 'package:ani_integration/src/resources/decor.dart';
import 'package:ani_integration/src/resources/transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget{
  EventData item;
  Details({i=0}){
    item = HomeBack().lis[i];  
  }
  _DetailsState createState() => _DetailsState(item);
}

class _DetailsState extends State<Details>{
    EventData item;
  _DetailsState(this.item);

  Widget about(){
    return Container(
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Icon(Icons.access_time,color: item.color,),
            txt(item.time)
          ],)
        ],
      ),
    );
  }
  
  Widget tab(int ind,int ths,  String t){
    return Container(
      child: Row(children: <Widget>[
        (ind==ths? Container(height: 10,width: 10,decoration: bxdecor(radius: 5,color: item.color),):Container(child:txt(''))),
        txt(t),
      ],)
    );
  }

  Widget tbar(){
    return DefaultTabController(
      length: 5,
      child: Container(
        child: TabBar(
          isScrollable: true,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.blue,width: 2),
            insets: EdgeInsets.fromLTRB(40,0,40,0),
          ),
          tabs: <Widget>[
            txt('About'),
            txt('Details'),
            txt('Map Location'),
            txt('Visitors'),
            txt('Last Event'),
          ],
        ),
      ),
    );
  }

  @override 
  Widget build(BuildContext context){
    final details = Provider.of<DetailsBack>(context);
    return Consumer<DetailsBack>(
      builder: (context, details,_)=>Scaffold(
        body: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight:360,
                leading: Container(
                  child: FlatButton(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Icon(Icons.arrow_back_ios, color: Colors.white,size: 30,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                backgroundColor: item.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                  )
                ),
                flexibleSpace: SingleChildScrollView(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  SizedBox(height: 250,),
                  Container(
                    padding: EdgeInsets.only(left: 30, bottom: 0),
                    child: txt(item.title, size: 40, color: Colors.white, fw: FontWeight.w400),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, bottom: 0, top: 5),
                    child: txt(item.des, color: Colors.white, ),
                  ),
                ],),)
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 20,),
                  tbar(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      
                      SizedBox(height: 20,),
                      Container(child: Row(children: <Widget>[
                        Icon(Icons.access_time, color: item.color,),
                        SizedBox(width: 20),
                        txt(item.time, color:item.color,size:18,fw: FontWeight.bold),
                      ],),),
                      SizedBox(height: 7,),
                      txt('           6:00 AM - 8:30 AM'),
                      SizedBox(height: 20,),
                      Row(children: <Widget>[
                        Icon(Icons.location_on,color: item.color,),
                        SizedBox(width: 20,),
                        txt(item.loca, color: item.color, size: 18,fw: FontWeight.bold)
                      ],),
                      txt('           Fancy Avenue'),
                      txt('           California, US C912YUA'),
                      SizedBox(height: 20,),
                      Row(children: <Widget>[
                      txt('4 friend', under: TextDecoration.underline),
                      txt(' go on this event'),
                      SizedBox(width: 40,),
                      Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                        circInCirc(innerColor: Colors.grey, outerSize: 46, outerRad: 23, innerRad: 20, innerSize: 40),
                        Positioned(
                          left: 20,
                          child: circInCirc(innerColor: Colors.grey, outerSize: 46, outerRad: 23, innerRad: 20, innerSize: 40),
                        ),
                        Positioned(
                          left: 40,
                          child: circInCirc(innerColor: Colors.grey, outerSize: 46, outerRad: 23, innerRad: 20, innerSize: 40),
                        ),
                        Positioned(
                          left: 60,
                          child: circInCirc(innerColor: Colors.grey, outerSize: 46, outerRad: 23, innerRad: 20, innerSize: 40),
                        )
                      ],)
                      ],),
                      SizedBox(height: 20,),
                      txt('Lorem ipsum ut enim ad minim veniam quis nostrud excretation ulcum laboris'),
                      SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.only(left: 0, right: 30),
                        height: 3,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                      SizedBox(height: 10,),
                      Row(children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          txt(item.price, fw: FontWeight.bold, size: 22),
                          txt('with registration', color: Colors.grey[500])
                        ],),
                      SizedBox(width: 20,),
                        Container(
                          height: 70,
                          width: 200,
                          decoration: bxdecor(radius: 35, color: item.color),
                          child: FlatButton(
                            
                            child: txt('REGISTER', size: 22, color: Colors.white),
                            onPressed: (){
                              Navigator.push(context, 
                              TransitionAni(builder: (context){
                                    return ChangeNotifierProvider(
                                    builder: (context)=>HomeBack(),
                                    child: MainMenu(),
                                  );
                                })
                              );
                            },
                          ),
                        )
                      ],)
                    ],),
                  ),
                ]),
              )
            ],
          ),
        )
      ),
    );  
  }
}