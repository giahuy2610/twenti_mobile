import 'package:json_annotation/json_annotation.dart';
import 'package:twenti_mobile/models/product/product.dart';

@JsonSerializable()
class Collection {
  late String nameCollection;
  late String? routePath;
  late int iDCollection;
  late String createdOn;
  late String? description;
  late String? logoImagePath;
  late String? wallPaperPath;
  late String startOn;
  late String endOn;
  late String? coverImagePath;
  late List<Product> products;

  Collection(
      {required this.iDCollection,
      required this.nameCollection,
      this.routePath,
      required this.createdOn,
      this.description,
      this.logoImagePath,
      this.wallPaperPath,
      required this.startOn,
      required this.endOn,
      this.coverImagePath,
      required this.products});

  factory Collection.fromJson(Map<String, dynamic> json) {
    var a = <Product>[];
    for (var i in json['Products'])
      // var b = json.decode(json['Products']);
      a.add(Product.fromJson(i));
    print(a);
    return Collection(
        iDCollection: json['IDCollection'],
        nameCollection: json['NameCollection'],
        routePath: json['RoutePath'],
        createdOn: json['CreatedOn'],
        description: json['Description'],
        logoImagePath: json['LogoImagePath'],
        wallPaperPath: json['WallPaperPath'],
        startOn: json['StartOn'],
        endOn: json['EndOn'],
        coverImagePath: json['CoverImagePath'],
        products: a);
  }

  // factory Collection.fromJson(Map<String, dynamic> json) =>
  //     Collection(quantity: json["Quantity"], product: Product.fromJson(json));
}
