import 'dart:convert';
import 'dart:async';
import 'package:ecommerce_app/page/details.dart';
import "package:http/http.dart" as http;
import 'package:ecommerce_app/widgets/search_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  final String email;
  HomePage({this.email});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> getData() async {
    final response = await http
        .get("https://projectflutter.000webhostapp.com/getDataKategori.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Center(
                child: Text(
                  "What are you looking for?",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SearchCard(),
          ),
          SizedBox(height: 10.0),
          produk(),
          // SizedBox(height: 20.0),
          // buildProductList(),
          // SizedBox(height: 10.0),
        ],
      ),
    );
  }

  produk() {
    return Container(
      height: 680,
      child: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? new Produk(
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

class Produk extends StatefulWidget {
  final List list;
  Produk({this.list});

  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.list == null ? 0 : widget.list.length,
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.list[i]['kategori'],
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        "View More",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: 175,
              //   child: FutureBuilder<List>(
              //     future: getData(),
              //     builder: (context, snapshot) {
              //       return snapshot.hasData
              //           ? new ListProduk(
              //               listProduk: snapshot.data,
              //             )
              //           : new Center(
              //               child: new CircularProgressIndicator(),
              //             );
              //     },
              //   ),
              // )
              ListProduk(
                list: widget.list,
                index: i,
              )
            ],
          );
        },
      ),
    );
  }
}

class ListProduk extends StatefulWidget {
  final List list;
  final int index;
  ListProduk({this.list, this.index});

  @override
  _ListProdukState createState() => _ListProdukState();
}

class _ListProdukState extends State<ListProduk> {
  Future<List> getData() async {
    final response = await http.get(
        "https://projectflutter.000webhostapp.com/getProduk.php?id_kategori=" +
            widget.list[widget.index]['id_kategori']);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return new ListView.builder(
              scrollDirection: Axis.horizontal,
              // itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemCount: 5,
              itemBuilder: (context, i) {
                return Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Details(list: snapshot.data, index: i);
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 140,
                      width: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "http://projectflutter.000webhostapp.com/assets/" +
                                  snapshot.data[i]['thumbnail'],
                              height: 140,
                              width: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
