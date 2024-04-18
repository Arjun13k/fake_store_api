import 'dart:convert';

import 'package:fake_store_api/model/fakestore_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  FakestoreApiModel? fakemodel;
  Future getData() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products/1");
    var resp = await http.get(url);
    if (resp.statusCode == 200) {
      var decodedData = jsonDecode(resp.body);

      fakemodel = FakestoreApiModel.fromJson(decodedData);
    } else {
      print("failed");
    }
    notifyListeners();
  }

  Future addData() async {
    // Uri url = Uri.parse("https://fakestoreapi.com/products");
    // var resp = await http.post(url);
    // if (resp.statusCode == 200) {
    //   var decodedData = jsonDecode(resp.body);

    //   fakemodel = FakestoreApiModel.fromJson(decodedData);
    // } else {
    //   print("failed");
    // }

    // getData();
    // notifyListeners();
  }
}
