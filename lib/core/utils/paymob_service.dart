import 'dart:async';

import 'package:dio/dio.dart';
import 'package:payment_app/core/utils/api_keys.dart';

class PaymobService {
  Dio dio = Dio();
  Future<String> _getAuthenticationToken() async {
    Response response = await dio.post(
        "https://accept.paymob.com/api/auth/tokens",
        data: {"api_key": ApiKeys.paymobApiKey});
    return response.data["token"];
  }

  Future<int> _getOrderId({
    required String authToken,
    required String amount,
    required String currency,
  }) async {
    Response response =
        await dio.post("https://accept.paymob.com/api/ecommerce/orders", data: {
      "auth_token": authToken,
      "delivery_needed": "false",
      "amount_cents": amount,
      "currency": currency,
    });
    return response.data["id"];
  }

  Future<String> _getPaymentKey({
    required String authToken,
    required String amount,
    required String currency,
    required String orderId,
  }) async {
    Response response = await dio.post(
      "https://accept.paymob.com/api/acceptance/payment_keys",
      data: {
        "auth_token": authToken,
        "amount_cents": amount,
        "expiration": 3600,
        "order_id": orderId,
        "currency": currency,
        "integration_id": ApiKeys.paymobIntegrationId,
        "lock_order_when_paid": "false",
        "billing_data": {
          //have to be value
          "first_name": "Clifford",
          "last_name": "Nicolas",
          "email": "claudette09@exa.com",
          "phone_number": "+86(8)9135210487",
          //can set (NA)
          "apartment": "803",
          "floor": "42",
          "street": "Ethan Land",
          "building": "8028",
          "shipping_method": "PKG",
          "postal_code": "01898",
          "city": "Jaskolskiburgh",
          "country": "CR",
          "state": "Utah"
        },
      },
    );
    return response.data["token"];
  }

  Future<String> getPaymentKey(
      {required int amount, required String currency}) async {
    try {
      String authenticationToken = await _getAuthenticationToken();
      int orderId = await _getOrderId(
          authToken: authenticationToken,
          amount: (amount * 100).toString(),
          currency: currency);
      String paymentKey = await _getPaymentKey(
          authToken: authenticationToken,
          amount: (amount * 100).toString(),
          currency: currency,
          orderId: orderId.toString());
      return paymentKey;
    } catch (e) {
      print("===========================");
      print(e.toString());
      throw Exception();
    }
  }
}
