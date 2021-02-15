import 'dart:convert';
import 'dart:async';
import 'package:ecommerce_app/page/addProduct.dart';
import 'package:ecommerce_app/page/detailProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailKategori extends StatefulWidget {
  static String tag = 'DetailKategori-page';
  List list;
  int index;
  DetailKategori({this.index, this.list});

  @override
  _DetailKategoriState createState() => _DetailKategoriState();
}

class _DetailKategoriState extends State<DetailKategori> {
  Future<List> getData() async {
    final response = await http.get(
        "https://projectflutter.000webhostapp.com/getProduk.php?id_kategori=" +
            widget.list[widget.index]['id_kategori']);
    // );
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "PRODUCT",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
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
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return new ListView.builder(
              itemCount: snapshot.data == null ? 0 : snapshot.data.length,
              itemBuilder: (context, i) {
                return new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new GestureDetector(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new Detail(
                                  list: snapshot.data,
                                  index: i,
                                ))),
                    child: new Card(
                      child: new ListTile(
                        title: new Text(snapshot.data[i]['nama_produk']),
                        leading: new Image.network(
                          "http://projectflutter.000webhostapp.com/assets/" +
                              snapshot.data[i]['thumbnail'],
                          height: 50.0,
                          width: 50.0,
                          fit: BoxFit.cover,
                        ),
                        subtitle: new Text("Rp. " + snapshot.data[i]['harga']),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
