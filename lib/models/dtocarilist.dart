class Dtocarilist {
  int cariId;
  String cariunvani;
  String katad;
  num bakiye;

  Dtocarilist(this.cariId, this.cariunvani, this.katad, this.bakiye);

  Dtocarilist.fromMap(Map<String, dynamic> map) {
    // this.id = map['id'];
    this.cariId = map['cariId'];
    this.cariunvani = map['cariunvani'];
    this.katad = map['katad'];
    this.bakiye = map['bakiye'];
  }
}
