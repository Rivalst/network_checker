part of 'connection_checker_bloc.dart';

sealed class ConnectionCheckerState extends BlocState {
  ConnectionCheckerState();

  bool get isConnected => this is _Connected;

  bool get isOffline => this is _Offline;

  bool get isUnknown => this is _Unknown;

  factory ConnectionCheckerState.connected() = _Connected;

  factory ConnectionCheckerState.offline() = _Offline;

  factory ConnectionCheckerState.unknown() = _Unknown;

  @override
  List<Object?> get props => [];
}

final class _Connected extends ConnectionCheckerState {
  _Connected();
}

final class _Offline extends ConnectionCheckerState {
  _Offline();
}

final class _Unknown extends ConnectionCheckerState {
  _Unknown();
}
