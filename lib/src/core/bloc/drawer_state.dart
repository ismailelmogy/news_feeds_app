part of 'drawer_bloc.dart';

sealed class DrawerState extends Equatable {
  const DrawerState();

  @override
  List<Object> get props => [];
}

final class DrawerInitial extends DrawerState {}

final class DrawerIndexChanged extends DrawerState {}
