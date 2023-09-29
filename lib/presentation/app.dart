
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/models/image_model.dart';
import 'screens.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ImageModel> images =[] ;

  Future<void> loadData() async {
    var data = await json.decode(await rootBundle.loadString("assets/data/data.json"));
    images = List.generate(data.length, (index) => ImageModel.fromJson(data[index]));
    setState(() {});
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WEIT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Images"),
            backgroundColor: Colors.transparent,
          ),
          body: images.isEmpty ? const CircularProgressIndicator() : ImagesGrid(images: images)),
    );
  }
}
