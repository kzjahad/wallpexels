import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/model/wallpaper_model.dart';
import 'package:wallpaper_hub/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({Key? key, required this.searchQuery}) : super(key: key);
  final String searchQuery;
  // Search({required this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpapers = [];
  int page = 1;

  TextEditingController searchController = new TextEditingController();
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
    getSearchWallpapers(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
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
        automaticallyImplyLeading: true,
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "search wallpaper",
                            hintStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(),
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getSearchWallpapers(searchController.text);
                      },
                      child: Container(
                        child: Icon(Icons.search),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpapers, context),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  loadMoreImages(searchController.text);
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
