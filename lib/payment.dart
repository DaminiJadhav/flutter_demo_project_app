import 'dart:io';

import 'package:flutter/material.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';

class SquarePaymentExample extends StatefulWidget {
  @override
  _SquarePaymentExampleState createState() => _SquarePaymentExampleState();
}

class _SquarePaymentExampleState extends State<SquarePaymentExample> {

  bool _googlePayEnambled=false;

  void _pay(){
      InAppPayments.setSquareApplicationId("sandbox-sq0idb-9faP3OqiTVI-qNbUYce14Q");
      InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _cardNonceRequestSuccess,
        onCardEntryCancel: _cardEntryCancel,
      );
  }

  Future<void> _initsquareGooglePay() async{
    var canUseGooglePay = false;
    if(Platform.isAndroid) {
      await InAppPayments.initializeGooglePay('LOCATION_ID',1);
      canUseGooglePay=await InAppPayments.canUseGooglePay;
    }
    setState(() {
      _googlePayEnambled=canUseGooglePay;
    });
  }

  void _onStartGooglePay() async {
    try {
      InAppPayments.setSquareApplicationId("sandbox-sq0idb-9faP3OqiTVI-qNbUYce14Q");
      await InAppPayments.requestGooglePayNonce(
            price: '1.0',
            currencyCode: 'USD',
            onGooglePayNonceRequestSuccess:_onGooglePayNonceRequestSuccess ,
            onGooglePayNonceRequestFailure:_onGooglePayNonceRequestFailure ,
            priceStatus: 1);
    } on InAppPaymentsException catch(ex){
          print("Exception ${ex.toString()}");
    }
  }

  void _onGooglePayNonceRequestSuccess(CardDetails result) async {
    try {
      // take payment with the card nonce details
      // you can take a charge
      // await chargeCard(result);

    } on Exception catch (ex) {
      // handle card nonce processing failure
    }
  }


  void _onGooglePayNonceRequestFailure(ErrorInfo errorInfo) {
    // handle google pay failure
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
      body: Column(
        children: [
          FlatButton(
            child: Text('google pay',style: TextStyle(color: Colors.red),),
            onPressed: (){
              _onStartGooglePay();
            },
          )
        ],
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
