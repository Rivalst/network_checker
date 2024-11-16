part of 'connection_checker_bloc.dart';

sealed class ConnectionCheckerEvent extends BlocEvent {
  ConnectionCheckerEvent();

  factory ConnectionCheckerEvent.recheckConnection() = RecheckConnection;

  factory ConnectionCheckerEvent.connectionChangedToConnected() = ConnectionChangedToConnected;

  factory ConnectionCheckerEvent.connectionChangedToOffline() = ConnectionChangedToOffline;

  factory ConnectionCheckerEvent.connectionChangedToUnknown() = ConnectionChangedToUnknown;

}

final class RecheckConnection extends ConnectionCheckerEvent {
  RecheckConnection();
}

final class ConnectionChangedToConnected extends ConnectionCheckerEvent {
  ConnectionChangedToConnected();
}

final class ConnectionChangedToOffline extends ConnectionCheckerEvent {
  ConnectionChangedToOffline();
}

final class ConnectionChangedToUnknown extends ConnectionCheckerEvent {
  ConnectionChangedToUnknown();
}
