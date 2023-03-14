class Product {
  late final IDProduct;
  late final NameProduct;
  late final IDBrand;
  late final Description;
  late final List<String> Images;
  late final int ListPrice;
  late final int RetailPrice;

  Product();

  Product.fromJson(Map<String, dynamic> json)
      : IDProduct = json['IDProduct'],
        NameProduct = json['NameProduct'],
        IDBrand = json['IDBrand'],
        Description = json['Description'],
        Images = json['Images'],
        ListPrice = json['ListPrice'],
        RetailPrice = json['RetailPrice'];

  // Map<String, dynamic> toJson() => {
  //       'IDProduct': IDProduct,
  //       'email': email,
  //     };
}
