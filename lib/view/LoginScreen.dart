import 'package:e_commerce_app/model/auth.dart';
import 'package:e_commerce_app/view/values/colors.dart';
import 'package:e_commerce_app/view/values/dimens.dart';
import 'package:e_commerce_app/view/values/strings.dart';
import 'package:e_commerce_app/view/widgets/reusableWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        centerTitle: true,
        title: Text(login,style: TextStyle(fontFamily: 'Laila',color: orange),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_rounded,color: brown,)),
      ),
      backgroundColor: bg_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child:  Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(padding: EdgeInsets.symmetric(horizontal: dimen20, vertical: dimen10).h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        SizedBox(
                          height: dimen40.h,
                        ),
                        Text(welcomeBack, style: TextStyle(fontFamily: 'Laila',
                            fontSize: dimen30.sp, color: light_brown_1)),
                        SizedBox(
                          height: dimen30.h,
                        ),
                        AppTextField(iconColor: light_brown_1,
                            Tcontroller: null,
                            label: emailLabel,
                            icon: Icon(Icons.mail),
                            hintText: enterEmailLabel),
                        SizedBox(
                          height: dimen30.h,
                        ),
                        AppTextField(
                          obs: true,
                            iconColor: light_brown_1,
                            Tcontroller: null,
                            label: passwordLabel,
                            icon: Icon(Icons.lock),
                            hintText: enterPasswordLabel),
                        SizedBox(
                          height: dimen30.h,
                        ),
                        appButton(
                          height: dimen30,
                          width: dimen50,
                          margin: EdgeInsets.all(dimen3),
                          backColor: blue,
                          textColor: light_brown_2,
                          textSize: dimen15,
                          onPressed: () async{
                            try{
                              var auth;
                              auth = await Authentication().logIn(
                                  email: email.text, password: password.text).then((value) {
                                Navigator.of(context).pushReplacementNamed('/home');
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                              });
                            }catch (e){
                              CircularProgressIndicator(color: blue,);
                              print("error $e");
                            }
                          },
                            text: login
                        ),

                        SizedBox(
                          height: dimen15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(doNotHaveAcc, style: TextStyle(fontFamily: 'Laila',
                                fontSize: dimen15.sp, color: blue)),
                            InkWell(
                              child: Text(signup, style: TextStyle(fontFamily: 'Laila',
                                  fontSize: dimen15.sp)),
                              onTap: () => Navigator.pushReplacementNamed(context, '/signup'),
                            )

                          ],
                        ),

                      ]
                  ),
              ),
          ),
        ),
      ),
    );
  }
}
