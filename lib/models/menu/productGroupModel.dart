class productGroupModel {
  int id;
  String name;
  String localName;
  String imageUrl;
  int displayOrder;
  String? menuDesign;
  int? parentGroupId;

  productGroupModel({
    required this.id,
    required this.name,
    required this.localName,
    required this.imageUrl,
    required this.displayOrder,
    this.menuDesign,
    this.parentGroupId,
  });

  factory productGroupModel.fromJson(Map<String, dynamic> json) {
    return productGroupModel(
      id: json['ID'] as int,
      name: json['NAME'] as String,
      localName: json['LOCALNAME'] as String,
      imageUrl: json['IMAGEURL'] as String,
      displayOrder: json['DISPLAYORDER'] as int,
      menuDesign: json['MENUDESIGN'] as String?,
      parentGroupId: json['PARENTGROUPID'] as int?,
    );
  }
}
