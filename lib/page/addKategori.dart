import 'dart:convert';
import 'dart:async';
import 'package:ecommerce_app/page/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDataKategori extends StatefulWidget {
  static String tag = 'addKategori-page';
  @override
  _AddDataKategoriState createState() => _AddDataKategoriState();
}

class _AddDataKategoriState extends State<AddDataKategori> {
  TextEditingController controllerId = new TextEditingController();
  TextEditingController controllerCategori = new TextEditingController();

  void addData() {
    var url = "https://projectflutter.000webhostapp.com/addKategori.php";

    http.post(url, body: {
      // "id_kategori": controllerId.text,
      "kategori": controllerCategori.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "ADD CATEGORI",
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
                    children: <Widget>[
                      Container(
                          height: 50,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.white))),
                          child: TextField(
                            controller: controllerCategori,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Name Categori",
                                hintStyle: TextStyle(color: Colors.white)),
                          )),
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
                          "ADD KATEGORI",
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
