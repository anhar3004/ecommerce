import 'dart:convert';

import 'package:ecommerce_app/page/main_page.dart';
import 'package:ecommerce_app/page/product.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  static String tag = 'AddData-page';
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  String _baseUrl =
      "https://projectflutter.000webhostapp.com/getDataKategori.php";
  String _valKategori;

  List<dynamic> _dataKategori = List();
  void getData() async {
    final respose = await http.get(_baseUrl);
    var listData = jsonDecode(respose.body);
    setState(() {
      _dataKategori = listData;
    });
    print("data : $listData");
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  TextEditingController controllerId = new TextEditingController();
  TextEditingController controllerCategori = new TextEditingController();
  TextEditingController controllerItem = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerProduct = new TextEditingController();
  TextEditingController controllerDescription = new TextEditingController();
  TextEditingController controllerThumbnail = new TextEditingController();

  void addData() {
    var url = "https://projectflutter.000webhostapp.com/addProduct.php";

    http.post(url, body: {
      // "id_produk": controllerId.text,
      "id_kategori": _valKategori,
      "nama_produk": controllerProduct.text,
      "deskripsi": controllerDescription.text,
      "harga": controllerPrice.text,
      // "thumbnail": controllerThumbnail.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          " ADD PRODUCT",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).primaryColor,
            primaryColor: Theme.of(context).accentColor,
            textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(color: Colors.white),
                ),
          ),
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, 1),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 50,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.white))),
                          child: TextField(
                            controller: controllerProduct,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Name Product",
                                hintStyle: TextStyle(color: Colors.white)),
                          )),
                      Container(
                          height: 50,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.white))),
                          child: TextField(
                            controller: controllerDescription,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Description",
                                hintStyle: TextStyle(color: Colors.white)),
                          )),
                      Container(
                          height: 50,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.white))),
                          child: TextField(
                            controller: controllerPrice,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Price",
                                hintStyle: TextStyle(color: Colors.white)),
                          )),
                      Container(
                        height: 50,
                        padding: EdgeInsets.all(10.0),
                        child: DropdownButton(
                          hint: Text("Select kategori",
                              style: TextStyle(color: Colors.white)),
                          value: _valKategori,
                          items: _dataKategori.map((item) {
                            return DropdownMenuItem(
                              child: Text(item['kategori'],
                                  style: TextStyle(color: Colors.white)),
                              value: item['id_kategori'],
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _valKategori = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ])),
                    child: MaterialButton(
                      child: Center(
                        child: Text(
                          "ADD PRODUCT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onPressed: () {
                        addData();
                        Navigator.of(context).pushNamed(ProductPage.tag);
                      },
                    )),
              ],
            ),
          )),
    );
  }
}
