import 'package:ecommerce_app/page/detailProduct.dart';
import 'package:ecommerce_app/page/details.dart';
import 'package:ecommerce_app/page/home.dart';
import 'package:ecommerce_app/page/main_page.dart';
import 'package:ecommerce_app/page/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerId;
  TextEditingController controllerCategori;
  TextEditingController controllerItem;
  TextEditingController controllerPrice;

  void editData() {
    var url = "https://projectflutter.000webhostapp.com/editData.php";

    http.post(url, body: {
      "id": controllerId.text,
      "nameCategori": controllerCategori.text,
      "nameItem": controllerItem.text,
      "price": controllerPrice.text
    });
  }

  @override
  void initState() {
    controllerId =
        new TextEditingController(text: widget.list[widget.index]['id']);
    controllerCategori = new TextEditingController(
        text: widget.list[widget.index]['name_categori']);
    controllerItem =
        new TextEditingController(text: widget.list[widget.index]['name_item']);
    controllerPrice =
        new TextEditingController(text: widget.list[widget.index]['price']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerId,
                  decoration:
                      new InputDecoration(hintText: "ID", labelText: "ID"),
                ),
                new TextField(
                  controller: controllerCategori,
                  decoration: new InputDecoration(
                      hintText: "Nama Categori", labelText: "Nama Categori"),
                ),
                new TextField(
                  controller: controllerItem,
                  decoration: new InputDecoration(
                      hintText: "Name Item", labelText: "Name Item"),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                      hintText: "Price", labelText: "Price"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).pushNamed(ProductPage.tag);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
