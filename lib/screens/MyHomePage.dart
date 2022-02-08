import 'package:flutter/material.dart';
import 'package:videoplayer/data/videodata.dart';

import 'Myvideo.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final asset = 'assets/v1.mp4';
  VData myvideos = VData();

  // final listVideos = myvideos.videos;
  @override
  Widget build(BuildContext context) {
    mymethod();
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          Myvideo(asset: 'assets/videos/v1.mp4'),
          Myvideo(asset: 'assets/videos/v2.mp4'),
          Myvideo(asset: 'assets/videos/v3.mp4')
        ],
      ),
    );
  }

  ListView listmethod() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: myvideos.videos.length,
      itemBuilder: (context, index) => Container(
        child: Text('${myvideos.videos[index].asset}'),
      ),
    );
  }

  ListView mymethod() {
    print(myvideos.videos[0].asset);
    return ListView.builder(
      itemCount: myvideos.videos.length,
      itemBuilder: (context, index) => Myvideo(
        asset: myvideos.videos[index].asset,
      ),
    );
  }
}
