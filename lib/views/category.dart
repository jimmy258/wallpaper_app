import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widget/widget.dart';

 class Category extends StatefulWidget {
   final String CategoriesName;
   Category({this.CategoriesName});

   @override
   _CategoryState createState() => _CategoryState();
 }
 
 class _CategoryState extends State<Category> {
   List<WallpaperModel> Wallpapers = new List();
   getSearchPhotos(String query)async{
     var response =await http.get("https://wallhaven.cc/api/v1/search?query=${widget.CategoriesName}&per_page=24&page=1");
     //log(response.body.toString());
     Map<String,dynamic> jsonData = jsonDecode(response.body);
     jsonData["data"].forEach((element){
       //print(element);
       WallpaperModel wallpaperModel = new WallpaperModel();
       wallpaperModel = WallpaperModel.fromMap(element);
       Wallpapers.add(wallpaperModel);
     });
     setState(() {

     });
   }
   @override
  void initState() {
     getSearchPhotos(widget.CategoriesName);
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: brandName(),
         elevation: 0.0,
       ),
       body: SingleChildScrollView(
         child: Container(
           child: Column(
             children: <Widget>[
               SizedBox(height: 16,),
               wallpaperList(Wallpapers:Wallpapers,context: context)
             ],
           ),
         ),
       ),
       );
   }
 }
 