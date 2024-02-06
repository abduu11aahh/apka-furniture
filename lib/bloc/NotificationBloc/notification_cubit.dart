import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/NotificationBloc/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState([]));

  void addMessage(RemoteNotification message) {
    List<RemoteNotification> updatedMessages = List.from(state.messages);
    updatedMessages.add(message);
    emit(NotificationState(updatedMessages));
  }
}
