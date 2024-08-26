import 'package:bloc/bloc.dart';
import 'package:flutter_childhood/model/notifications_model.dart';
import 'package:flutter_childhood/service/teacher_service/notification_teacher_service.dart';
import 'package:meta/meta.dart';

part 'notification_teacher_event.dart';
part 'notification_teacher_state.dart';

class NotificationTeacherBloc extends Bloc<NotificationTeacherEvent, NotificationTeacherState> {
  NotificationTeacherService notificationTeacherService=NotificationTeacherService();
  NotificationTeacherBloc(NotificationTeacherService notificationTeacherService) : super(NotificationTeacherInitial()) {
    on<NotificationTeacherEvent>((event, emit)async {
      emit(NotificationLoadingState());

      try {
        var notifications = await notificationTeacherService.fetchTeacherNotifications();
        // List<NotificationsModel> notificationsModel = List.generate( notificationsMap.length, (index) =>NotificationsModel.fromMap(notificationsMap[index]) );

        emit(NotificationIsLoaded(notifications));
      } catch (e) {
        emit(NotificationError(e.toString()));
      }
    });
  }
}
