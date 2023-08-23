part of 'drawer_bloc.dart';

sealed class DrawerEvent extends Equatable {
  const DrawerEvent();

  @override
  List<Object> get props => [];
}

class ChangeDrawerIndexEvent extends DrawerEvent {
  final int index;

  const ChangeDrawerIndexEvent({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}
