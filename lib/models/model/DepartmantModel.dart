import 'package:elektraweb_restaurant/models/model/productGroupModel.dart';

class DepartmantModel {
  int id;
  String departmentName;
  List<ProductGroupModel> productgroupmodelList;

  DepartmantModel(
      {required this.id,
      required this.departmentName,
      required this.productgroupmodelList});

  factory DepartmantModel.fromJson(Map<String, dynamic> json) {
    return DepartmantModel(
        id: json['ID'] as int,
        departmentName: json['DEPARTMENTNAME'] as String,
        productgroupmodelList: []);
  }
}
