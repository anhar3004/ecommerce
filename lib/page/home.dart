import 'package:ecommerce_app/util/data.dart';
import 'package:ecommerce_app/widgets/badge.dart';
import 'package:ecommerce_app/widgets/product_item.dart';
import 'package:ecommerce_app/widgets/room_item.dart';
import 'package:ecommerce_app/widgets/search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  final String email;
  HomePage({this.email});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Center(
            child: IconBadge(
              icon: Feather.shopping_cart,
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              "What are you \nlooking for?",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SearchCard(),
          ),
          SizedBox(height: 30.0),
          buildRoomList(),
          SizedBox(height: 20.0),
          buildTitleRow(),
          buildProductList(),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  buildRoomList() {
    return Container(
      height: 275,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: furnitures.length,
        itemBuilder: (BuildContext context, int index) {
          Map furniture = furnitures[index];

          return RoomItem(
            furniture: furniture,
          );
        },
      ),
    );
  }

  buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Popular Products",
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
    );
  }

  buildProductList() {
    return Container(
      height: 140.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: furnitures.length,
        itemBuilder: (BuildContext context, int index) {
          Map furniture = furnitures[index];

          return ProductItem(
            furniture: furniture,
          );
        },
      ),
    );
  }
}
