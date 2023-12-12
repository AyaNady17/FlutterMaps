part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class PhoneAuthLoading extends PhoneAuthState {}

final class PhoneAuthFailure extends PhoneAuthState {
  String errMsg;
  PhoneAuthFailure(this.errMsg);
}

final class PhoneAuthNumberSubmitted extends PhoneAuthState {
  String phoneNumber;
  PhoneAuthNumberSubmitted(this.phoneNumber);
}

final class PhoneAuthNumberOTPVerified extends PhoneAuthState {}
