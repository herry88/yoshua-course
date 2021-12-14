import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsappsflutter/helper/news.dart';
import 'package:newsappsflutter/helper/widgets.dart';
import 'package:newsappsflutter/models/articlemodel.dart';
import 'package:newsappsflutter/models/category.dart';
import 'package:newsappsflutter/helper/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool loading;
  List<CategoryModel> categories = <CategoryModel>[];
  List<Article> newsList = <Article>[];

  //function getNews
  void getNews() async {
    News news = News();
    await news.getNews();
    newsList = news.news;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    categories = getCategories();
    getNews();
    setState(() {
      loading = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'News Apps',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: loading
            ? Center(
                child: Text('Data Loading...'),
              )
            : SingleChildScrollView(
                child: Container(
                    child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      height: 70,
                      child: ListView.builder(
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                            imageAssetUrl: categories[index].imageAssetUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 16.0,
                      ),
                      child: ListView.builder(
                          itemCount: newsList.length,
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imgUrl: newsList[index].urlToImage.toString(),
                            );
                          }),
                    )
                  ],
                )),
              ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final imageAssetUrl, categoryName;
  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(
          right: 14.0,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: CachedNetworkImage(
                height: 60,
                width: 120,
                imageUrl: imageAssetUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.05),
                    Colors.black.withOpacity(0.25),
                  ],
                ),
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
