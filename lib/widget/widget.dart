import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/image_view.dart';

Widget brandName(){
  return RichText(
    text: TextSpan(
      text: 'Sewar',
      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(text: 'Sewar', style: TextStyle(color: Colors.blue)),
      ],
    ),
  );
}
Widget wallpaperList({List<WallpaperModel> Wallpapers,context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child:GridView.count(
      shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
       childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: Wallpapers.map((wallpaper){
        return GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageView(
                          imgUrl: wallpaper.thumbs.original,
                        )
                    ));
              },
              child: Hero(
                tag: wallpaper.thumbs.original,
                child: Container(
                  child:ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(wallpaper.thumbs.original,fit: BoxFit.cover,)
                  ),
                ),
              ),
            ),
        );
      }).toList(),
    ) ,
  );
}