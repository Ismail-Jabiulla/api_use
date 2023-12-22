import 'dart:convert';
import 'package:api_use/service/api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/model_newspaper.dart';

class HomeScreenPage01 extends StatefulWidget {
  const HomeScreenPage01({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage01> createState() => _HomeScreenPage01State();
}

class _HomeScreenPage01State extends State<HomeScreenPage01> {
  Api_service apiService = Api_service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Rest API'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: FutureBuilder(
        future: apiService.getAllNews(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<NewsModel>? articlesList = snapshot.data as List<NewsModel>?;

            if (articlesList == null || articlesList.isEmpty) {
              return Center(child: Text('No data available'));
            }

            return ListView.builder(
              itemCount: articlesList.length,
              itemBuilder: (context, index) {
                NewsModel newsModel = articlesList[index];
                return Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                         // blurRadius: 5,
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(16),
                            child: CachedNetworkImage(
                              height: 200,
                              width: 328,
                              fit: BoxFit.cover,
                              imageUrl: newsModel.urlToImage.toString(),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              newsModel.title.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              newsModel.description.toString(),
                              style: TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Text(newsModel.publishedAt.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
