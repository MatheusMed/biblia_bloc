import 'package:shared_preferences/shared_preferences.dart';

abstract class IStorage {
  Future setValorDouble(String key, dynamic value);
  Future getValorDouble(String key);
  Future setListSaveBiblia(String key, dynamic value);
  Future getListBiblia(String key);
}

class Storage implements IStorage {
  SharedPreferences? prefs;

  @override
  Future getValorDouble(String key) async {
    prefs = await SharedPreferences.getInstance();
    var result = prefs!.getDouble(key);
    return result;
  }

  @override
  Future setValorDouble(String key, value) async {
    prefs = await SharedPreferences.getInstance();
    var result = await prefs!.setDouble(key, value);
    return result;
  }

  @override
  Future getListBiblia(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getStringList(key);
  }

  @override
  Future setListSaveBiblia(String key, dynamic value) async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.setStringList(key, value);
  }
}
