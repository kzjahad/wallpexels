import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_hub/model/wallpaper_model.dart';
import 'package:wallpaper_hub/widgets/widget.dart';

class Categorie extends StatefulWidget {
  const Categorie({Key? key, required this.categorieName}) : super(key: key);

  final String categorieName;
  // Categorie({required this.categorieName})

  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
    List<WallpaperModel> wallpapers = [];

  getSearchWallpapers(String query) async {

    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30"),
        headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      final wallpaper = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaper);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categorieName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: brandName(),
        elevation: 0.0,
        leading: BackButton(color: Colors.black,),
      ),
            body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers, context),
            ],
          ),
        ),
      ),
    );
  }
}
