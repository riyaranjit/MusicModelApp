import 'package:flutter/material.dart';
import 'package:musicmodel/constants/size.dart';
import 'package:musicmodel/features/music/models/music_model.dart';
import 'package:musicmodel/features/music/models/page_manager.dart';
import 'package:musicmodel/features/music/services/music_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class SelectedMusic extends StatefulWidget {
  SelectedMusic({required this.model, Key? key}) : super(key: key);
  Results model;

  @override
  State<SelectedMusic> createState() => _SelectedMusicState();
}

class _SelectedMusicState extends State<SelectedMusic> {
  late final PageManager _pageManager;

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(
        children: [
          // Image(
          //   height: 280,
          //   fit: BoxFit.contain,
          //   width: double.infinity,
          //   image: NetworkImage(
          //     widget.model.artworkUrl100.toString(),
          //   ),
          // ),
          // SizedBox(height: 10),
          // Text(
          //   widget.model.artistName.toString(),
          //   style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.w700,
          //       color: Colors.white54),
          // ),
          // SizedBox(height: 4),
          // Text(
          //   widget.model.trackName.toString(),
          //   style: TextStyle(color: Colors.white54),
          // ),
          Spacer(),
          ValueListenableBuilder<ProgressBarState>(
            valueListenable: _pageManager.progressNotifier,
            builder: (_, value, __) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ProgressBar(
                  progressBarColor: Colors.white,
                  baseBarColor: Colors.white24,
                  thumbColor: Colors.white,
                  thumbRadius: size(context).width * 0.015,
                  progress: value.current,
                  buffered: value.buffered,
                  total: value.total,
                  onSeek: _pageManager.seek,
                ),
              );
            },
          ),
          ValueListenableBuilder<ButtonState>(
            valueListenable: _pageManager.buttonNotifier,
            builder: (_, value, __) {
              switch (value) {
                case ButtonState.loading:
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 32.0,
                    height: 32.0,
                    child: const CircularProgressIndicator(),
                  );
                case ButtonState.paused:
                  return IconButton(
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      iconSize: 32.0,
                      onPressed: () {
                        _pageManager.play;
                        print("Button paused");
                      });
                case ButtonState.playing:
                  return IconButton(
                    icon: const Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                    iconSize: 32.0,
                    onPressed: () {
                      _pageManager.pause;

                      print("Button state playing");
                    },
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
