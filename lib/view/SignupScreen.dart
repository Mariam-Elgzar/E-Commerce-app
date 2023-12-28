import 'package:e_commerce_app/model/cloud_firestore.dart';
import 'package:e_commerce_app/view/values/colors.dart';
import 'package:e_commerce_app/view/values/dimens.dart';
import 'package:e_commerce_app/view/values/strings.dart';
import 'package:e_commerce_app/view/widgets/reusableWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/auth.dart';

class SignupScreen extends StatelessWidget {
  bool isMale = false;
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        centerTitle: true,
        title: Text(signup,style: TextStyle(fontFamily: 'Laila',color: orange),),
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
                      child: Image.asset('assets/user_pic.jpg',fit: BoxFit.fill),
                    ),
                    SizedBox(
                      height: dimen40.h,
                    ),
                    Text(createAccount, style: TextStyle(fontSize: dimen30.sp, color: light_brown_1,fontFamily: 'Laila',)),
                    SizedBox(
                      height: dimen30.h,
                    ),
                    AppTextField(
                        iconColor: light_brown_1,
                        textColor: bg_color,
                        Tcontroller: name,
                        label: userNameLabel,
                        icon: Icon(Icons.account_circle_rounded),
                        hintText: enterUserNameLabel
                    ),
                    SizedBox(
                      height: dimen30.h,
                    ),
                    AppTextField(iconColor: light_brown_1,
                        textColor: bg_color,
                        Tcontroller: email,
                        label: emailLabel,
                        icon: Icon(Icons.mail),
                        hintText: enterEmailLabel),
                    SizedBox(
                      height: dimen30.h,
                    ),
                    AppTextField(iconColor: light_brown_1,
                        Tcontroller: password,
                        obs: true,
                        label: passwordLabel,
                        icon: Icon(Icons.lock),
                        hintText: enterPasswordLabel
                    ),
                    SizedBox(
                      height: dimen30.h,
                    ),
                    AppTextField(iconColor: light_brown_1,
                        Tcontroller: confirmPass,
                        label: passwordLabel,
                        icon: Icon(Icons.lock),
                        obs: true,
                        hintText: confirmYourPasswordLabel
                    ),
                    SizedBox(
                      height: dimen30.h,
                    ),
                    AppTextField(
                        iconColor: light_brown_1,
                        textColor: bg_color,
                        Tcontroller: age,
                        label: ageLabel,
                        icon: Icon(Icons.person),
                        hintText: enterAgeLabel
                    ),
                    SizedBox(
                      height: dimen30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        appButton(
                          width: dimen50,
                            text: maleText,
                            height: dimen30,
                            textSize: dimen15,
                          textColor: orange,
                          backColor: black,
                          onPressed: (){
                            isMale = true;
                          },
                          margin: EdgeInsets.all(dimen3),
                        ),
                        SizedBox(width: dimen15,),
                        appButton(
                          width: dimen50,
                          text: femaleText,
                          height: dimen30,
                          textSize: dimen15,
                          textColor: orange,
                          backColor: black,
                          onPressed: (){
                              isMale = false;
                          },
                          margin: EdgeInsets.all(dimen3),
                        ),
                      ],
                    ),
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
                              auth = await Authentication().signUp(
                                  email: email.text, password: password.text)
                                  .then((value) {
                              print("Created new acc");
                                  Navigator.of(context).pushReplacementNamed('/home');})
                                  .onError((error, stackTrace) {
                                    print("Error ${error.toString()}");});
                              // if (auth == null){
                              //   CloudFireStore().setUserData(
                              //       imgUrl: "",
                              //       email: email.text,
                              //       age: int.parse(age.text),
                              //       name: name.text
                              //   );
                              // }else{
                              //   CircularProgressIndicator(color: blue,);
                              //   print("complete your data");
                              // }
                          }catch (e){
                            print("error $e");
                            CircularProgressIndicator(color: blue,);
                          }
                        },
                        text: signup
                    ),
                    SizedBox(
                      height: dimen15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(alreadyHaveAcc, style: TextStyle(fontSize: dimen15.sp, color: blue,fontFamily: 'Laila',)),
                        InkWell(
                          child: Text(login, style: TextStyle(fontSize: dimen15.sp, fontFamily: 'Laila',)),
                          onTap: () => Navigator.pushReplacementNamed(context, '/login'),
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
