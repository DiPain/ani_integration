import 'package:ani_integration/src/models/event_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



class HomeBack with ChangeNotifier{

  int dropSelected = 0;
  set dropIndex(int a){
    dropSelected = a;
    notifyListeners();
  }

  List <EventData> lis = [
    EventData('Design Highway','Seminar for designers and design tools','23.09.19 7PM','FreeckySpace, CA','\$ 15', Color.fromRGBO(255, 142, 52, 1),'MON, 23 Sep 2019' ),
    EventData('.Market Meetup','Meetup for Marketing specialists','23.09.19 7PM','FreeckySpace, CA','Free',Color.fromRGBO(255, 86, 104, 1),'FRI, 20 Sep 2019'),
    EventData('Scorpions','World Tour - ANGELS TOUR','23.09.19 7PM','FreeckySpace, CA','FREE', Colors.blueAccent,'FRI, 20 Sep 2019'),
    EventData('Design Talk \#3','Seminar for designers and design tools','23.09.19 7PM','FreeckySpace Art Center, CA','\$ 15', Colors.orange[300],'FRI, 20 Sep 2019'),
  ];

 set addToList(EventData newEvent){
   lis.add(newEvent);
   notifyListeners();
 }
}