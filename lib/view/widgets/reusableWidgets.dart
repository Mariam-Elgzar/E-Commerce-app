import 'package:e_commerce_app/view/values/dimens.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../values/colors.dart';
import '../values/strings.dart';

class AppTextField extends StatelessWidget {
  final Color iconColor;
  Color? textColor;
  TextEditingController? Tcontroller;
  final String? label;
  bool obs;
  final String? hintText;
  final Icon icon;

   AppTextField({super.key,
     required this.iconColor,
     this.textColor,
     this.Tcontroller,
     this.obs = false,
     required this.label,
     required this.hintText,
     required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obs,
      decoration: InputDecoration(
          filled: true,
          hintStyle: TextStyle(
        fontFamily: 'Laila'
      ),
          labelStyle: TextStyle(
              fontFamily: 'Laila',
            color: iconColor
          ),
          prefixIcon: icon,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: iconColor
            ),
              borderRadius: BorderRadius.circular(dimen40)
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(dimen40)),
          prefixIconColor: iconColor,
          labelText: label,
          hintText: hintText
      ),

      // controller: controller,
      // onSaved: (value){
      //   controller.username= value!;
      // },
    );
  }
}



class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return
      GNav(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        activeColor: orange,
        hoverColor: light_brown_1,
        curve: Curves.easeInCirc,
        textStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontFamily: 'Laila',
            color: orange,
        ),
        backgroundColor: black,
        tabs: [
          GButton(
            icon: Icons.home,
            text: homeLabel,
            iconColor: brown,
            onPressed: (){
              Navigator.of(context).pushNamed('/home');
            },
            activeBorder: Border.all(color: orange),
          ),
          GButton(
            icon: Icons.favorite,
            text: favoriteLabel,
            iconColor: brown,
            iconActiveColor: Colors.red,
            onPressed: (){
              Navigator.of(context).pushNamed('/wish');
            },
            activeBorder: Border.all(color: orange),
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: cartLabel,
            iconColor: brown,
            onPressed: (){
              Navigator.of(context).pushNamed('/cart');
            },
            activeBorder: Border.all(color: orange),
          ),
          GButton(
            icon: Icons.person,
            text: profileLabel,
            iconColor: brown,
            onPressed: (){
              Navigator.of(context).pushNamed('/profile');
            },
            activeBorder: Border.all(color: orange),
          ),
        ],);
  }
}


class appButton extends StatelessWidget {
  const appButton(
      {Key? key,
        required this.text,
        this.margin = const EdgeInsets.symmetric(horizontal: 20),
        required this.height,
        this.width = double.infinity,
        this.onPressed,
        this.textColor,
        this.backColor,
        required this.textSize ,
      })
      : super(key: key);
  final EdgeInsetsGeometry margin;
  final double height;
  final double width;
  final void Function()? onPressed;
  final String text;
  final Color? textColor;
  final Color? backColor;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(blue),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dimen40)
        ),),
      ), onPressed: onPressed,
          child: Text(text,
          style: TextStyle(
              color: textColor ,
              fontFamily: 'Laila',
              fontSize: textSize)),
    ));
  }
}
Widget customApBar(
    void Function()? onPressed,
    String Title,
    ){
  return AppBar(
    backgroundColor: black,
    centerTitle: true,
    title: Text(Title),
    leading: IconButton(onPressed: onPressed
        , icon: Icon(Icons.arrow_back_ios_rounded,color: brown,)),
  );
}

