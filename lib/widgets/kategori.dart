class Kategori {
  final int id;
  final String kategori;

  // ignore: non_constant_identifier_names
  Kategori({this.id, this.kategori});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
        id: json['id_kategori'] as int, kategori: json['kategori'] as String);
  }

  String get thumbnail => null;
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id_kategori'] = id;
    map['kategori'] = kategori;
    return map;
  }
}
