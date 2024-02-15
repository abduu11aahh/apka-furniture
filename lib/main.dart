import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Apka_Furniture/bloc/BidBloc/bid_cubit.dart';
import 'package:Apka_Furniture/bloc/NotificationBloc/notification_cubit.dart';
import 'package:Apka_Furniture/bloc/ProposalBloc/proposal_cubit.dart';
import 'package:Apka_Furniture/bloc/QuoteBloc/quote_cubit.dart';
import 'package:Apka_Furniture/bloc/cartBloc/cart_cubit.dart';
import 'package:Apka_Furniture/bloc/productBloc/product_cubit.dart';
import 'package:Apka_Furniture/widgets/seller_bottom_bar.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_cubit.dart';
import 'package:Apka_Furniture/bloc/AuthBloc/auth_sate.dart';
import 'package:Apka_Furniture/presentation/buyer_and_seller_screen/buyer_and_seller_screen.dart';
import 'package:Apka_Furniture/presentation/splash_screen/splash_screen.dart';
import 'package:Apka_Furniture/theme/theme_helper.dart';
import 'package:Apka_Furniture/routes/app_routes.dart';
import 'package:Apka_Furniture/bloc/bottomBarBloc/bottomBarCubit.dart';
import 'package:Apka_Furniture/bloc/bottomBarBloc/sellerBottomBarCubit.dart';
import 'package:Apka_Furniture/widgets/custom_bottom_app_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
var navigatorKey = GlobalKey<NavigatorState>();
FirebaseMessaging messaging = FirebaseMessaging.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BottomBarCubit>(create: (context) => BottomBarCubit()),
        BlocProvider<SellerBottomBarCubit>(
            create: (context) => SellerBottomBarCubit()),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<ProductCubit>(create: (context) => ProductCubit()),
        BlocProvider<CartCubit>(create: (context) => CartCubit()),
        BlocProvider<QuoteCubit>(create: (context) => QuoteCubit()),
        BlocProvider<BidCubit>(create: (context) => BidCubit()),
        BlocProvider<ProposalCubit>(create: (context) => ProposalCubit()),
        BlocProvider<NotificationCubit>(
            create: (context) => NotificationCubit()),
      ],
      child: MyApp(),
    ),
  );
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message, BuildContext context) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
  if (message.notification != null) {
    print(
        'Message also contained a notification: ${message.notification!.title}');
    context.read<NotificationCubit>().addMessage(message.notification!);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: $message');

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification!.title}');
        context.read<NotificationCubit>().addMessage(message.notification!);
      }
    });
    FirebaseMessaging.onBackgroundMessage((message) async {
      _firebaseMessagingBackgroundHandler(
          message, navigatorKey.currentContext!);
    });

    return MaterialApp(
      title: 'Apka_Furniture',
      debugShowCheckedModeBanner: false,
      //initialRoute: AppRoutes.splashScreen,
      home: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (oldState, newState) {
          return oldState is AuthInitialState;
        },
        builder: (context, state) {
          if (state is AuthLoggedInState) {
            String token = state.token;
            Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
            if (decodedToken['role'] == 'buyer') {
              return CustomBottomAppBar();
            } else {
              return SellerBottomAppBar();
            }
          } else if (state is AuthLoggedOutState) {
            return BuyerAndSellerScreen();
          } else {
            return SplashScreen();
          }
        },
      ),
      routes: AppRoutes.routes,
      theme: theme,
    );
  }
}
