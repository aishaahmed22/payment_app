part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSucess extends PaymentState {}

final class PaymentFailur extends PaymentState {
  final String error;

  PaymentFailur(this.error);
}
