class BdLikes {
  String idBd;
  String idUser;

  BdLikes({this.idBd, this.idUser});

  BdLikes.fromJson(Map<String, dynamic> json) {
    idBd = json['idBd'];
    idUser = json['idUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['idBd'] = this.idBd;
    data['idUser'] = this.idUser;
    return data;
  }
}
