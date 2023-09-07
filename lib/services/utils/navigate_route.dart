import 'package:flutter/material.dart';
import 'package:flutter_provider/modules/cart/view/cartpage.dart';
import 'package:flutter_provider/modules/favourite/views/favourite_page.dart';
import 'package:flutter_provider/services/utils/route_name.dart';

import '../../modules/homepage/views/homepage.dart';

class NavigateRoute
{
  static Route<dynamic> generateRoute(RouteSettings routeSettings)
  {
    switch (routeSettings.name)
    {
      case RouteName.homepage:
        return MaterialPageRoute(builder: (context) => MyHomePage(title: ""));
      case RouteName.favouritePage:
        return MaterialPageRoute(builder: (context) => FavouritePage());
      case RouteName.cartPage:
        return MaterialPageRoute(builder: (context) => const CartPage());
      default:
        return MaterialPageRoute(builder: (context)=> Scaffold(
          appBar: AppBar(),
          body: const Text("Error 404"),
        )
      );
    }
  }
}