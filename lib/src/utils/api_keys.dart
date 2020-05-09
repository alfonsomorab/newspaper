
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class ApiKeys {

  String _newsApiKey;

  ApiKeys(){
    initKeys();
  }

  Future<bool> initKeys() async{

    final config = await rootBundle.loadString('assets/secrets.json');
    final keys = json.decode(config);
    this._newsApiKey = keys['news_api_key'];

    return (this._newsApiKey.isNotEmpty);
  }

  get newsApiKey => _newsApiKey;


}