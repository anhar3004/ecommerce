import 'dart:convert';

import 'package:ecommerce_app/page/detailProduct.dart';
import 'package:ecommerce_app/page/details.dart';
import 'package:ecommerce_app/page/home.dart';
import 'package:ecommerce_app/page/main_page.dart';
import 'package:ecommerce_app/page/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class EditData extends StatefulWidget {
  static String tag = 'EditProduct-page';
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerId = new TextEditingController();
  TextEditingController controllerCategori = new TextEditingController();
  TextEditingController controllerItem = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerProduct = new TextEditingController();
  TextEditingController controllerDescription = new TextEditingController();
  TextEditingController controllerThumbnail = new TextEditingController();

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

  void editData() {
    var url = "https://projectflutter.000webhostapp.com/editProduk.php";

    http.post(url, body: {
      "id_produk": controllerId.text,
      "id_kategori": _valKategori,
      "nama_produk": controllerProduct.text,
      "deskripsi": controllerDescription.text,
      "harga": controllerPrice.text,
      // "thumbnail": controllerThumbnail.text,
    });
  }

  @override
  void initState() {
    controllerProduct = new TextEditingController(
        text: widget.list[widget.index]['nama_produk']);
    controllerId =
        new TextEditingController(text: widget.list[widget.index]['id_produk']);
    controllerDescription =
        new TextEditingController(text: widget.list[widget.index]['deskripsi']);
    controllerPrice =
        new TextEditingController(text: widget.list[widget.index]['harga']);
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
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
                          controller: controllerId,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Id Product",
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
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
                        ),
                      ),
                      Container(
                          height: 70,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.white))),
                          child: TextFormField(
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
                          "SUBMIT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onPressed: () {
                        editData();
                        Navigator.of(context).pushNamed(LoginPage.tag);
                      },
                    )),
              ],
            ),
          )),
    );
  }
}
