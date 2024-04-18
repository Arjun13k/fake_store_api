import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_api/model/fakestore_model.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.model});
  final FakestoreApiModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.6),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: "${model.image ?? ""}",
                    height: 250,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.title ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$${model.price.toString()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    model.description ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                          child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.green),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: Text("Are you sure you want to add this"),
//                       actions: [
//                         TextButton(onPressed: () {}, child: Text("NO"))
//                         Spacer(),
//                         TextButton(onPressed: () {}, child: Text("NO"))
//                       ],
//                     ),