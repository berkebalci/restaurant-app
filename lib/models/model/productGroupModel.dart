import 'package:elektraweb_restaurant/models/model/DepartmantModel.dart';
import 'package:elektraweb_restaurant/models/model/productModel.dart';

class ProductGroupModel {
  int id;
  String name;
  String localName;
  String? imageUrl;
  int? parentGroupId;
  List<ProductModel> productmodelList;

  ProductGroupModel(
      {required this.id,
      required this.name,
      required this.localName,
      required this.imageUrl,
      this.parentGroupId,
      required this.productmodelList}); 

  factory ProductGroupModel.fromJson(Map<String, dynamic> json) {
    return ProductGroupModel(
        id: json['ID'] as int,
        name: json['NAME'] as String,
        localName: json['LOCALNAME'] as String,
        imageUrl: json['PHOTOURL'],
        parentGroupId: json['PARENTGROUPID'] as int?,
        productmodelList: []);
  }
}
