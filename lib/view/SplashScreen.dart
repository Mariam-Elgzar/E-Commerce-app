import 'package:e_commerce_app/view/values/colors.dart';
import 'package:e_commerce_app/view/values/dimens.dart';
import 'package:e_commerce_app/view/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.of(context).pushReplacementNamed('/login');
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brown,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: dimen150.h,
              width: dimen150.w,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dimen50).w,
              ),
              child: Image.asset('assets/shop_image.png',fit: BoxFit.fill),
            ),
            // const CircleAvatar(
            //   backgroundImage: AssetImage('assets/post_img_3.jpg'),
            // ),
            SizedBox(
              height: dimen30.h,
            ),
            Text(clothesStoreLabel,
              style: TextStyle(
                  fontSize: dimen20.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Laila',
                  color: bg_color),
            ),

          ],
        ),
      ),
    );
  }
}
