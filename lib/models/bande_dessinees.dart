import 'package:flutter/cupertino.dart';

class BandeDessinees with ChangeNotifier {
  String idBd;
  String titleBd;
  String imageBd;
  String nomAuteur;
  String resumeBd;
  String prixBd;
  String categorieBd;
  String likeCount;
  String statutBd;
  String isRating;
  String ratingBd;
  String commentBd;
  String creatAt;
  String idUser;
  String viewCount;
  bool isFavorite = false;

  BandeDessinees({
    this.idBd,
    this.titleBd,
    this.imageBd,
    this.nomAuteur,
    this.resumeBd,
    this.prixBd,
    this.categorieBd,
    this.likeCount,
    this.statutBd,
    this.isRating,
    this.ratingBd,
    this.commentBd,
    this.creatAt,
    this.idUser,
    this.viewCount,
  });

  BandeDessinees.fromJson(Map<String, dynamic> json) {
    idBd = json['idBd'];
    titleBd = json['titleBd'];
    imageBd = json['imageBd'];
    nomAuteur = json['nomAuteur'];
    resumeBd = json['resumeBd'];
    prixBd = json['prixBd'];
    categorieBd = json['categorieBd'];
    likeCount = json['likeCount'];
    statutBd = json['statutBd'];
    isRating = json['isRating'];
    ratingBd = json['ratingBd'];
    commentBd = json['commentBd'];
    creatAt = json['creatAt'];
    idUser = json['idUser'];
    viewCount = json['viewCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['idBd'] = this.idBd;
    data['titleBd'] = this.titleBd;
    data['imageBd'] = this.imageBd;
    data['nomAuteur'] = this.nomAuteur;
    data['resumeBd'] = this.resumeBd;
    data['prixBd'] = this.prixBd;
    data['categorieBd'] = this.categorieBd;
    data['likeCount'] = this.likeCount;
    data['statutBd'] = this.statutBd;
    data['isRating'] = this.isRating;
    data['ratingBd'] = this.ratingBd;
    data['commentBd'] = this.commentBd;
    data['creatAt'] = this.creatAt;
    data['idUser'] = this.idUser;
    data['viewCount'] = this.viewCount;
    return data;
  }

  void favoriteToggle() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
