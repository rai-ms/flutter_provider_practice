import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_provider/services/text/apptext.dart';
import 'package:flutter_provider/services/utils/route_name.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_item_provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.cartPage);
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<FavouriteItemProvider>(builder: (context, value, index) {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        if (value.isContainItem(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      leading: Text("${AppText.item}$index"),
                      trailing: IconButton(
                        icon: Icon(value.isContainItem(index)
                            ? Icons.favorite
                            : Icons.favorite_border),
                        onPressed: () {
                          if (value.isContainItem(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                      ));
                },
                itemCount: 100,
              ),
            );
          }),
        ],
      ),
    );
  }
  // onTap
}
