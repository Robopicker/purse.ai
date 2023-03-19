import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purse_ai_app/Bloc/transactions/transaction_event.dart';
import 'package:purse_ai_app/Bloc/transactions/transaction_state.dart';
import 'package:purse_ai_app/Repository/user_repository.dart';

class TransactionBloc extends Bloc<TransactionsEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    final UserRepository apiRepository = UserRepository();
    on<GetTransactionData>((event, emit) async {
      try {
        emit(TransactionLoading());
        final mList = await apiRepository.getUserData();
        emit(TransactionLoaded(mList));
      } on NetworkError {
        emit(const TransactionEror(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
