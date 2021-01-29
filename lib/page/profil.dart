import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  static String tag = 'profil-page';

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
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
                            SizedBox(height: 40.0),
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
                              child: Text('Hello, I am "Name"',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25.0)),
                            )
                          ]),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Container(
                              height: 200.0,
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
                                  height: 500,
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
                                          horizontal: 60.0, vertical: 20.0),
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
                                      child: Text('USERNAME',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 60.0),
                                  padding: EdgeInsets.all(50.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Flexible(
                                        child: Column(
                                          children: <Widget>[
                                            Text('23',
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Color.fromRGBO(
                                                        143, 148, 251, 1))),
                                            Text('Posts',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Color.fromRGBO(
                                                        143, 148, 251, 1)))
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          children: <Widget>[
                                            Text('123',
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Color.fromRGBO(
                                                        143, 148, 251, 1))),
                                            Text('Following',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Color.fromRGBO(
                                                        143, 148, 251, 1)))
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          children: <Widget>[
                                            Text('2k',
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Color.fromRGBO(
                                                        143, 148, 251, 1))),
                                            Text('Followers',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Color.fromRGBO(
                                                        143, 148, 251, 1)))
                                          ],
                                        ),
                                      ),
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
