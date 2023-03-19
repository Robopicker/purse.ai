import 'package:equatable/equatable.dart';

class TransactionState extends Equatable {
  const TransactionState();
  @override
  List<Object?> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<dynamic> list;
  const TransactionLoaded(this.list);
  @override
  List<Object> get props => [list];
}

class TransactionEror extends TransactionState {
  final String message;
  const TransactionEror(this.message);
  @override
  List<Object> get props => [message];
}
