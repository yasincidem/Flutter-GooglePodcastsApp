class LookingFor {
  bool sponsors;
  bool guests;
  bool cohosts;
  bool crossPromotion;

  LookingFor({this.sponsors, this.guests, this.cohosts, this.crossPromotion});

  LookingFor.fromJson(Map<String, dynamic> json) {
    sponsors = json['sponsors'];
    guests = json['guests'];
    cohosts = json['cohosts'];
    crossPromotion = json['cross_promotion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sponsors'] = this.sponsors;
    data['guests'] = this.guests;
    data['cohosts'] = this.cohosts;
    data['cross_promotion'] = this.crossPromotion;
    return data;
  }
}



