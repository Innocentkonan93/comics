class Users {
  String idUser;
  String nomUser;
  String emailUser;
  String numUser;
  String paysUser;
  String naissanceUser;
  String pointUser;

  Users(
      {this.idUser,
      this.nomUser,
      this.emailUser,
      this.numUser,
      this.paysUser,
      this.naissanceUser,
      this.pointUser});

  Users.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    nomUser = json['nomUser'];
    emailUser = json['emailUser'];
    numUser = json['numUser'];
    paysUser = json['paysUser'];
    naissanceUser = json['naissanceUser'];
    pointUser = json['pointUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser'] = this.idUser;
    data['nomUser'] = this.nomUser;
    data['emailUser'] = this.emailUser;
    data['numUser'] = this.numUser;
    data['paysUser'] = this.paysUser;
    data['naissanceUser'] = this.naissanceUser;
    data['pointUser'] = this.pointUser;
    return data;
  }
}
