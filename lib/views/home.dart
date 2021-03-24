import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpaper_model.dart';
import 'package:wallpaper_app/views/category.dart';
import 'package:wallpaper_app/views/image_view.dart';
import 'package:wallpaper_app/widget/widget.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoriesModel> categories = new List();
  List<WallpaperModel> Wallpapers = new List();
  TextEditingController searchController = new TextEditingController();
  getTrendingPhotos()async{
    var response =await http.get("https://wallhaven.cc/api/v1/search?sorting=random");
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
    getTrendingPhotos();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "search wallpapers",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => Search(
                          searchQuery:searchController.text,
                        )
                    ));
                  },
                  child: Container(
                      child: Icon(Icons.search)
                  ),
                )
              ],),
            ),
            SizedBox(height: 16,),
            Container(
              height: 80,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) {
                    return CategoriesTitle(
                      title: categories[index].categoriesName,
                      imgUrl: categories[index].imgUrl,
                    );
                  }),
            ),
            wallpaperList(Wallpapers:Wallpapers,context: context)
          ],
         ),
        ),
      ),
    );
  }
}

class CategoriesTitle extends StatelessWidget {
  final String imgUrl,title;
CategoriesTitle({@required this.title,@required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder:(context)=>
                    Category(
                        CategoriesName: title.toLowerCase()
                    )
            ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
                child: Image.network(imgUrl,height: 50,width: 100,fit: BoxFit.cover,)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black26,
            ),
            height: 50,
            width: 100,
            alignment: Alignment.center,
            child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 15),),
          ),
        ],),
      ),
    );
  }
}
