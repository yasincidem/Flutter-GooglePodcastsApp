import 'Podcasts.dart';

class Podcast {
  int id;
  String name;
  int parentId;
  List<PodcastDetail> podcasts;
  int total;
  bool hasNext;
  bool hasPrevious;
  int pageNumber;
  int previousPageNumber;
  int nextPageNumber;
  String listennotesUrl;

  Podcast(
      {this.id,
        this.name,
        this.parentId,
        this.podcasts,
        this.total,
        this.hasNext,
        this.hasPrevious,
        this.pageNumber,
        this.previousPageNumber,
        this.nextPageNumber,
        this.listennotesUrl});

  Podcast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    if (json['podcasts'] != null) {
      // ignore: deprecated_member_use
      podcasts = new List<PodcastDetail>();
      json['podcasts'].forEach((v) {
        podcasts.add(new PodcastDetail.fromJson(v));
      });
    }
    total = json['total'];
    hasNext = json['has_next'];
    hasPrevious = json['has_previous'];
    pageNumber = json['page_number'];
    previousPageNumber = json['previous_page_number'];
    nextPageNumber = json['next_page_number'];
    listennotesUrl = json['listennotes_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parent_id'] = this.parentId;
    if (this.podcasts != null) {
      data['podcasts'] = this.podcasts.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['has_next'] = this.hasNext;
    data['has_previous'] = this.hasPrevious;
    data['page_number'] = this.pageNumber;
    data['previous_page_number'] = this.previousPageNumber;
    data['next_page_number'] = this.nextPageNumber;
    data['listennotes_url'] = this.listennotesUrl;
    return data;
  }
}