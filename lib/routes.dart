import 'package:comics/screens/All_bd_screen.dart';
import 'package:comics/screens/bd_detail_screen.dart';
import 'package:comics/screens/coinshop_screen.dart';
import 'package:comics/screens/login_screen.dart';
import 'package:comics/screens/tab_screen.dart';
import 'package:comics/widgets/login/login_form.dart';
import 'package:comics/widgets/login/register_form.dart';
import 'package:comics/widgets/setting.dart';
import 'package:comics/widgets/splash_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (_) => SplashScreen(),
  BdDetailScreen.routeName: (_) => BdDetailScreen(),
  AllBdScreen.routeName: (_) => AllBdScreen(null),
  CoinshopScreen.routeName: (_) => CoinshopScreen(),
  UserTabScreen.routeName: (_) => UserTabScreen(),
  Setting.routeName: (_) => Setting(),
  LoginScreen.routeName: (_) => LoginScreen(),
  RegisterForm.routeName: (_) => RegisterForm(),
  LoginForm.routeName: (_) => LoginForm(),
};
