part of 'stripe_cubit.dart';

@immutable
sealed class StripePaymentState {}

final class StripePaymentInitial extends StripePaymentState {}

final class StripePaymentLoading extends StripePaymentState {}

final class StripePaymentSucess extends StripePaymentState {}

final class StripePaymentFailur extends StripePaymentState {
  final String error;

  StripePaymentFailur(this.error);
}
