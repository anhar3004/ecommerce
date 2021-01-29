import 'package:ecommerce_app/page/editProduct.dart';
import 'package:ecommerce_app/page/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main_page.dart';

class Detail extends StatefulWidget {
  static String tag = 'DetailProduct-page';
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "https://projectflutter.000webhostapp.com/deleteProduk.php";
    http.post(url, body: {'id_produk': widget.list[widget.index]['id_produk']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      content: new Text(
          "Are You sure want to delete '${widget.list[widget.index]['nama_produk']}'"),
      actions: <Widget>[
        Container(
          padding: EdgeInsets.all(5),
          child: Row(
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
                child: RaisedButton(
                  child: new Text(
                    "OK DELETE!",
                    style: new TextStyle(color: Colors.white),
                  ),
                  color: Colors.purple[400],
                  onPressed: () {
                    deleteData();
                    Navigator.of(context).pushNamed(ProductPage.tag);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, 1),
                      )
                    ]),
                child: RaisedButton(
                  child: new Text("CANCEL",
                      style: new TextStyle(color: Colors.white)),
                  color: Colors.purple[600],
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        )
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "DETAIL PRODUCT",
          style: new TextStyle(fontSize: 20.0, color: Colors.white),
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
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      child: Text(
                        "Id Product : ${widget.list[widget.index]['id_produk']}",
                        style: new TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      child: Text(
                        "Kategori : ${widget.list[widget.index]['kategori']}",
                        style: new TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      child: Text(
                        "Name Product : ${widget.list[widget.index]['nama_produk']}",
                        style: new TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Container(
                      height: 100,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      child: Text(
                        "Description : ${widget.list[widget.index]['deskripsi']}",
                        style: new TextStyle(fontSize: 18.0),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.white))),
                      child: Text(
                        "Price : ${widget.list[widget.index]['harga']}",
                        style: new TextStyle(fontSize: 18.0),
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

                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     gradient: LinearGradient(colors: [
                //       Color.fromRGBO(143, 148, 251, 1),
                //       Color.fromRGBO(143, 148, 251, .6),
                //     ])),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 70,
                    ),
                    MaterialButton(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          "DELETE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      color: Colors.purple[400],
                      onPressed: () {
                        confirm();
                      },
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    MaterialButton(
                      child: Center(
                        child: Text(
                          "EDIT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      color: Colors.purple[600],
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new EditData(
                            list: widget.list, index: widget.index),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
