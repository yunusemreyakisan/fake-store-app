class Review {
  int? userid;
  int? rating;
  String? comment;

  Review({this.userid, this.rating, this.comment});

  Review.fromJson(Map<String, dynamic> json) {
    userid = json['user_id'];
    rating = json['rating'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userid;
    data['rating'] = rating;
    data['comment'] = comment;
    return data;
  }
}
