import 'package:flutter/material.dart';
import 'package:flutter_provider/components/custom_toast.dart';
import 'package:flutter_provider/modules/homepage/provider/homepage_slider_provider.dart';
import 'package:flutter_provider/services/utils/route_name.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  double val = 1.0;
  @override
  Widget build(BuildContext context) {
    print("Build Time print");
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Consumer<HomePageSliderProvider>(builder: (context, value, child){
              return Slider(min: 0.0,max:1.0,value:value.value, onChanged: (values){
                value.setValue(values);
              });
            }),
            Consumer<HomePageSliderProvider>(builder: (context, value, child){
              return Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap:(){
                          CustomToast(context: context, message: "Navigating to Favourite Page");
                          Navigator.pushNamed(context, RouteName.favouritePage);
                        },
                        child: Container(
                          height: 100,
                          color: Colors.lightBlue.withOpacity(value.value),
                          child: const Text("Goto Favourite Page"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: Colors.yellow.withOpacity(value.value),
                        child: const Text("Mayank Dubey"),
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
