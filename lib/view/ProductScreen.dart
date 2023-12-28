import 'package:e_commerce_app/view/values/colors.dart';
import 'package:e_commerce_app/view/values/dimens.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        centerTitle: true,
        title: Text("",style: TextStyle(fontFamily: 'Laila',color: orange),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_rounded,color: brown,)),
      ),
        backgroundColor: bg_color,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(dimen30),
            child: Column(
              children: [
                Stack(               //wrap with builder
                  children:[
                    Container(
                      alignment: Alignment.center,
                      child: Image.network('gs://e-commerce-a028b.appspot.com/women/10.png'),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(icon: Icon(Icons.favorite,color: Colors.red,),onPressed: (){
                                 //add to wishList
                      }),
                    ),
                  ]
                ),
                SizedBox(height: dimen30,),
               Text(''), // name of product and desc
              ],
            ),

        ),
        ),
    );
  }
}
