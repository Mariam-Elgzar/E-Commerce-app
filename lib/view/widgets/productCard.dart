import 'package:e_commerce_app/model/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/dimens.dart';
class ProductCard extends StatelessWidget {
  // Get a non-default Storage bucket
  final storage = FirebaseStorage.instanceFor(bucket: "gs://e-commerce-a028b.appspot.com");

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: black,
      elevation: dimen3,
      child: Padding(
        padding: EdgeInsets.all(dimen6),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    InkWell(
                      child: Ink.image(image: storage.bucket.),   //Image Card clickable
                      onTap: (){
                        Navigator.of(context).pushNamed('/product');
                      },
                    ),
                    Text( ,
                      style: TextStyle(
                        color: secondary,
                        fontSize: dimen15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                ),
              ),

        ),
        //     }
        //   },
        // ),
      ),
    );
  }
}

Widget itemsCard(item){
  return Card(
    elevation: 0,
    semanticContainer: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Material(
            child: InkWell(
              onTap: () {
                
              },
              child: GridTile(
                child: Image.network(
                  item['image'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "\$${item['price'].toString()}.00",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                item['name'],
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}