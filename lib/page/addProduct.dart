import 'package:ecommerce_app/page/main_page.dart';
import 'package:ecommerce_app/page/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerId = new TextEditingController();
  TextEditingController controllerCategori = new TextEditingController();
  TextEditingController controllerItem = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();

  void addData() {
    var url = "https://projectflutter.000webhostapp.com/addData.php";

    http.post(url, body: {
      "id": controllerId.text,
      "nameCategori": controllerCategori.text,
      "nameItem": controllerItem.text,
      "price": controllerPrice.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
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
                      hintText: "Name Categori", labelText: "Name Categori"),
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
                  child: new Text("ADD DATA PRODUCT"),
                  color: Color.fromRGBO(113, 119, 217, 1),
                  onPressed: () {
                    addData();
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
