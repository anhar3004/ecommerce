class Produk {
  final int id;
  final int idkategori;
  final String nama;
  final String deskripsi;
  final String harga;
  final String thumbnail;

  Produk(
      {this.id,
      this.idkategori,
      this.nama,
      this.deskripsi,
      this.harga,
      this.thumbnail});

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
        id: json['id_produk'] as int,
        idkategori: json['id_kategori'] as int,
        nama: json['nama_produk'] as String,
        deskripsi: json['deskripsi'] as String,
        harga: json['harga'] as String,
        thumbnail: json['thumbnail'] as String);
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id_produk'] = id;
    map['id_kategori'] = idkategori;
    map['nama_produk'] = nama;
    map['deskripsi'] = deskripsi;
    map['harga'] = harga;
    map['thumbnail'] = thumbnail;
    return map;
  }
}
