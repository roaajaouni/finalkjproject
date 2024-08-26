part of 'notification_teacher_bloc.dart';

@immutable
sealed class NotificationTeacherEvent {}
class FetchNotificationsTeacherEvent extends  NotificationTeacherEvent {}