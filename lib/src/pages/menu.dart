import 'dart:async';

import 'package:ani_integration/src/backends/_details.dart';
import 'package:ani_integration/src/backends/_home.dart';
import 'package:ani_integration/src/backends/_menu.dart';
import 'package:ani_integration/src/pages/Details.dart';
import 'package:ani_integration/src/pages/home.dart';
import 'package:ani_integration/src/resources/decor.dart';
import 'package:ani_integration/src/resources/transition.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MainMenu extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context)=>MenuBack(),
      child: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget{

_MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> with TickerProviderStateMixin{

  bool start = true;
  bool _animation = false;
  
  AnimationController ac_transition;
  Animation a_transition;

  @override 
  void initState(){
    super.initState();
    ac_transition= AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    a_transition = Tween(begin: 0.0, end: 1.0).animate(ac_transition)..addListener((){
      setState(() {
      });
    });
  }


  Widget tab1(){
    return txt('tab1');
  }

  Widget bod(){
    ac_transition.forward();
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            decoration: bxdecor(radius: 16, color: Colors.blue[100].withOpacity(a_transition.value)),
            child: Row(children: <Widget>[
              circInCirc(outerSize: 50, outerRad: 30),
              SizedBox(width: 10,),
              Container(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Row( children: <Widget>[
                  txt('Amanda Jacobs', size: 18, color: Colors.purple[900].withOpacity(a_transition.value), fw: FontWeight.bold),
                  SizedBox(width: 10,),
                  Icon(Icons.system_update_alt),
                  ],),
                Row(children: <Widget>[
                  txt('UI/UX designer', size: 16,),
                  SizedBox(width: 20,),
                  circInCirc(outerColor: Colors.black, outerSize: 5, outerRad: 2, innerColor: Colors.grey, ),
                  SizedBox(width: 20,),
                  txt('37 friends', under: TextDecoration.underline)
                  ],),  
              ],),)
            ],),
          ),
          SizedBox(height: 20,),
          Container(
            child: Row(children: <Widget>[
              txt("Hello,  ", size: 26, color: Colors.purple[900].withOpacity(a_transition.value)),
              txt('Amanda!',size: 30, fw: FontWeight.bold, color: Colors.purple[900].withOpacity(a_transition.value)),
            ],),
          ),
          SizedBox(height: 20,),
          Container(child: Column(children: <Widget>[
            Row(children: <Widget>[
              Container(
                height: 120,
                width: 175,
                decoration: bxdecor(color: Color.fromRGBO(255, 86, 104, 1), radius: 15),
                child:FlatButton(child: Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(children: <Widget>[
                    Row(children: <Widget>[Expanded(child: Text(''),), Icon(Icons.business_center, color: Colors.white,size: 30,), SizedBox(width: 0,)],),
                    SizedBox(height: 15,),
                    txt('Professional events', fw: FontWeight.bold, color: Colors.white.withOpacity(a_transition.value),ln: 1),
                  ],),
                ),
                padding: EdgeInsets.all(0),
                onPressed: (){
                  setState(() {
                    _animation = true; 
                    Timer(
                      Duration(milliseconds: 1500),(){
                        _animation=false;
                        Navigator.push(context,
                        //_detailsRoute(i)
                          TransitionAni(builder: (context){
                            return ChangeNotifierProvider(
                            builder: (context)=>HomeBack(),
                            child: HomeData(page: 'Professional Events',),
                          );
                        })
                          
                        );
                      }
                    );
                  });
                },
                )
              ),
              SizedBox(width: 20,),
              Container(
                height: 120,
                width: 176,
                decoration: bxdecor(color: Color.fromRGBO(65, 212, 226, 1), radius: 20),
                child:FlatButton(child:  Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                    Row(children: <Widget>[Expanded(child: Text(''),), Icon(Icons.volume_up, color: Colors.white.withOpacity(a_transition.value),size: 30,), SizedBox(width: 0,)],),
                    SizedBox(height: 42,),
                    txt('Social events', fw: FontWeight.bold, color: Colors.white.withOpacity(a_transition.value),ln: 1),
                  ],),
                ),
                padding: EdgeInsets.all(0),
                onPressed: (){
                  setState(() {
                    _animation = true; 
                    Timer(
                      Duration(milliseconds: 1500),(){
                        _animation=false;
                        Navigator.push(context,
                        //_detailsRoute(i)
                          TransitionAni(builder: (context){
                            return ChangeNotifierProvider(
                            builder: (context)=>HomeBack(),
                            child: HomeData(page: 'Social Events',),
                          );
                        })
                          
                        );
                      }
                    );
                  });
                },
                )
              )
            ],),
            SizedBox(height: 20,),
            Row(children: <Widget>[
              Container(
                height: 120,
                width: 175,
                decoration: bxdecor(color: Color.fromRGBO(77, 84, 225, 1), radius: 15),
                child: FlatButton(child:  Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(children: <Widget>[
                    Row(children: <Widget>[Expanded(child: Text(''),), Icon(Icons.theaters, color: Colors.white.withOpacity(a_transition.value),size: 30,), SizedBox(width: 0,)],),
                    SizedBox(height: 20,),
                    txt('Concert \& Theaters', fw: FontWeight.bold, color: Colors.white.withOpacity(a_transition.value),ln: 1),
                  ],),
                ),
                padding: EdgeInsets.all(0),
                onPressed: (){
                  setState(() {
                    _animation = true; 
                    Timer(
                      Duration(milliseconds: 1500),(){
                        _animation=false;
                        Navigator.push(context,
                        //_detailsRoute(i)
                          TransitionAni(builder: (context){
                            return ChangeNotifierProvider(
                            builder: (context)=>HomeBack(),
                            child: HomeData(page: 'Concerts and Events',),
                          );
                        })
                          
                        );
                      }
                    );
                  });
                },
                )
              ),
              SizedBox(width: 20,),
              Container(
                height: 120,
                width: 176,
                decoration: bxdecor(color: Color.fromRGBO(255, 142, 52, 1), radius: 20),
                child: FlatButton(child:  Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Column(children: <Widget>[
                    Row(children: <Widget>[Expanded(child: Text(''),), Icon(Icons.people_outline, color: Colors.white.withOpacity(a_transition.value),size: 30,), SizedBox(width: 0,)],),
                    SizedBox(height: 15,),
                    txt('Events with friends', fw: FontWeight.bold, color: Colors.white.withOpacity(a_transition.value),ln: 1),
                  ],),
                ),
                
                padding: EdgeInsets.all(0),
                onPressed: (){
                  setState(() {
                    _animation = true; 
                    Timer(
                      Duration(milliseconds: 1500),(){
                        _animation=false;
                        Navigator.push(context,
                        //_detailsRoute(i)
                          TransitionAni(builder: (context){
                            return ChangeNotifierProvider(
                            builder: (context)=>HomeBack(),
                            child: HomeData(page: 'Events With friends',),
                          );
                        })
                          
                        );
                      }
                    );
                  });
                },
                )
              )
            ],),

            SizedBox(height: 20,),
            DefaultTabController(
              length: 4,
              child: Container(
                width: 400,
                child: Column(children: <Widget>[
                    TabBar(
                      isScrollable: true,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.blue),
                        insets: EdgeInsets.fromLTRB(50,0,50,0),
                      ),
                    tabs: <Widget>[
                      txt('Most popular'),
                      txt('friends go'),
                      txt('latest'),
                      txt('large events'),
                    ],
                  ),
                 
                ],),
              ),
            ),
            SizedBox(height: 12,),
            Container(
              child: FlatButton(
              padding: EdgeInsets.all(0),
              child:Container(
              padding: EdgeInsets.only(left: 20, top: 25, bottom: 10),
              width: double.infinity,
              decoration: bxdecor(color: Colors.blueAccent.withOpacity(a_transition.value), radius: 20),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                txt('Scorpions', size: 30,color: Colors.white.withOpacity(a_transition.value), fw: FontWeight.bold),
                Container(
                  width: 200,
                  child: txt('World Tour - ANGELS TOUR',color: Colors.white.withOpacity(a_transition.value), ln: 1 ),
                ),
                SizedBox(height: 80,),
                Row(children: <Widget>[
                  txt('Date  ', color: Colors.white.withOpacity(a_transition.value), size: 14),
                  txt('23.09.19 7PM',color: Colors.white.withOpacity(a_transition.value), fw: FontWeight.bold),
                ],),
                Row(children: <Widget>[
                  txt('Location  ', color: Colors.white.withOpacity(a_transition.value), size: 14),
                  txt('FreeckySpace, CA',color: Colors.white.withOpacity(a_transition.value),fw: FontWeight.bold),
                  Expanded(child: txt(''),),
                  txt('Free',color: Colors.white.withOpacity(a_transition.value)),
                  SizedBox(width: 20,)
                ],),
                SizedBox(height: 10,)
              ],),
            
              ),
              onPressed: (){
                  setState(() {
                    _animation = true; 
                    Timer(
                  Duration(milliseconds: 1500),(){
                    _animation=false;
                    Navigator.push(context,
                    //_detailsRoute(i)
                      TransitionAni(builder: (context){
                        return ChangeNotifierProvider(
                        builder: (context)=>DetailsBack(),
                        child: Details(i: 2,),
                      );
                    })
                      
                    );
                  }
                );
          });
          // sleep(Duration(seconds: 1));

         
      },
    ),
            )
          ],))
        ],),
      ),
    );
  }

  @override 
  Widget build(BuildContext context){
    final _menu = Provider.of<MenuBack>(context);
    return Consumer<MenuBack>(
      builder: (context, menuBack,_)=>Stack(children: <Widget>[
      Scaffold(
        appBar: (start?null: appbar(x: 90)),
        body: (start? Container(
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(255, 255, 255, 1),

          child: Container( 
          margin: EdgeInsets.only(top: 200),
          child: FlareActor(
            'assets/flare/load.flr',
            animation: 'build',
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            callback: (_){
              setState(() {
               start=false;  
              });
            },
          ),)
        ):
          bod()          
        ),
      ),(_animation?Container(
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            child: FlareActor(              
              'assets/flare/wave.flr',
              animation: "build",
              fit: BoxFit.contain,
            ),
          ):txt(''))
        ],
        )
    );
  } 
}
