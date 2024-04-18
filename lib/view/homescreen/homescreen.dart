import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_api/controller/homescreen_controler.dart';
import 'package:fake_store_api/view/homescreen/cart_list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<HomeScreenController>().getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerObj = Provider.of<HomeScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        centerTitle: true,
        title: Text(
          "Fake Store",
          style: TextStyle(
              color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => CartList(model:providerObj.fakemodel[index] ,),
                //     ));
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartList(
                          model: providerObj.fakemodel[index],
                        ),
                      )),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.6),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                            imageUrl:
                                "${providerObj.fakemodel[index].image ?? ""}"),
                        //  (
                        //       providerObj.fakemodel[index].image ?? "",
                        //     ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          providerObj.fakemodel[index].title ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          "\$${providerObj.fakemodel[index].price ?? ""}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        // Text(
                        //   providerObj.fakemodel[index].description ?? "",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, fontSize: 18),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: providerObj.fakemodel.length),
    );
  }
}
