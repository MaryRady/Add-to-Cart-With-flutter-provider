import 'package:add_to_cart/model/Cart.dart';
import 'package:add_to_cart/model/ChackOut.dart';
import 'package:add_to_cart/model/Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constes.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  List<Item> items = [
    Item(name: 'Croissant', price: 125),
    Item(name: 'Asparagus', price: 1255),
    Item(name: 'Burrito', price: 55),
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarcolor,
        title: const Text(
          'Home ',
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ChackOut();
                    }));
                  },
                  icon: const Icon(Icons.add_shopping_cart)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<Cart>(
                  builder: (context, value, child) {
                    return Text('${value.count}');
                  },
                ),
              )
            ],
          )
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: ((context, index) {
            return Consumer<Cart>(builder: (context, value, child) {
              return Card(
                child: ListTile(
                    // bta5d title => w dh astring
                    // w ana m7tage ageb kol asm mn el list
                    title: Text("${items[index].name}"),
                    trailing: IconButton(
                        onPressed: () {
                          value.add(items[index]);
                        },
                        icon: const Icon(Icons.add))),
              );
            });
          })),
    );
  }
}
