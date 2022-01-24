import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_hub/model/wallpaper_model.dart';
import 'package:wallpaper_hub/views/image_view.dart';

// ScrollController scrollController = ScrollController(); //scroll
Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "Wall",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Text(
        "Pexels",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}

Widget wallpapersList(
  List<WallpaperModel> wallpapers,
  context,
) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      // controller: scrollController, //scroll
      // scrollDirection: Axis.vertical, //scroll
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      physics: ClampingScrollPhysics(),
      children: wallpapers.map((wallpaper) {
        return Container(
          alignment: Alignment.center,
          // height: MediaQuery.of(context).size.height * 0.2,
          // margin: EdgeInsets.only(left: 10, right: 10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageView(
                      imgUrl: wallpaper.src.portrait,
                    ),
                  ),
                );
              },
              child: Hero(
                tag: wallpaper.src.portrait,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: wallpaper.src.portrait,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
