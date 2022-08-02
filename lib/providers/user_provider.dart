import 'dart:developer';

import 'package:flutter/material.dart';

import '../database/auth_methods.dart';
import '../database/user_api.dart';
import '../models/app_user.dart';
import '../services/user_local_data.dart';

class UserProvider extends ChangeNotifier {
  List<AppUser> _user = <AppUser>[];

  init() async {
    log('User pro init ');
    if (_user.isNotEmpty) return;
    await _load();

    log('App_Provider.dart: No of Users: ${_user.length}');
  }

  void refresh() async {
    _user.clear();
    _user.addAll(await UserAPI().getAllUsers());
    UserLocalData().storeAppUserData(
        appUser: _user.firstWhere(
      (AppUser element) => element.uid == AuthMethods.uid,
    ));
  }

  void reset() {
    _user.clear();
  }

  List<AppUser> supporters({required String uid}) {
    List<AppUser> supporters = <AppUser>[];
    int index = _indexOf(uid);
    final AppUser tempUser = _user[index];
    if (index >= 0) {
      for (String element in tempUser.supporters!) {
        supporters.add(_user[_indexOf(element)]);
      }
    }
    return supporters;
  }

  List<AppUser> usersFromListOfString({required List<String> uidsList}) {
    List<AppUser> tempList = <AppUser>[];
    for (String element in uidsList) {
      tempList.add(_user[_indexOf(element)]);
    }
    return tempList;
  }

  List<AppUser> supportings({required String uid}) {
    List<AppUser> supporting = <AppUser>[];
    int index = _indexOf(uid);
    final AppUser tempUser = _user[index];
    if (index >= 0) {
      for (String element in tempUser.supporting!) {
        supporting.add(_user[_indexOf(element)]);
      }
    }
    return supporting;
  }

  List<AppUser> get users => _user;

  AppUser user({required String uid}) {
    int index = _indexOf(uid);
    return index < 0 ? _null : _user[index];
  }

  void _fetchData(String uid) async {
    final AppUser? userInfo = await UserAPI().getInfo(uid: uid);
    _user.add(userInfo!);
    notifyListeners();
  }

  int _indexOf(String uid) {
    int index = _user.indexWhere((AppUser element) => element.uid == uid);
    index = _user.indexWhere((AppUser element) => element.uid == uid);
    return index;
  }

  _load() async {
    final List<AppUser> _temp = await UserAPI().getAllUsers();
    _user = _temp;
    log('User pro len: ${_user.length} ');
    UserLocalData().storeAppUserData(
        appUser: _user.firstWhere(
      (AppUser element) => element.uid == AuthMethods.uid,
    ));
    notifyListeners();
  }

  AppUser get _null => AppUser(uid: '-null', displayName: 'null');
}
