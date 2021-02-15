import 'dart:convert';
import 'package:ecommerce_app/page/about.dart';
import 'package:ecommerce_app/page/home.dart';
import 'package:ecommerce_app/page/main_page.dart';
import 'package:ecommerce_app/page/product.dart';
import 'package:ecommerce_app/page/profil.dart';
import 'package:ecommerce_app/page/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

enum LoginStatus { notSignin, signIn }

class _LoginPageState extends State<LoginPage> {
  LoginStatus _loginStatus = LoginStatus.notSignin;
  String username;
  String password;
  bool _secureText = true;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController emailInput = new TextEditingController();
  TextEditingController passwordInput = new TextEditingController();

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http
        .post("https://projectflutter.000webhostapp.com/cekLogin.php", body: {
      "username": username,
      "password": password,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String id = data['id'];
    String message = data['message'];
    String usernameAPI = data['username'];
    String nameAPI = data['name'];
    String email = data['email'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, id, usernameAPI, nameAPI, email);
      });
      print(message);
    } else {
      print(message);
    }
  }

  savePref(
      int value, String id, String username, String name, String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("id", id);
      preferences.setString("name", name);
      preferences.setString("username", username);
      preferences.setString("email", email);
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignin;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignin;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }
  // void login() {
  //   if (_formkey.currentState.validate()) {
  //     if (emailInput.text == username && passwordInput.text == password) {
  //       Navigator.of(context).pushNamed(MainPage.tag);
  //     } else {
  //       setState(() {
  //         alert = "Email atau Password salah";
  //       });
  //     }
  //     // print('Tes');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignin:
        return Scaffold(
          // backgroundColor: Colors.white,
          body: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
              primaryColor: Theme.of(context).accentColor,
              textTheme: Theme.of(context).textTheme.copyWith(
                    caption: TextStyle(color: Colors.white),
                  ),
            ),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: 80,
                            height: 200,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            ),
                          ),
                          Positioned(
                              left: 140,
                              width: 80,
                              height: 150,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-2.png'))),
                              )),
                          Positioned(
                            right: 40,
                            top: 40,
                            width: 80,
                            height: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  // color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, 1),
                                      // blurRadius: 20.0,
                                      // offset: Offset(0, 10) )
                                    )
                                  ]),
                              child: Form(
                                key: _key,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white))),
                                      child: TextFormField(
                                        onSaved: (e) => username = e,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "isi username/email anda";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email or Username",
                                            hintStyle:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        obscureText: _secureText,
                                        onSaved: (e) => password = e,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "isi password anda";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          suffixIcon: IconButton(
                                            onPressed: showHide,
                                            icon: Icon(_secureText
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: MaterialButton(
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                onPressed: () {
                                  check();
                                },
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Don't have account? ",
                            style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1),
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            child: Text(
                              "Register now ",
                              style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1),
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(RegisterPage.tag);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return MainPage(signOut);
        break;
    }
  }
}

class MainPage extends StatefulWidget {
  static String tag = 'main-page';
  final Function signOut;
  MainPage(this.signOut);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void logOut() {
    setState(() {
      widget.signOut();
    });
  }

  PageController _pageController;
  int _page = 0;
  List<Widget> _screens = [
    HomePage(),
    ProductPage(),
    ProfilPage(),
    AboutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MY FURNITURE",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        actions: <Widget>[
          Center(
            child: IconButton(
              onPressed: () {
                logOut();
              },
              icon: Icon(Feather.log_out),
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.white),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Feather.home,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.list,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.user,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.info,
              ),
              title: Container(height: 0.0),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
