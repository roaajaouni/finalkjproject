part of 'notification_teacher_bloc.dart';

@immutable
sealed class NotificationTeacherState {}

final class NotificationTeacherInitial extends NotificationTeacherState {}
class NotificationLoadingState extends NotificationTeacherState {}

class NotificationIsLoaded extends NotificationTeacherState{
  final List<NotificationsModel> notifications;

  NotificationIsLoaded(this.notifications);
}

class NotificationError extends NotificationTeacherState  {
  final String errorMessage;

  NotificationError(this.errorMessage);
}