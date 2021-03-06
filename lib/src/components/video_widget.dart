import 'package:flutter/material.dart';
import 'package:flutter_youtube_clone/src/models/video.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatelessWidget {
  final Video video;
  const VideoWidget({Key? key, required this.video}) : super(key: key);

  Widget _thumbnail() {
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
      child: Image.network(video.snippet.thumbnails.medium.url, fit: BoxFit.fitWidth,),
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network(
                    'https://yt3.ggpht.com/ytc/AKedOLQagIEl2WOUacXZ8WlCPvApoIouP9sNGkMIDVdQ=s176-c-k-c0x00ffffff-no-rj-mo')
                .image,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      video.snippet.title,
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: Icon(Icons.more_vert, size: 18),
                    onPressed: () {},
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    video.snippet.channelTitle,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.8)),
                  ),
                  Text(' · '),
                  Text(
                    '조회수',
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.6)),
                  ),
                  Text(' · '),
                  Text(
                    DateFormat('yyyy-MM-dd').format(video.snippet.publishTime)
                    ,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailInfo(),
        ],
      ),
    );
  }
}
