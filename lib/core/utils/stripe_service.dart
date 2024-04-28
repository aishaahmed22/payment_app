import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/api_service.dart';
import 'package:payment_app/features/data/models/epheremal_key_model/epheremal_key_model.dart';
import 'package:payment_app/features/data/models/init_payment_sheet_input_model/init_payment_sheet_input_model.dart';
import 'package:payment_app/features/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_app/features/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInput) async {
    var response = await apiService.post(
        Body: paymentIntentInput.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.stripeSecretKey);

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
            customerId: initPaymentSheetInputModel.customerId,
            customerEphemeralKeySecret:
                initPaymentSheetInputModel.ephemeralKeySecret,
            merchantDisplayName: "aisha"));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEpheremalKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: ephemeralKeyModel.secret!);

    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EpheremalKeyModel> createEpheremalKey(
      {required String customerId}) async {
    var response = await apiService.post(
      Body: {'customer': customerId},
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/ephemeral_keys",
      headers: {
        'Authorization': "Bearer ${ApiKeys.stripeSecretKey}",
        'Stripe-Version': "2023-10-16"
      },
    );

    var ephemeralKey = EpheremalKeyModel.fromJson(response.data);
    return ephemeralKey;
  }
}
