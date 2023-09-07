import 'package:flutter/material.dart';
import 'package:flutter_provider/modules/favourite/provider/favourite_item_provider.dart';
import 'package:flutter_provider/services/utils/text/apptext.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteItemProvider>(
                builder: (context, value, index) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text("${AppText.itemNo}${value.itemAt(index) + 1}"),
                        trailing: IconButton(
                        onPressed: () {
                          value.removeItem(value.itemAt(index));
                        },
                        icon: const Icon(Icons.favorite),
                      ),
                      onTap: () {
                        value.removeItem(value.itemAt(index));
                    },
                  );
                },
                itemCount: value.getItemCount(),
              );
            }),
          )
        ],
      ),
    );
  }
}
