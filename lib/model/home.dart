import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:news/json/json.dart';
import 'package:news/model/info.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  late var datas;
  late var defaultDatas;
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    //datas = takeApiDatas();
    takeApiDatas().then(
      (value) {
        setState(() {
          datas = value;
        });
      },
    );
    takeDefaultDatas().then((value) {
      setState(() {
        defaultDatas = value;
      });
    });
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    takeApiDatas();
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            title: Text(
              "For you",
              style: TextStyle(fontSize: 24.0, fontFamily: "FontMain"),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none, size: 25),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: TabBarView(
                controller: tabController,
                children: [
                  Image.network(
                    defaultDatas[0]['image'],
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    defaultDatas[1]['image'],
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    defaultDatas[2]['image'],
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    defaultDatas[3]['image'],
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    defaultDatas[4]['image'],
                    fit: BoxFit.cover,
                  )
                ],
              ),
              collapseMode: CollapseMode.none,
              title: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment(0.0, 0.2),
                    end: Alignment(0.0, -0.9),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        controller: tabController,
                        indicator: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        indicatorPadding:
                            EdgeInsets.only(bottom: 10.0, top: 10.0),
                        isScrollable: true,
                        tabs: [
                          Tab(text: defaultDatas[0]['category']),
                          Tab(text: defaultDatas[1]['category']),
                          Tab(text: defaultDatas[2]['category']),
                          Tab(text: defaultDatas[3]['category']),
                          Tab(text: defaultDatas[4]['category']),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  defaultDatas[0]['title'],
                                  style: TextStyle(
                                      fontSize: 30.0, fontFamily: "FontMain"),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  defaultDatas[0]['description'],
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontFamily: "FontMain",
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  defaultDatas[1]['title'],
                                  style: TextStyle(
                                      fontSize: 30.0, fontFamily: "FontMain"),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  defaultDatas[1]['description'],
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontFamily: "FontMain",
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  defaultDatas[2]['title'],
                                  style: TextStyle(
                                      fontSize: 30.0, fontFamily: "FontMain"),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  defaultDatas[2]['description'],
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontFamily: "FontMain",
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  defaultDatas[3]['title'],
                                  style: TextStyle(
                                      fontSize: 30.0, fontFamily: "FontMain"),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  defaultDatas[3]['description'],
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontFamily: "FontMain",
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  defaultDatas[4]['title'],
                                  style: TextStyle(
                                      fontSize: 30.0, fontFamily: "FontMain"),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  defaultDatas[4]['description'],
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    fontFamily: "FontMain",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              titlePadding: EdgeInsets.only(left: 0.0),
            ),
          ),
          SliverStaggeredGrid.countBuilder(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            itemCount: 20,
            crossAxisCount: 2,
            staggeredTileBuilder: (index) =>
                StaggeredTile.count(1, index.isEven ? 1.2 : 1.8),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => InfoNews(
                        index,
                        datas[index].author,
                        datas[index].title,
                        datas[index].description,
                        datas[index].url,
                        datas[index].urlToImage,
                        datas[index].publishedAt,
                        datas[index].content,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(
                        image: NetworkImage(datas[index].urlToImage),
                        fit: BoxFit.cover,
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.blueGrey, Colors.transparent],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.white, Colors.transparent],
                            begin: Alignment(0.0, 0.8),
                            end: Alignment(0.0, 0.5),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.only(right: 10.0),
                              title: Text(
                                datas[index].author,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              datas[index].title,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  takeApiDatas() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2021-07-08&to=2021-07-08&sortBy=popularity&apiKey=f807dba43bf441ea9b09cc73520bac21"));
    Map mapping = json.decode(response.body);
    if (response.statusCode == 200) {
      return (mapping['articles'] as List)
          .map((e) => News.fromJson(e))
          .toList();
    } else {
      throw Exception("Error!!!");
    }
  }

  takeDefaultDatas() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString("assets/json/data.json");
    List listData = json.decode(jsonData.toString());
    return listData;
  }
}
