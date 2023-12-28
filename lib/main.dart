import 'package:e_commerce_app/view/AddToCartScreen.dart';
import 'package:e_commerce_app/view/HomeScreen.dart';
import 'package:e_commerce_app/view/LoginScreen.dart';
import 'package:e_commerce_app/view/ProductScreen.dart';
import 'package:e_commerce_app/view/ProfileScreen.dart';
import 'package:e_commerce_app/view/SignupScreen.dart';
import 'package:e_commerce_app/view/SplashScreen.dart';
import 'package:e_commerce_app/view/WishListScreen.dart';
import 'package:e_commerce_app/view/values/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context , child){
        return MaterialApp(
          title: appName,
          debugShowCheckedModeBanner: false,
          home: child,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => SplashScreen(),
            '/login': (context) => LoginScreen(),
            '/signup': (context) => SignupScreen(),
            '/home': (context) => HomeScreen(),
            '/product': (context) => ProductScreen(),
            '/profile': (context) => ProfileScreen(),
            '/wish': (context) => WishListScreen(),
            '/cart': (context) => AddToCartScreen(),


          },
        );
      },

    );
  }
}
