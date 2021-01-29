import 'dart:convert';
import 'dart:async';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

class Tittle extends StatelessWidget {
  final List listTitle;
  Tittle({this.listTitle});
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listTitle == null ? 0 : listTitle.length,
        itemBuilder: (context, i) {
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
        });
  }
}
