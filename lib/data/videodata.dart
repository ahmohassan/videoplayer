import 'package:videoplayer/model/videomodel.dart';

class VData {
  final List<Videos> videos = [
    Videos(asset: '/assets/videos/v1.mp4'),
    Videos(asset: '/assets/videos/v2.mp4'),
    Videos(asset: '/assets/videos/v3.mp4'),
  ];
  void getlist(int index) {
    videos[index].asset;
  }
}
