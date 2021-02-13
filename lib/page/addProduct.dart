import 'dart:convert';
import 'dart:io';
import "package:async/async.dart";
import 'package:ecommerce_app/page/login.dart';
import 'package:path/path.dart';
// import 'package:image/image.dart';
import 'package:ecommerce_app/page/product.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class AddData extends StatefulWidget {
  static String tag = 'AddData-page';
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  File _image;
  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;
    // int rand = new Math.Random().nextInt(10000);
    // Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    // Img.Image smallerImg = Img.copyResize(image, width: 224, height: 224);
    // var compressImg = new File("$path/image_$rand.jpg")
    //   ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));
    setState(() {
      _image = imageFile;
    });
  }

  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    // final tempDir = await getTemporaryDirectory();
    // final path = tempDir.path;
    // int rand = new Math.Random().nextInt(10000);
    // Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    // Img.Image smallerImg = Img.copyResize(image, width: 224, height: 224);
    // var compressImg = new File("$path/image_$rand.jpg")
    //   ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));
    setState(() {
      _image = imageFile;
    });
  }

  String _baseUrl =
      "https://projectflutter.000webhostapp.com/getDataKategori.php";
  String _valKategori;

  List<dynamic> _dataKategori = List();
  void getData() async {
    final respose = await http.get(_baseUrl);
    var listData = jsonDecode(respose.body);
    setState(() {
      _dataKategori = listData;
    });
    print("data : $listData");
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  TextEditingController controllerId = new TextEditingController();
  TextEditingController controllerCategori = new TextEditingController();
  TextEditingController controllerItem = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerProduct = new TextEditingController();
  TextEditingController controllerDescription = new TextEditingController();
  TextEditingController controllerThumbnail = new TextEditingController();

  Future addProduct(File imageFile) async {
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri =
        Uri.parse("https://projectflutter.000webhostapp.com/addProduct.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));

    request.files.add(multipartFile);
    request.fields['id_kategori'] = _valKategori;
    request.fields['nama_produk'] = controllerProduct.text;
    request.fields['deskripsi'] = controllerDescription.text;
    request.fields['harga'] = controllerPrice.text;

    var respond = await request.send();
    if (respond.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
  }

  // void addData() {
  //   var url = "https://projectflutter.000webhostapp.com/addProduct.php";

  //   http.post(url, body: {
  //     // "id_produk": controllerId.text,
  //     "id_kategori": _valKategori,
  //     "nama_produk": controllerProduct.text,
  //     "deskripsi": controllerDescription.text,
  //     "harga": controllerPrice.text,
  //     "thumbnail": _image,
  //   });
  // }

  // void myAlert() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //           title: Text('Please choose media to select'),
  //           content: Container(
  //             height: MediaQuery.of(context).size.height / 6,
  //             child: Column(
  //               children: <Widget>[
  //                 FlatButton(
  //                   onPressed: () {},
  //                   child: Row(
  //                     children: <Widget>[
  //                       Icon(Icons.image),
  //                       Text('From Gallery'),
  //                     ],
  //                   ),
  //                 ),
  //                 FlatButton(
  //                   onPressed: () {},
  //                   child: Row(
  //                     children: <Widget>[
  //                       Icon(Icons.camera),
  //                       Text('From Camera'),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          " ADD PRODUCT",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
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
        child: ListView(
          children: <Widget>[
            Padding(
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
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextField(
                              controller: controllerProduct,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name Product",
                                  hintStyle: TextStyle(color: Colors.white)),
                            )),
                        Container(
                            height: 50,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextField(
                              controller: controllerDescription,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Description",
                                  hintStyle: TextStyle(color: Colors.white)),
                            )),
                        Container(
                            height: 50,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.white))),
                            child: TextField(
                              controller: controllerPrice,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Price",
                                  hintStyle: TextStyle(color: Colors.white)),
                            )),
                        Container(
                          height: 50,
                          padding: EdgeInsets.all(10.0),
                          child: DropdownButton(
                            hint: Text("Select kategori",
                                style: TextStyle(color: Colors.white)),
                            value: _valKategori,
                            items: _dataKategori.map((item) {
                              return DropdownMenuItem(
                                child: Text(item['kategori'],
                                    style: TextStyle(color: Colors.white)),
                                value: item['id_kategori'],
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _valKategori = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Center(child: Text('Choose Image')),
                        ),
                        Container(
                            height: 60,
                            padding: EdgeInsets.only(left: 50.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    FlatButton(
                                      onPressed: getImageGallery,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.image),
                                          Text('From Gallery'),
                                        ],
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: getImageCamera,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.camera),
                                          Text('From Camera'),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 250,
                    width: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ])),
                    child: Center(
                        child: _image == null
                            ? Text('Tidak Ada Gambar yang Dipilih')
                            : Image.file(_image)),
                  ),
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
                            "ADD PRODUCT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onPressed: () {
                          addProduct(_image);
                          Navigator.of(context).pushNamed(LoginPage.tag);
                        },
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
