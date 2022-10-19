import 'package:flutter/material.dart';
import 'package:musicmodel/common/route/route_arguments.dart';
import 'package:musicmodel/common/sliver_appbar.dart';
import 'package:musicmodel/constants/route_strings.dart';
import 'package:musicmodel/constants/strings.dart';
import 'package:musicmodel/features/circleImage.dart';
import 'package:musicmodel/features/music/models/music_model.dart';
import 'package:musicmodel/features/music/services/music_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Results> data = [];

  @override
  void initState() {
    // getData();
    super.initState();
  }

  Future getData() async {
    var datas = await MusicServices().getData();
    setState(() {
      data = datas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          String.hompageTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          CircleImage(),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [SAppBar()];
              },
              body: FutureBuilder(
                  future: MusicServices().getData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(child: Text("${data.error}"));
                    } else if (data.hasData) {
                      var items = data.data as List<Results>;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: items == null ? 0 : items.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    elevation: 10,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RouteStrings.selectedMusic,
                                            arguments: MusicArguments(
                                                musicModel: items[index]));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image(
                                                  image: NetworkImage(
                                                      items[index]
                                                          .artworkUrl60
                                                          .toString()),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(bottom: 8),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8,
                                                              right: 8),
                                                      child: Text(
                                                        items[index]
                                                            .collectionName
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8, right: 8),
                                                      child: Text(
                                                        items[index]
                                                            .artistName
                                                            .toString(),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: IconButton(
                                                color: Colors.white,
                                                icon: Icon(Icons.favorite),
                                                onPressed: () {},
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// child: FutureBuilder(
//     future: MusicServices().getData(),
//     builder: (context, data) {
//       if (data.hasError) {
//         return Center(child: Text("${data.error}"));
//       } else if (data.hasData) {
//         var items = data.data as List<Results>;
//         return Column(
//           children: [
//             // Container(
//             //     padding: EdgeInsets.only(top: 20),
//             //     height: 60,
//             //     width: 280,
//             //     child: TextField(
//             //       decoration: InputDecoration(
//             //           hintText: "Search...",
//             //           fillColor: Colors.white10,
//             //           filled: true,
//             //           border: OutlineInputBorder(
//             //               borderRadius: BorderRadius.circular(20),
//             //               borderSide: BorderSide.none),
//             //           prefixIcon: Icon(
//             //             Icons.search_outlined,
//             //             color: Colors.white54,
//             //           )),
//             //     )),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                   itemCount: items == null ? 0 : items.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       color: Color.fromARGB(255, 48, 47, 47),
//                       elevation: 10,
//                       margin: EdgeInsets.symmetric(
//                           horizontal: 10, vertical: 6),
//                       child: Container(
//                         padding: EdgeInsets.all(5.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(16),
//                                 child: Image(
//                                   image: NetworkImage(items[index]
//                                       .artworkUrl60
//                                       .toString()),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                                 child: Container(
//                               padding: EdgeInsets.only(bottom: 8),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.center,
//                                 crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 8, right: 8),
//                                     child: Text(
//                                       items[index]
//                                           .collectionName
//                                           .toString(),
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         left: 8, right: 8),
//                                     child: Text(
//                                       items[index].artistName.toString(),
//                                       style:
//                                           TextStyle(color: Colors.white),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ))
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         );
//       } else {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//       // ListView.builder(
//       //   itemCount: data.length,
//       //   itemBuilder: (context, index) {
//       //     return Text(data[index].artistName.toString());
//       //   },
//     }),
