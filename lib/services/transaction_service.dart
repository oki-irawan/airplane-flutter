import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionReference.add({
        'destination': transaction.destination.toJson(),
        'totalTraveler': transaction.totalTraveler,
        'selectedSeat': transaction.selectedSeat,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTrasactions() async {
    try {
      QuerySnapshot result = await _transactionReference.get();

      List<TransactionModel> trasactions = result.docs
          .map(
            (e) => TransactionModel.fromJson(
              e.id,
              e.data() as Map<String, dynamic>,
            ),
          )
          .toList();

      return trasactions;
    } catch (e) {
      throw e;
    }
  }
}
