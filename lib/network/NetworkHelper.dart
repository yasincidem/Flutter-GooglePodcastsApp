import 'package:flutter_app/models/bestpodcasts/Podcast.dart';
import 'package:flutter_app/models/playlist/playlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const podcastsUrl = "https://listen-api.listennotes.com/api/v2/best_podcasts?page=1&region=us&safe_mode=0";
const playlistUrl = "https://listen-api.listennotes.com/api/v2/playlists/kr3-ta28cJu?type=episode_list&last_timestamp_ms=0&sort=recent_added_first";

Map<String, String> get headers => {
  'X-ListenAPI-Key': '693b1ec7d6a8489bbf99a16859b7c5eb'
};

class GetPodcasts {
  Future<Podcast> getPodcasts() async {
    final res = await http.get(podcastsUrl, headers: headers);

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      return Podcast.fromJson(json);
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class GetPlaylist {
  Future<List<Items>> getPlaylist() async {
    final res = await http.get(playlistUrl, headers: headers);

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);

      List data = json['items'];
      var list = data.map((i) => new Items.fromJson(i)).toList();
      return list;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}