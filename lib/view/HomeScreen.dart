import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/view/values/colors.dart';
import 'package:e_commerce_app/view/values/strings.dart';
import 'package:e_commerce_app/view/widgets/reusableWidgets.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        centerTitle: true,
        title: Text(homeLabel,style: TextStyle(fontFamily: 'Laila',color: orange),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_rounded,color: brown,)),
      ),
      backgroundColor: bg_color,
      body: SafeArea(
        child:Container()
        // FutureBuilder<Recommended>(
        //   builder: (context. snapshot){
        //     return GridView.builder(
        //     gridDelegate: gridDelegate,
        //     itemBuilder:  );
        // },
        //   future: ,
        // )
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
