import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  int page = 1;

  getSearchWallpapers(String query) async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=60"),
        headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      final wallpaper = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaper);
    });
    setState(() {});
  }

  loadMoreImages(String query) async {
    setState(() {
      page = page + 1;
    });
    String url =
        "https://api.pexels.com/v1/search?query=$query&per_page=60&page=" +
            page.toString();
    var response =
        await http.get(Uri.parse(url), headers: {"Authorization": apiKey});
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      jsonData["photos"].forEach((element) {
        final wallpaper = WallpaperModel.fromMap(element);
        wallpapers.add(wallpaper);
      });
      setState(() {});
    } else {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text("No more Images"),
          action: SnackBarAction(
              label: 'Okay', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    }
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
        title: Padding(
          padding: const EdgeInsets.only(right: 55),
          child: brandName(),
        ),
        elevation: 0.0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers, context),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  loadMoreImages(widget.categorieName);
                },
                child: Container(
                  height: 30,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Load More Images'.toUpperCase(),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 4)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
