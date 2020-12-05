class Kamus {
  int _id;
  String _kata;
  String _makna;
  String _deskripsi;
  String _kategori;

  Kamus(this._id, this._kata, this._makna, this._deskripsi, this._kategori);

  int get id => _id;
  String get kata => _kata;
  String get makna => _makna;
  String get deskripsi => _deskripsi;
  String get kategori => _kategori;

  // Convert Map object menjadi object
  Kamus.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._kata = map['kata'];
    this._makna = map['makna'];
    this._deskripsi = map['deskripsi'];
    this._kategori = map['kategori'];
  }
}
