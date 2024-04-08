import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';

class PokemonInfoPage extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonInfoPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(
          pokemon.name!,
          style: const TextStyle(color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      pokemon.name!,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w400),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Types',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(
                              height: 05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: pokemon.apiTypes!
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            FilterChip(
                                              label: Text(
                                                e.name!,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onSelected: (v) {},
                                              side: const BorderSide(
                                                  color: Colors.transparent),
                                              color: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      Colors.lightBlue
                                                          .withOpacity(0.7)),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Evolutions Suivantes',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(
                              height: 05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: pokemon.apiEvolutions!
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            FilterChip(
                                              label: Text(
                                                e.name!,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onSelected: (v) {},
                                              side: const BorderSide(
                                                  color: Colors.transparent),
                                              color: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      Colors.cyan
                                                          .withOpacity(0.7)),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              'Resistances',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(
                              height: 05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: pokemon.apiResistances!
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            FilterChip(
                                              label: Text(
                                                e.name!,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onSelected: (v) {},
                                              side: const BorderSide(
                                                  color: Colors.transparent),
                                              color: MaterialStateProperty
                                                  .resolveWith((states) =>
                                                      Colors.greenAccent
                                                          .withOpacity(0.7)),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container()
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Hero(
                  tag: pokemon.image!,
                  child: CachedNetworkImage(
                    imageUrl: pokemon.image!,
                    width: 200,
                    height: 200,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Column(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                              color: Colors.white,
                              value: downloadProgress.progress),
                        ),
                      ],
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
