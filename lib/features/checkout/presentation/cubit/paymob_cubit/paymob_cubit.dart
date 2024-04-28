import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/utils/paymob_service.dart';
import 'package:payment_app/features/checkout/presentation/cubit/paymob_cubit/paymob_states.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymobPaymentCubit extends Cubit<PaymobPaymentState> {
  PaymobPaymentCubit() : super(PaymobPaymentInitial());

  // static PaymentCubit get(context) => BlocProvider.of(context);

  Future makePayment({required int amount, required String currency}) async {
    emit(PaymobPaymentLoading());

    try {
      await PaymobService()
          .getPaymentKey(amount: amount, currency: currency)
          .then((String paymentKey) => launchUrl(
                Uri.parse(
                    "https://accept.paymob.com/api/acceptance/iframes/841345?payment_token==$paymentKey"),
              ));

      emit(PaymobPaymentSucess());
    } catch (e) {
      emit(PaymobPaymentFailur(e.toString()));
    }
  }
}
