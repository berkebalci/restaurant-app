class DepartmantModel {
  int id;
  String departmentName;
  

  DepartmantModel({
    required this.id,
    required this.departmentName,
    
  });

  factory DepartmantModel.fromJson(Map<String, dynamic> json) {
    return DepartmantModel(
      id: json['ID'] as int,
      departmentName: json['DEPARTMENTNAME'] as String,);
  }
}
