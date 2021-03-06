// import 'package:ecommerce_app/page/about.dart';
// import 'package:ecommerce_app/page/product.dart';
// import 'package:ecommerce_app/page/profil.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:ecommerce_app/page/home.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MainPage extends StatefulWidget {
//   static String tag = 'main-page';
//   final VoidCallback signOut;
//   MainPage(this.signOut);

//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   void logOut() {
//     setState(() {
//       widget.signOut();
//     });
//   }

//   PageController _pageController;
//   int _page = 0;
//   List<Widget> _screens = [
//     HomePage(),
//     ProductPage(),
//     ProfilPage(),
//     AboutPage()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "MY FURNITURE",
//           style: TextStyle(color: Colors.white, fontSize: 20.0),
//         ),
//         actions: <Widget>[
//           Center(
//             child: IconButton(
//               onPressed: () {
//                 logOut();
//               },
//               icon: Icon(Feather.log_out),
//             ),
//           ),
//           SizedBox(width: 20.0),
//         ],
//       ),
//       body: PageView(
//         physics: NeverScrollableScrollPhysics(),
//         controller: _pageController,
//         onPageChanged: onPageChanged,
//         children: _screens,
//       ),
//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//           canvasColor: Theme.of(context).primaryColor,
//           primaryColor: Theme.of(context).accentColor,
//           textTheme: Theme.of(context).textTheme.copyWith(
//                 caption: TextStyle(color: Colors.white),
//               ),
//         ),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Feather.home,
//               ),
//               title: Container(height: 0.0),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Feather.list,
//               ),
//               title: Container(height: 0.0),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Feather.user,
//               ),
//               title: Container(height: 0.0),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Feather.info,
//               ),
//               title: Container(height: 0.0),
//             ),
//           ],
//           onTap: navigationTapped,
//           currentIndex: _page,
//         ),
//       ),
//     );
//   }

//   void navigationTapped(int page) {
//     _pageController.jumpToPage(page);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 0);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _pageController.dispose();
//   }

//   void onPageChanged(int page) {
//     setState(() {
//       this._page = page;
//     });
//   }
// }
