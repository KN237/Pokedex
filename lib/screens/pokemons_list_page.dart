import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/providers/pokemons_provider.dart';
import 'package:pokemon/screens/pokemon_info_page.dart';
import 'package:provider/provider.dart';

class PokemonsListPage extends StatefulWidget {
  const PokemonsListPage({super.key});

  @override
  State<PokemonsListPage> createState() => _PokemonsListPageState();
}

class _PokemonsListPageState extends State<PokemonsListPage> {
  ScrollController scrollController = ScrollController();
  List<Pokemon> datas = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokemonProvider>(context, listen: false).populizePokeList();
    });

    scrollController = ScrollController()..addListener(scrollListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokedex',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Provider.of<PokemonProvider>(context).isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<PokemonProvider>(builder: (context, data, w) {
              return GridView.builder(
                controller: scrollController,
                itemCount: data.pokemons.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PokemonInfoPage(pokemon: data.pokemons[index]),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Hero(
                            tag: data.pokemons[index].image!,
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CachedNetworkImage(
                                imageUrl: data.pokemons[index].image!,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Column(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                  ],
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                          Text(
                            data.pokemons[index].name!,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              );
            }),
    );
  }

  scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      Provider.of<PokemonProvider>(context, listen: false).changeRange(
          start: Provider.of<PokemonProvider>(context, listen: false)
              .lastItemIndex,
          end: Provider.of<PokemonProvider>(context, listen: false)
                  .lastItemIndex +
              Provider.of<PokemonProvider>(context, listen: false).limit);
      print('Nous sommes arrivés à la fin');
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
