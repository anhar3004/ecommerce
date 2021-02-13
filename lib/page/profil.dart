import 'package:ecommerce_app/page/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  static String tag = 'profil-page';

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String username = "", name = "", email = "", id = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
      name = preferences.getString("name");
      email = preferences.getString("email");
      id = preferences.getString("id");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
              primaryColor: Theme.of(context).accentColor,
              textTheme: Theme.of(context).textTheme.copyWith(
                    caption: TextStyle(color: Colors.white),
                  ),
            ),
            child: Container(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ])),
                    ),
                    CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          backgroundColor: Colors.transparent,
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Center(
                              child: Container(
                                width: 200.0,
                                height: 200.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color(0XFFF39C12).withOpacity(.2),
                                          blurRadius: 10.0)
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white,
                                          Colors.grey.shade200
                                        ])),
                                child: Text('V',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 100.0,
                                        color:
                                            Color.fromRGBO(143, 148, 251, 1))),
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Center(
                              child: Text('Hello, I am $name',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25.0)),
                            )
                          ]),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Container(
                              height: 175.0,
                              child: GridView.count(
                                padding: EdgeInsets.all(40.0),
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                crossAxisSpacing: 20.0,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(200.0),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color(0XFFF39C12)
                                                        .withOpacity(.2),
                                                    blurRadius: 10.0)
                                              ],
                                              color: Color.fromRGBO(
                                                  143,
                                                  148,
                                                  251,
                                                  1) //RecehanColors.yellowAccent
                                              ),
                                          child: Icon(Icons.favorite,
                                              size: 40.0,
                                              color: Colors.white))),
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(200.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0XFFF39C12)
                                                      .withOpacity(
                                                          .2), //RecehanColors.yellow
                                                  blurRadius: 10.0)
                                            ],
                                            color: Color.fromRGBO(143, 148, 251,
                                                1), //RecehanColors.yellowAccent
                                          ),
                                          child: Icon(Icons.shopping_cart,
                                              size: 40.0,
                                              color: Colors.white))),
                                  InkWell(
                                      onTap: () {},
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                200.0), //RecehanColors.yellow
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0XFFF39C12)
                                                      .withOpacity(.2),
                                                  blurRadius: 10.0)
                                            ],
                                            color: Color.fromRGBO(143, 148, 251,
                                                1), //RecehanColors.yellowAccent
                                          ),
                                          child: Icon(
                                              Icons.notification_important,
                                              size: 40.0,
                                              color: Colors.white))),
                                ],
                              ),
                            )
                          ]),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 260,
                                  margin: EdgeInsets.only(top: 20.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0)),
                                      color: Colors.white),
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0XFFF39C12)
                                                    .withOpacity(.2),
                                                blurRadius: 10.0)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          gradient: LinearGradient(colors: [
                                            Color.fromRGBO(143, 148, 251, .8),
                                            Color.fromRGBO(143, 148, 251, 1),
                                          ])),
                                      child: Text('@$username',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  padding: EdgeInsets.all(50.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color(0XFFF39C12)
                                                        .withOpacity(.2),
                                                    blurRadius: 10.0)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              gradient: LinearGradient(colors: [
                                                Color.fromRGBO(
                                                    143, 148, 251, .8),
                                                Color.fromRGBO(
                                                    143, 148, 251, 1),
                                              ])),
                                          child: Center(
                                            child: Text('ID : $id',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color(0XFFF39C12)
                                                        .withOpacity(.2),
                                                    blurRadius: 10.0)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              gradient: LinearGradient(colors: [
                                                Color.fromRGBO(
                                                    143, 148, 251, .8),
                                                Color.fromRGBO(
                                                    143, 148, 251, 1),
                                              ])),
                                          child: Center(
                                            child: Text('Name : $name',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color(0XFFF39C12)
                                                        .withOpacity(.2),
                                                    blurRadius: 10.0)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              gradient: LinearGradient(colors: [
                                                Color.fromRGBO(
                                                    143, 148, 251, .8),
                                                Color.fromRGBO(
                                                    143, 148, 251, 1),
                                              ])),
                                          child: Center(
                                            child: Text('Email  : $email',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ))
                                      // Flexible(
                                      //   child: Column(
                                      //     children: <Widget>[
                                      //       Text('23',
                                      //           style: TextStyle(
                                      //               fontSize: 20.0,
                                      //               color: Color.fromRGBO(
                                      //                   143, 148, 251, 1))),
                                      //       Text('Posts',
                                      //           style: TextStyle(
                                      //               fontSize: 15.0,
                                      //               color: Color.fromRGBO(
                                      //                   143, 148, 251, 1)))
                                      //     ],
                                      //   ),
                                      // ),
                                      // Flexible(
                                      //   child: Column(
                                      //     children: <Widget>[
                                      //       Text('123',
                                      //           style: TextStyle(
                                      //               fontSize: 20.0,
                                      //               color: Color.fromRGBO(
                                      //                   143, 148, 251, 1))),
                                      //       Text('Following',
                                      //           style: TextStyle(
                                      //               fontSize: 15.0,
                                      //               color: Color.fromRGBO(
                                      //                   143, 148, 251, 1)))
                                      //     ],
                                      //   ),
                                      // ),
                                      // Flexible(
                                      //   child: Column(
                                      //     children: <Widget>[
                                      //       Text('2k',
                                      //           style: TextStyle(
                                      //               fontSize: 20.0,
                                      //               color: Color.fromRGBO(
                                      //                   143, 148, 251, 1))),
                                      //       Text('Followers',
                                      //           style: TextStyle(
                                      //               fontSize: 15.0,
                                      //               color: Color.fromRGBO(
                                      //                   143, 148, 251, 1)))
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
