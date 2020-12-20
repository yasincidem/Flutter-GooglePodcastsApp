class Extra {
  String twitterHandle;
  String facebookHandle;
  String instagramHandle;
  String wechatHandle;
  String patreonHandle;
  String youtubeUrl;
  String linkedinUrl;
  String spotifyUrl;
  String googleUrl;
  String url1;
  String url2;
  String url3;

  Extra(
      {this.twitterHandle,
        this.facebookHandle,
        this.instagramHandle,
        this.wechatHandle,
        this.patreonHandle,
        this.youtubeUrl,
        this.linkedinUrl,
        this.spotifyUrl,
        this.googleUrl,
        this.url1,
        this.url2,
        this.url3});

  Extra.fromJson(Map<String, dynamic> json) {
    twitterHandle = json['twitter_handle'];
    facebookHandle = json['facebook_handle'];
    instagramHandle = json['instagram_handle'];
    wechatHandle = json['wechat_handle'];
    patreonHandle = json['patreon_handle'];
    youtubeUrl = json['youtube_url'];
    linkedinUrl = json['linkedin_url'];
    spotifyUrl = json['spotify_url'];
    googleUrl = json['google_url'];
    url1 = json['url1'];
    url2 = json['url2'];
    url3 = json['url3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['twitter_handle'] = this.twitterHandle;
    data['facebook_handle'] = this.facebookHandle;
    data['instagram_handle'] = this.instagramHandle;
    data['wechat_handle'] = this.wechatHandle;
    data['patreon_handle'] = this.patreonHandle;
    data['youtube_url'] = this.youtubeUrl;
    data['linkedin_url'] = this.linkedinUrl;
    data['spotify_url'] = this.spotifyUrl;
    data['google_url'] = this.googleUrl;
    data['url1'] = this.url1;
    data['url2'] = this.url2;
    data['url3'] = this.url3;
    return data;
  }
}