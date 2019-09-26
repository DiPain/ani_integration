import 'package:ani_integration/src/backends/_home.dart';
import 'package:ani_integration/src/models/event_data.dart';
import 'package:flutter/foundation.dart';

class DetailsBack with ChangeNotifier{
  EventData current = HomeBack().lis[0];

  set currentEvent(int i){
    EventData current = HomeBack().lis[i];
    notifyListeners();
  }
}