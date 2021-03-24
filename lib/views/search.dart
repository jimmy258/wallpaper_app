import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/widget/widget.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {

final String searchQuery;
Search({this.searchQuery});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WallpaperModel> Wallpapers = new List();
  TextEditingController searchController = new TextEditingController();
  getSearchPhotos(String query)async{
    var response =await http.get("https://wallhaven.cc/api/v1/search?query=$query&per_page=24&page=1");
    //print(response.body.toString());
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
  getSearchPhotos(widget.searchQuery);
    super.initState();
    searchController.text = widget.searchQuery;
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
                            hintText: "Search here",
                            border: InputBorder.none
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: (){
                        getSearchPhotos(searchController.text);
                      },
                      child: Container(
                        child: Icon(
                          Icons.search
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16,),
              wallpaperList(Wallpapers:Wallpapers,context: context)
            ],
          ),
        ),
      ),
    );
  }
}
