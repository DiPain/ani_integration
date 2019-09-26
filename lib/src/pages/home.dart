
import 'dart:async';
import 'dart:io';

import 'package:ani_integration/src/backends/_details.dart';
import 'package:ani_integration/src/backends/_home.dart';
import 'package:ani_integration/src/models/event_data.dart';
import 'package:ani_integration/src/pages/Details.dart';
import 'package:ani_integration/src/resources/decor.dart';
import 'package:ani_integration/src/resources/transition.dart';
import 'package:ani_integration/src/resources/wave.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context)=>HomeBack(),
      child: HomeData(),
    );
  }
}



class HomeData extends StatefulWidget{
  String page;
  HomeData({this.page='Professional Events'});
  @override 
  _HomeDataState createState() => _HomeDataState(page: page);
}
class _HomeDataState extends State<HomeData> with TickerProviderStateMixin{
  String page;
  bool _animation = false;
  int ind;
  _HomeDataState({this.page='Professional Events',this.ind=0});


  Widget cardTemplate(int index,BuildContext context,{String title="Title",String des = 'Description', String dat = 'date', String location='',String price='FREE', String img = '', Color color = Colors.blueAccent}){
    return FlatButton(
      padding: EdgeInsets.all(0),
        child:Container(
      padding: EdgeInsets.only(left: 20, top: 25, bottom: 10),
      width: double.infinity,
      decoration: bxdecor(color: color, radius: 20),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        txt(title, size: 30,color: Colors.white, fw: FontWeight.bold),
        Container(
          width: 200,
          child: txt(des,color: Colors.white, ln: 1 ),
        ),
        SizedBox(height: 80,),
        Row(children: <Widget>[
          txt('Date  ', color: Colors.white, size: 14),
          txt(dat,color: Colors.white, fw: FontWeight.bold),
        ],),
        Row(children: <Widget>[
          txt('Location  ', color: Colors.white, size: 14),
          txt(location,color: Colors.white,fw: FontWeight.bold),
          Expanded(child: txt(''),),
          txt(price,color: Colors.white),
          SizedBox(width: 20,)
        ],),
        SizedBox(height: 10,)
      ],),
     
      ),
       onPressed: (){
          setState(() {
            ind = index;
            _animation = true; 
            Timer(
          Duration(milliseconds: 1500),(){
            _animation=false;
             Navigator.push(context,
            //_detailsRoute(i)
              TransitionAni(builder: (context){
                return ChangeNotifierProvider(
                builder: (context)=>DetailsBack(),
                child: Details(i: ind,),
              );
            })
              
            );
          }
        );
          });
          // sleep(Duration(seconds: 1));

         
      },
    );
  }

  List<Widget> cardList( BuildContext context, List <EventData>items){
    List<Widget> lis = [];
    for(int i =0; i < items.length; i++)  {
      EventData item  =items[i];
      lis.add(cardTemplate(i,context, title: item.title, des: item.des, dat: item.date, location: item.loca,price: item.price, color: item.color));
      lis.add(SizedBox(height: 20));
    }
    return lis;
  }

  @override
  Widget build(BuildContext context){
    final bac = Provider.of<HomeBack>(context);
    return Consumer<HomeBack>(
          builder: (context,homeBack,_)=> Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
            children: <Widget>[            
             Scaffold(
            appBar: appbar(),
            body: Container(
              color: Colors.white,
              padding: EdgeInsets.only(top: 10, left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 56,
                        child: FlatButton(
                        padding: EdgeInsets.only(left:0),
                        child:Row(
                          children: <Widget>[
                          Icon(Icons.arrow_back_ios, size: 16,),
                          txt('Back', size: 16),
                        ],),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  SizedBox(width: 40,),
                  txt(page, size: 18,),
                  ],),
                  Expanded(
                    child: Container(
                    decoration: bxdecor(radius: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: cardList(context, bac.lis),),
                    )
                  ))
                  
                ],
              ),
            ),
          ),
          (_animation?Container(
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width,
            child: FlareActor(              
              'assets/flare/wave.flr',
              animation: "build",
              fit: BoxFit.contain,
            ),
          ):txt('')),
        ]),)
      );
  }

}