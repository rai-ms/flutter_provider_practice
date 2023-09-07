import 'package:flutter/material.dart';
import 'package:flutter_provider/components/custom_toast.dart';
import 'package:flutter_provider/modules/homepage/provider/homepage_slider_provider.dart';
import 'package:flutter_provider/services/utils/colors/app_colors.dart';
import 'package:flutter_provider/services/utils/text/apptext.dart';
import 'package:flutter_provider/services/utils/route_name.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double val = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<HomePageSliderProvider>(builder: (context, value, child) {
              return Slider(
                  min: 0.0,
                  max: 1.0,
                  value: value.value,
                  onChanged: (values) {
                    value.setValue(values);
                  });
            }),
            Consumer<HomePageSliderProvider>(builder: (context, value, child) {
              return Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          CustomToast(
                              context: context, message: AppText.navToFavPage);
                          Navigator.pushNamed(context, RouteName.favouritePage);
                        },
                        child: Container(
                          height: 100,
                          color: AppColors.lightBlueWithopacity(value.value),
                          child: const Text(AppText.navToFavPage),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.cartPage);
                        },
                        child: Container(
                          height: 100,
                          color: AppColors.yellowWithopacity(value.value),
                          child: const Text(AppText.navToCartPage),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
