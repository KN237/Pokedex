import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/services/api_services.dart';

class PokemonProvider extends ChangeNotifier {
  final int _limit = 20;
  int _firstItemIndex = 0;
  int _lastItemIndex = 20;
  bool _isLoading = true;
  List<Pokemon> _tmp = [];
  List<Pokemon> _pokemons = [];

  get pokemons => _pokemons;
  get isLoading => _isLoading;
  get limit => _limit;
  get firstItemIndex => _firstItemIndex;
  get lastItemIndex => _lastItemIndex;

  populizePokeList() async {
    _tmp = await ApiServices.getPokemons();
    _pokemons.addAll(_tmp.getRange(_firstItemIndex, _lastItemIndex).toList());
    _isLoading = false;
    notifyListeners();
  }

  changeRange({required int start, required int end}) {
    if (end > 896) {
      _firstItemIndex = 0;
      _lastItemIndex = 20;
    } else {
      _firstItemIndex = start;
      _lastItemIndex = end;
    }
    _pokemons.addAll(_tmp.getRange(_firstItemIndex, _lastItemIndex).toList());
    notifyListeners();
  }
}
