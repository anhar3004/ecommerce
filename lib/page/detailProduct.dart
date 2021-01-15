import 'package:ecommerce_app/page/editProduct.dart';
import 'package:ecommerce_app/page/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main_page.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "https://projectflutter.000webhostapp.com/deleteData.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are You sure want to delete '${widget.list[widget.index]['name_categori']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK DELETE!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.of(context).pushNamed(ProductPage.tag);
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['name_categori']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['name_categori'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "Code : ${widget.list[widget.index]['id']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Name Item : ${widget.list[widget.index]['name_item']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "Price : ${widget.list[widget.index]['price']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new EditData(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    new RaisedButton(
                      child: new Text("DELETE"),
                      color: Colors.red,
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
