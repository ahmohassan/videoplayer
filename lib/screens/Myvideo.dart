import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class Myvideo extends StatefulWidget {
  const Myvideo({Key? key, required this.asset}) : super(key: key);

  @override
  _MyvideoState createState() => _MyvideoState();
  final String asset;
}

class _MyvideoState extends State<Myvideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.asset)..value.isPlaying
      ..setLooping(true)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Video Demo',
        home: GestureDetector(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const Center(child: CircularProgressIndicator()),
          onTap: () {
            _controller.value.isPlaying?_controller.pause():_controller.play();
          },
        ));
  }
}



// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class Myvideo extends StatefulWidget {
//   const Myvideo({Key? key}) : super(key: key);

//   @override
//   State<Myvideo> createState() => _MyvideoState();
// }

// class _MyvideoState extends State<Myvideo> {
//   late VideoPlayerController _controller;
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//         'http://161.97.162.167:1936/live/tnnnews/playlist.m3u8')
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: _controller.value.isInitialized
//             ? VideoPlayer(_controller)
//             : const CircularProgressIndicator(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller.value.isPlaying
//                 ? _controller.pause()
//                 : _controller.play();
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }
