import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_to_cart/model/Cart.dart';

import '../constes.dart';

class ChackOut extends StatefulWidget {
  const ChackOut({super.key});

  @override
  State<ChackOut> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<ChackOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarcolor,
          title: const Text("ChackOut"),
          actions: [
             Row(
              children: [
                 const Icon(Icons.price_change),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<Cart>(
                    builder: (context, value, child) {
                      return Text('${value.totalPrice}');
                    },
                  ),
                )
              ],
             )
          ],
        ),
        body: // note => error becouse not define Cart>
            Consumer<Cart>(
          builder: (context, value, child) {
            return ListView.builder(
                itemCount: value.basket.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(value.basket[index].name),
                      trailing: IconButton(
                        onPressed: () {
                          value.delet(value.basket[index]);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ),
                  );
                });
          },
        ));
  }
}
