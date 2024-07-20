// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_course/favourites/provider/fev_provider.dart';

class FavouriteHomeScreen extends StatefulWidget {
  const FavouriteHomeScreen({super.key});

  @override
  State<FavouriteHomeScreen> createState() => _FavouriteHomeScreenState();
}

class _FavouriteHomeScreenState extends State<FavouriteHomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("top build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Items"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<FavouriteProvider>(
                        builder: (context, value, child) {
                          print("bottom Build");
                          return ListTile(
                            title: Text("item $index"),
                            trailing: IconButton(
                              onPressed: () {
                                if (!value.favItems.contains(index)) {
                                  value.addFavourite(index);
                                } else {
                                  value.removeFavourite(index);
                                }
                              },
                              icon: Icon(
                                value.favItems.contains(index)
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => Favouritems(items: v),
      //         ));
      //   },
      //   child: const Icon(Icons.forward),
      // ),
    );
  }
}
