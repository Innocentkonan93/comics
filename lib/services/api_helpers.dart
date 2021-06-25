import 'dart:convert';
import 'dart:io';
import 'package:comics/models/HTTPResponse.dart';
import 'package:comics/models/bande_dessinees.dart';
import 'package:comics/models/bdLikes.dart';
import 'package:comics/models/categories.dart';
import 'package:comics/models/users.dart';
import 'package:http/http.dart';

class AllBandeDessinnees {
  static Future<HTTPResponse<List<BandeDessinees>>> getBandeDessinees() async {
    String url = 'http://192.168.64.2/Projects/ncomic/dataHandling/getBd.php';
    try {
      var response = await get(url);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<BandeDessinees> _bandeDessinee = [];
        print('Bd établie');
        body.forEach((e) {
          BandeDessinees bandeDessinee = BandeDessinees.fromJson(e);
          _bandeDessinee.add(bandeDessinee);
        });
        return HTTPResponse(
          true,
          _bandeDessinee,
          responseCode: response.statusCode,
        );
      } else {
        print('erreur connexion');
        return HTTPResponse(
          false,
          null,
          message: 'Erreur du server',
          responseCode: response.statusCode,
        );
      }
    } on SocketException {
      return HTTPResponse(false, null,
          message: 'Vérifier votre connexion internet');
    } on FormatException {
      return HTTPResponse(false, null,
          message: 'Mauvaise réponse du server, réessayez');
    } catch (e) {
      return HTTPResponse(false, null,
          message: 'Une erreur est survenue, réessayez');
    }
  }
}

class AllCategories {
  static Future<HTTPResponse<List<Categories>>> getCategory() async {
    String url =
        'http://192.168.64.2/Projects/ncomic/dataHandling/getCategory.php';
    try {
      var response = await get(url);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Categories> _categories = [];
        print('Categories établie');
        body.forEach((e) {
          Categories categories = Categories.fromJson(e);
          _categories.add(categories);
        });
        return HTTPResponse(
          true,
          _categories,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message: 'Erreur du server',
          responseCode: response.statusCode,
        );
      }
    } on SocketException {
      return HTTPResponse(false, null,
          message: 'Vérifier votre connexion internet');
    } on FormatException {
      return HTTPResponse(false, null,
          message: 'Mauvaise réponse du server, réessayez');
    } catch (e) {
      return HTTPResponse(false, null,
          message: 'Une erreur est survenue, réessayez');
    }
  }
}

class AllLikes {
  static Future<HTTPResponse<List<BdLikes>>> getAllLikes() async {
    String url =
        'http://192.168.64.2/Projects/ncomic/dataHandling/getAllLikephp.php';
    try {
      var response = await get(url);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<BdLikes> _bdLikes = [];
        print('Bd Likes');
        body.forEach((e) {
          BdLikes bdLikes = BdLikes.fromJson(e);
          _bdLikes.add(bdLikes);
        });
        return HTTPResponse(
          true,
          _bdLikes,
          responseCode: response.statusCode,
        );
      } else {
        print('Bd No Likes');
        return HTTPResponse(
          false,
          null,
          message: 'Erreur du server',
          responseCode: response.statusCode,
        );
      }
    } on SocketException {
      return HTTPResponse(false, null,
          message: 'Vérifier votre connexion internet');
    } on FormatException {
      return HTTPResponse(false, null,
          message: 'Mauvaise réponse du server, réessayez');
    } catch (e) {
      return HTTPResponse(false, null,
          message: 'Une erreur est survenue, réessayez');
    }
  }
}

class AllUser {
  static Future<HTTPResponse<List<Users>>> getUsers(String idUser) async {
    String url =
        'http://192.168.64.2/Projects/ncomic/dataHandling/getAllUser.php?idUser=$idUser';
    try {
      var response = await get(url);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Users> _users = [];
        print('User infos');
        body.forEach((e) {
          Users users = Users.fromJson(e);
          _users.add(users);
        });
        return HTTPResponse(
          true,
          _users,
          responseCode: response.statusCode,
        );
      } else {
        return HTTPResponse(
          false,
          null,
          message: 'Erreur du server',
          responseCode: response.statusCode,
        );
      }
    } on SocketException {
      return HTTPResponse(false, null,
          message: 'Vérifier votre connexion internet');
    } on FormatException {
      return HTTPResponse(false, null,
          message: 'Mauvaise réponse du server, réessayez');
    } catch (e) {
      return HTTPResponse(false, null,
          message: 'Une erreur est survenue, réessayez');
    }
  }
}
