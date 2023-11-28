part of 'bottom_nav_bloc.dart';

class BottomNavigationBarState extends Equatable {
  final int tabIndex;

  BottomNavigationBarState({required this.tabIndex});

  factory BottomNavigationBarState.initial() => BottomNavigationBarState(tabIndex: 0);

  @override
  List<Object> get props => [tabIndex];

  @override
  bool get stringify => true;

  BottomNavigationBarState copyWith({
    int? tabIndex,
  }) {
    return BottomNavigationBarState(
        tabIndex: tabIndex??this.tabIndex,
    );
  }

}