import 'package:event_bus/event_bus.dart';

EventBus lwEventBus = new EventBus();

class LwHouseEvent{
  String cityid;
  LwHouseEvent(this.cityid);
}