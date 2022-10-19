import 'package:flutter/material.dart';
import 'package:musicmodel/features/music/models/music_model.dart';
import 'package:musicmodel/features/music/services/music_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:musicmodel/features/page_manager.dart';

class SelectedMusic extends StatefulWidget {
  SelectedMusic({required this.model,Key? key}) : super(key: key);
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(
        children: [
           Image(
            height: 280,
            fit: BoxFit.contain,
            width: double.infinity,
            image: NetworkImage(
               widget.model.artworkUrl100.toString(),
          ),),
           SizedBox(height: 10),
          Text(
            widget.model.artistName.toString(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white54),
          ),
          SizedBox(height: 4),
           Text(
            widget.model.artistName.toString(),
           
            style: TextStyle(color: Colors.white54),
          ),
          ValueListenableBuilder<ProgressBarState>(
            valueListenable: _pageManager.progressNotifier,
            builder: (_, value, __) {
              return ProgressBar(
                progress: value.current,
                buffered: value.buffered,
                total: value.total,
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            iconSize: 32.0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
