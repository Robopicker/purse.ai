part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  final int count;
  const CounterState(this.count);

  @override
  List<Object> get props => [];
}
