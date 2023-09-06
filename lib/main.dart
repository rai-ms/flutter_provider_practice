import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/services/utils/navigate_route.dart';
import 'package:flutter_provider/services/utils/route_name.dart';
import 'package:provider/provider.dart';

import 'modules/favourite/provider/favourite_item_provider.dart';
import 'modules/homepage/provider/homepage_slider_provider.dart';

void main()
{
  runApp( const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_)=>HomePageSliderProvider(),
      ),
      ChangeNotifierProvider(
          create: (_)=> FavouriteItemProvider(),
      ),
    ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.homepage,
        onGenerateRoute: NavigateRoute.generateRoute,
      ),
    );
  }
}


