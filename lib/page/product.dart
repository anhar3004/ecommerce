import 'package:ecommerce_app/page/detailProduct.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import "package:http/http.dart" as http;

import 'addProduct.dart';
// import './Detail.dart';
// import './adddata.dart';

class ProductPage extends StatefulWidget {
  static String tag = 'product-page';

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List> getData() async {
    final response =
        await http.get("https://projectflutter.000webhostapp.com/getData.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MY STORE"),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
          builder: (BuildContext context) => new AddData(),
        )),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(
                      list: list,
                      index: i,
                    ))),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['name_categori']),
                leading: new Icon(Icons.widgets),
              ),
            ),
          ),
        );
      },
    );
  }
}
