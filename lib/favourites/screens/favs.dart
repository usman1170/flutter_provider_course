import 'package:flutter/material.dart';

class Favouritems extends StatefulWidget {
  const Favouritems({super.key, required this.items});
  final List<int> items;
  @override
  State<Favouritems> createState() => _FavouritemsState();
}

class _FavouritemsState extends State<Favouritems> {
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
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text("item ${widget.items}"),
                      trailing: IconButton(
                        onPressed: () {
                          widget.items.remove(index);
                          setState(() {});
                        },
                        icon: Icon(
                          widget.items.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
