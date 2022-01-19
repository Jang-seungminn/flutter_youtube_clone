import 'package:flutter_youtube_clone/src/models/youtube_video_result.dart';
import 'package:flutter_youtube_clone/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult?> youtubeResult = YoutubeVideoResult(
          items: [], totalResults: 0, nextPagetoken: '', resultsPerPage: 0)
      .obs;

  @override
  void onInit() {
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() async {
    YoutubeVideoResult? youtubeVideoResult =
        await YoutubeRepository.to.loadVideos();
    if (youtubeResult != null && youtubeVideoResult?.items != null) {
      youtubeResult(youtubeVideoResult);
    }
  }
}
