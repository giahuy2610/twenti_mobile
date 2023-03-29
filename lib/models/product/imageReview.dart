class ImageReview {
  late int iDReviewImage;
  late int iDReview;
  late String path;

  ImageReview(
      {required this.iDReviewImage,
      required this.iDReview,
      required this.path});

  ImageReview.fromJson(Map<String, dynamic> json) {
    iDReviewImage = json['IDReviewImage'];
    iDReview = json['IDReview'];
    path = json['Path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IDReviewImage'] = this.iDReviewImage;
    data['IDReview'] = this.iDReview;
    data['Path'] = this.path;
    return data;
  }
}
