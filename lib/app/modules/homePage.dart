import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uas_mobile/app/constants.dart';
import 'package:uas_mobile/app/models/topupmodel.dart';
import 'package:uas_mobile/app/modules/detail.dart';
import 'package:uas_mobile/app/modules/myDrawer.dart';
import 'package:uas_mobile/app/services/TopupService.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  static const TextStyle loading = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: lightGrey,
    fontFamily: 'Poppins',
  );

  static const TextStyle Title = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: BlueAccent,
    fontFamily: 'Poppins',
  );

  static const TextStyle Year = TextStyle(
    fontSize: 12,
    color: Colors.black,
    fontFamily: 'Poppins',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: BlueAccent,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ohMyDrawer(),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<TopupModel>>(
        future: TopupService().fetchFilm(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child:
                    // Text('Error: ${snapshot.error}'),
                    Text(
                  'Server sedang error',
                  style: loading,
                ),
              );
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("All", style: Title),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.75),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailDress(
                                        topup: TopupModel(
                                            Poster:
                                                "${snapshot.data?[index].Poster}",
                                            Title:
                                                "${snapshot.data?[index].Title}",
                                            Deskripsi:
                                                "${snapshot.data?[index].Deskripsi}",
                                            Count:
                                                "${snapshot.data?[index].Count}"),
                                      )));
                        },
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "${snapshot.data![index].Poster}"))),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${snapshot.data![index].Title}",
                              style: Title,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${snapshot.data![index].Count}",
                              style: Year,
                            ),
                          ],
                        ),
                      );
                    },
                  )),
                ]),
              );
            }
          }
        },
      ),
    );
  }
}
