import 'package:elektraweb_restaurant/models/menu/productGroupModel.dart';

class ProductModel {
  int id;
  String name;
  String localName;
  double price;
  String curCode;
  String? preparePlace;
  int productGroupId;
  String imageUrl;
  bool halfPortion;
  bool includedInAI;

  bool isPackage;
  String? displayInfo;
  String? localDisplayInfo;
  bool? allergic;
  bool? vegetarian;
  bool? alcohol;
  bool? pork;

  ProductModel({
    required this.id,
    required this.name,
    required this.localName,
    required this.price,
    required this.curCode,
    this.preparePlace,
    required this.productGroupId,
    required this.imageUrl,
    required this.halfPortion,
    required this.includedInAI,
    required this.isPackage,
    required this.displayInfo,
    required this.localDisplayInfo,
    required this.allergic,
    required this.vegetarian,
    required this.alcohol,
    required this.pork,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['ID'] as int,
      name: json['NAME'] as String,
      localName: json['LOCALNAME'] as String,
      price: double.parse(json['PRICE'] as String),
      curCode: json['CURCODE'] as String,
      preparePlace: json['PREPAREPLACE'] as String?,
      productGroupId: json['PRODUCTGROUPID'] as int,
      imageUrl: json['PHOTOURL'] as String,
      halfPortion: json['HALFPORTION'] as bool,
      includedInAI: json['INCLUDEDIN_AI'] as bool,
      isPackage: json['ISPACKAGE'] as bool,
      displayInfo: json['DISPLAYINFO'] as String?,
      localDisplayInfo: json['LOCALDISPLAYINFO'] as String?,
      allergic: json['ALLERGIC'] as bool?,
      vegetarian: json['VEGETARIAN'] as bool?,
      alcohol: json['ALCOHOL'] as bool?,
      pork: json['PORK'] as bool?,
    );
  }
}
