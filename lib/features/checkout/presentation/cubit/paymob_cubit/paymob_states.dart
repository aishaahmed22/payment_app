// part of 'payment_cubit.dart';

class PaymobPaymentState {}

final class PaymobPaymentInitial extends PaymobPaymentState {}

final class PaymobPaymentLoading extends PaymobPaymentState {}

final class PaymobPaymentSucess extends PaymobPaymentState {}

final class PaymobPaymentFailur extends PaymobPaymentState {
  final String error;

  PaymobPaymentFailur(this.error);
}
