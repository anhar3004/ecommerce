import 'package:ecommerce_app/widgets/kategori.dart';
import 'package:ecommerce_app/widgets/produk.dart';
import 'package:flutter/material.dart';

import '../page/details.dart';

class RoomItem extends StatelessWidget {
  final Produk furniture;

  RoomItem({this.furniture});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Details();
              },
            ),
          );
        },
        child: Container(
          height: 275,
          width: 280,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                furniture.nama,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "http://projectflutter.000webhostapp.com/assets/" +
                      furniture.thumbnail,
                  height: 240,
                  width: 280,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
