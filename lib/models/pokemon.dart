class Pokemon {
  int? id;
  int? pokedexId;
  String? name;
  String? image;
  String? sprite;
  String? slug;
  List<ApiTypes>? apiTypes;
  int? apiGeneration;
  List<ApiEvolutions>? apiEvolutions;
  List<ApiResistances>? apiResistances;

  Pokemon(
      {this.id,
      this.pokedexId,
      this.name,
      this.image,
      this.sprite,
      this.slug,
      this.apiTypes,
      this.apiGeneration,
      this.apiEvolutions,
      this.apiResistances});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pokedexId = json['pokedexId'];
    name = json['name'];
    image = json['image'];
    sprite = json['sprite'];
    slug = json['slug'];
    if (json['apiTypes'] != null) {
      apiTypes = <ApiTypes>[];
      json['apiTypes'].forEach((v) {
        apiTypes!.add(ApiTypes.fromJson(v));
      });
    }

    if (json['apiEvolutions'] != null) {
      apiEvolutions = <ApiEvolutions>[];
      json['apiEvolutions'].forEach((v) {
        apiEvolutions!.add(ApiEvolutions.fromJson(v));
      });
    }

    if (json['apiResistances'] != null) {
      apiResistances = <ApiResistances>[];
      json['apiResistances'].forEach((v) {
        apiResistances!.add(ApiResistances.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['pokedexId'] = pokedexId;
    data['name'] = name;
    data['image'] = image;
    data['sprite'] = sprite;
    data['slug'] = slug;
    if (apiTypes != null) {
      data['apiTypes'] = apiTypes!.map((v) => v.toJson()).toList();
    }
    data['apiGeneration'] = apiGeneration;

    if (apiEvolutions != null) {
      data['apiEvolutions'] = apiEvolutions!.map((v) => v.toJson()).toList();
    }

    if (apiResistances != null) {
      data['apiResistances'] = apiResistances!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class ApiTypes {
  String? name;
  String? image;

  ApiTypes({this.name, this.image});

  ApiTypes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class ApiEvolutions {
  String? name;
  int? pokedexId;

  ApiEvolutions({this.name, this.pokedexId});

  ApiEvolutions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pokedexId = json['pokedexId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['pokedexId'] = pokedexId;
    return data;
  }
}

class ApiResistances {
  String? name;
  ApiResistances({this.name});

  ApiResistances.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    return data;
  }
}
