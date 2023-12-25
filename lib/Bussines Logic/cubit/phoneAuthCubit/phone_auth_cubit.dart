import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());
  late String verificationId;
  late String number;
  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: CodeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) {
    print("verification Completed");
    emit(PhoneAuthNumberOTPVerified());
    signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    printErrorMessage(error);
    emit(PhoneAuthFailure(error.toString()));
  }

  void CodeSent(String verificationId, int? resendToken) {
    print("Code Sent");
    this.verificationId = verificationId;
    emit(PhoneAuthNumberSubmitted(number));
  }

  Future<void> submitOTP(String otp) async {
    AuthCredential credential = await PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    signIn(credential);
  }

  Future<void> signIn(AuthCredential credential) async {
    try {
      var auth = FirebaseAuth.instance;
      await auth.signInWithCredential(credential);
      emit(PhoneAuthNumberOTPVerified());
    } on Exception catch (e) {
      emit(PhoneAuthFailure(e.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getCurrentUser() {
    return FirebaseAuth.instance.currentUser!;
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  String printErrorMessage(FirebaseAuthException error) {
    print(error.code);
    switch (error.code) {
      case 'invalid-phone-number':
        return ('The provided phone number is not valid.');

      case 'invalid-verification-code':
        return ('The verification code is not valid.');

      case 'too-many-requests':
        return ('Too many unsuccessful verification attempts. Please try again later.');

      case 'quota-exceeded':
        return ('SMS quota exceeded. Please try again later.');

      default:
        return ('An error occurred during phone number verification: ${error.message}');
    }
  }
}
