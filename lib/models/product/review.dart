import 'imageReview.dart';

class Review {
  late int iDReview;
  late int iDProduct;
  late int iDCus;
  late String createdOn;
  late String contentShort;
  late String contentLong;
  late int rating;
  late int isDeleted;
  late List<ImageReview>? images;

  Review(
      {required this.iDReview,
      required this.iDProduct,
      required this.iDCus,
      required this.createdOn,
      required this.contentShort,
      required this.contentLong,
      required this.rating,
      required this.isDeleted,
      this.images});

  Review.fromJson(Map<String, dynamic> json) {
    iDReview = json['IDReview'];
    iDProduct = json['IDProduct'];
    iDCus = json['IDCus'];
    createdOn = json['CreatedOn'];
    contentShort = json['ContentShort'];
    contentLong = json['ContentLong'];
    rating = json['Rating'];
    isDeleted = json['IsDeleted'];
    if (json['Images'] != null) {
      images = <ImageReview>[];
      json['Images'].forEach((v) {
        images?.add(new ImageReview.fromJson(v));
      });
    }
  }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['IDReview'] = this.iDReview;
  //   data['IDProduct'] = this.iDProduct;
  //   data['IDCus'] = this.iDCus;
  //   data['CreatedOn'] = this.createdOn;
  //   data['ContentShort'] = this.contentShort;
  //   data['ContentLong'] = this.contentLong;
  //   data['Rating'] = this.rating;
  //   data['IsDeleted'] = this.isDeleted;
  //   if (this.images != null) {
  //     data['Images'] = this.images.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}
