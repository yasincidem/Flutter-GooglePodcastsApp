import 'Extra.dart';
import 'LookingFor.dart';

class PodcastDetail {
  String id;
  String title;
  String publisher;
  String image;
  String thumbnail;
  String listennotesUrl;
  String listenScore;
  String listenScoreGlobalRank;
  int totalEpisodes;
  bool explicitContent;
  String description;
  int itunesId;
  String rss;
  int latestPubDateMs;
  int earliestPubDateMs;
  String language;
  String country;
  String website;
  Extra extra;
  bool isClaimed;
  String email;
  String type;
  LookingFor lookingFor;
  List<int> genreIds;

  PodcastDetail(
      {this.id,
        this.title,
        this.publisher,
        this.image,
        this.thumbnail,
        this.listennotesUrl,
        this.listenScore,
        this.listenScoreGlobalRank,
        this.totalEpisodes,
        this.explicitContent,
        this.description,
        this.itunesId,
        this.rss,
        this.latestPubDateMs,
        this.earliestPubDateMs,
        this.language,
        this.country,
        this.website,
        this.extra,
        this.isClaimed,
        this.email,
        this.type,
        this.lookingFor,
        this.genreIds});

  PodcastDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    publisher = json['publisher'];
    image = json['image'];
    thumbnail = json['thumbnail'];
    listennotesUrl = json['listennotes_url'];
    listenScore = json['listen_score'];
    listenScoreGlobalRank = json['listen_score_global_rank'];
    totalEpisodes = json['total_episodes'];
    explicitContent = json['explicit_content'];
    description = json['description'];
    itunesId = json['itunes_id'];
    rss = json['rss'];
    latestPubDateMs = json['latest_pub_date_ms'];
    earliestPubDateMs = json['earliest_pub_date_ms'];
    language = json['language'];
    country = json['country'];
    website = json['website'];
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
    isClaimed = json['is_claimed'];
    email = json['email'];
    type = json['type'];
    lookingFor = json['looking_for'] != null
        ? new LookingFor.fromJson(json['looking_for'])
        : null;
    genreIds = json['genre_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['publisher'] = this.publisher;
    data['image'] = this.image;
    data['thumbnail'] = this.thumbnail;
    data['listennotes_url'] = this.listennotesUrl;
    data['listen_score'] = this.listenScore;
    data['listen_score_global_rank'] = this.listenScoreGlobalRank;
    data['total_episodes'] = this.totalEpisodes;
    data['explicit_content'] = this.explicitContent;
    data['description'] = this.description;
    data['itunes_id'] = this.itunesId;
    data['rss'] = this.rss;
    data['latest_pub_date_ms'] = this.latestPubDateMs;
    data['earliest_pub_date_ms'] = this.earliestPubDateMs;
    data['language'] = this.language;
    data['country'] = this.country;
    data['website'] = this.website;
    if (this.extra != null) {
      data['extra'] = this.extra.toJson();
    }
    data['is_claimed'] = this.isClaimed;
    data['email'] = this.email;
    data['type'] = this.type;
    if (this.lookingFor != null) {
      data['looking_for'] = this.lookingFor.toJson();
    }
    data['genre_ids'] = this.genreIds;
    return data;
  }
}