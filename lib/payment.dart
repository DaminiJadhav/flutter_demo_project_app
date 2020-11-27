import 'package:flutter/material.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';

class SquarePaymentExample extends StatefulWidget {
  @override
  _SquarePaymentExampleState createState() => _SquarePaymentExampleState();
}

class _SquarePaymentExampleState extends State<SquarePaymentExample> {

  void _pay(){
      InAppPayments.setSquareApplicationId("sandbox-sq0idb-9faP3OqiTVI-qNbUYce14Q");
      InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _cardNonceRequestSuccess,
        onCardEntryCancel: _cardEntryCancel,
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pay,
        child: Icon(Icons.payment),
      ),
    );
  }

  void _cardEntryCancel() {
  }

  void _cardNonceRequestSuccess(CardDetails result) {
    print(result.nonce);
    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete
    );
  }

  void _cardEntryComplete() {
  }
}
