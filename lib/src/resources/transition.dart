import 'package:flutter/material.dart';

class TransitionAni extends MaterialPageRoute{
  TransitionAni({WidgetBuilder builder, RouteSettings settings }):super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondAnimation, Widget child){
    Animation<double> ani = Tween<double>(begin: 0.0, end: 1.0,).animate(animation);
    return FadeTransition(child: child,opacity: ani,);
    // return super.buildTransitions(context, animation, secondaryAnimation, child);
  }
}

class TransitionReverse extends MaterialPageRoute{
  TransitionReverse({WidgetBuilder builder, RouteSettings settings }):super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondAnimation, Widget child){
    Animation<Offset> ani = Tween<Offset>(begin: Offset(-1.0,0.0), end: Offset(0.0, 0.0)).animate(animation);
    return SlideTransition(position: ani,child: child,);
    // return super.buildTransitions(context, animation, secondaryAnimation, child);
  }
}