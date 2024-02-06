import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationState {
  final List<RemoteNotification> messages;
  NotificationState(this.messages);
}
