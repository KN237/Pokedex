import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokemon/models/pokemon.dart';

class ApiServices {
  static const String baseUrl = 'https://pokebuildapi.fr/api/v1/pokemon';

  static getPokemons() async {
    Uri url = Uri.parse(baseUrl);
    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      //print(jsonDecode(res.body));
      List<dynamic> temp = jsonDecode(res.body);

      return temp.map((e) => Pokemon.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
