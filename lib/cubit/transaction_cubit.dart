import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/services/transaction_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  final TransactionService transactionService = TransactionService();

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await transactionService.createTransaction(transaction);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransactions() async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await transactionService.fetchTrasactions();
      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
