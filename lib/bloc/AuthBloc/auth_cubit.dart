import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_sate.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthCubit() : super(AuthInitialState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    final savedToken = await _getTokenFromPrefs();
    if (savedToken != null) {
      emit(AuthLoggedInState(savedToken));
    } else {
      emit(AuthLoggedOutState());
    }
  }

  String? _verificationId;
  String? _name;
  String? _phoneNumber;
  bool? _registerBuyer;

  Future<void> sendOTP(
      String phoneNumber, String name, bool registerBuyer) async {
    emit(AuthLoadingState());
    _phoneNumber = phoneNumber;
    _name = name;
    _registerBuyer = registerBuyer;
    final savedToken = await _getTokenFromPrefs();
    if (savedToken != null) {
      emit(AuthLoggedInState(savedToken));
      return;
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        emit(AuthCodeSentState());
      },
      verificationCompleted: (phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential, false);
      },
      verificationFailed: (error) {
        emit(AuthErrorState(error.message.toString()));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<void> sendOTPLogin(String phoneNumber) async {
    emit(AuthLoadingState());
    _phoneNumber = phoneNumber;
    final savedToken = await _getTokenFromPrefs();
    if (savedToken != null) {
      emit(AuthLoggedInState(savedToken));
      return;
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        emit(AuthCodeSentLoginState());
      },
      verificationCompleted: (phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential, true);
      },
      verificationFailed: (error) {
        emit(AuthErrorState(error.message.toString()));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void verifyOTP(String otp, bool isLogin) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: otp,
    );
    signInWithPhone(credential, isLogin);
  }

  void signInWithPhone(PhoneAuthCredential credential, bool isLogin) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        if (!isLogin) {
          //registeration logiccccccccccccccccccccc
          //send token for firebase cloud messaging notifications
          FirebaseMessaging messaging = FirebaseMessaging.instance;
          String? fcmToken = await messaging.getToken();
          print("FCM Token: $fcmToken");
          final apiUrl;
          if (_registerBuyer == false) {
            print('regiter seller is hapenningggggggggg');
            apiUrl =
                'https://furniture-api-ceom.onrender.com/api/auth/registerseller';
          } else {
            print('regiter buyer is hapenningggggggggg');
            apiUrl =
                'https://furniture-api-ceom.onrender.com/api/auth/registerbuyer';
          }
          final response = await http.post(
            Uri.parse(apiUrl),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'phoneNumber': _phoneNumber,
              'fullName': _name,
              'fcmToken': fcmToken
            }),
          );
          if (response.statusCode == 200) {
            final token = jsonDecode(response.body)['token'];
            await _saveTokenToPrefs(token);
            emit(AuthLoggedInState(token));
          } else {
            emit(AuthErrorState('${jsonDecode(response.body)['message']}'));
          }
        } else {
          // loginnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn logic
          final apiUrl =
              'https://furniture-api-ceom.onrender.com/api/auth/login';
          final response = await http.post(
            Uri.parse(apiUrl),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'phoneNumber': _phoneNumber,
            }),
          );

          print('loginnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn logic');

          if (response.statusCode == 200) {
            final token = jsonDecode(response.body)['token'];
            // Save the token to SharedPreferences
            await _saveTokenToPrefs(token);
            emit(AuthLoggedInState(token));
          } else {
            emit(AuthErrorState('${jsonDecode(response.body)['message']}'));
          }
        }
      }
    } catch (error) {
      emit(AuthErrorState(error.toString()));
    }
  }

  Future<void> _saveTokenToPrefs(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String?> _getTokenFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  String getToken() {
    if (state is AuthLoggedInState) {
      return (state as AuthLoggedInState).token;
    } else {
      return "";
    }
  }

  void logOut() async {
    await _auth.signOut();
    // Clear the token from SharedPreferences
    await _clearTokenFromPrefs();
    emit(AuthLoggedOutState());
  }

  Future<void> _clearTokenFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
