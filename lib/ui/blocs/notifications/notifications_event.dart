part of 'notifications_bloc.dart';

sealed class NotificationsEvent {}

class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;
  NotificationStatusChanged(this.status);
}