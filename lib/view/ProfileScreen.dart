import 'package:e_commerce_app/view/values/colors.dart';
import 'package:e_commerce_app/view/values/strings.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        centerTitle: true,
        title: Text(profileLabel,style: TextStyle(fontFamily: 'Laila',color: orange),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_rounded,color: brown,)),
      ),
        backgroundColor: bg_color,
      body: SafeArea(
        child: AppBar(

        ),
      ),
    );
  }
}
