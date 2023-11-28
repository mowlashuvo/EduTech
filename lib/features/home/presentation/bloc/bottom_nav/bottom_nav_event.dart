part of 'bottom_nav_bloc.dart';
abstract class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent();

  @override
  List<Object> get props => [];
}

class ChangeBottomNavigationBarEvent extends BottomNavigationBarEvent {
  final int index;
  const ChangeBottomNavigationBarEvent({required this.index});
  @override
  // TODO: implement props
  List<Object> get props => [index];
}
