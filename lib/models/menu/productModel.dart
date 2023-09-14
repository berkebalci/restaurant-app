class ProductModel {
  final int id;
  final String name;
  final String localName;
  final String price;
  final String curCode;
  final String? preparePlace;
  final int productGroupId;
  final String imageUrl;
  final bool? halfPortion;
  final bool? includedInAi;
  final bool? isPackage;
  final String? displayInfo;
  final String? localDisplayInfo;
  final bool? allergic;
  final bool? vegetarian;
  final bool? alcohol;
  final bool? pork;
  final bool? gluten;
  final int? preperationTime;
  final String? allergens;
  final double? calories;
  final double? cholesterol;
  final double? sodium;
  final double? carbonHydrates;
  final double? protein;
  final double? fat;
  final double? fiber;

  ProductModel({
    required this.id,
    required this.name,
    required this.localName,
    required this.price,
    required this.curCode,
    required this.preparePlace,
    required this.productGroupId,
    required this.imageUrl,
    required this.halfPortion,
    required this.includedInAi,
    required this.isPackage,
    required this.displayInfo,
    required this.localDisplayInfo,
    required this.allergic,
    required this.vegetarian,
    required this.alcohol,
    required this.pork,
    required this.gluten,
    required this.preperationTime,
    required this.allergens,
    required this.calories,
    required this.cholesterol,
    required this.sodium,
    required this.carbonHydrates,
    required this.protein,
    required this.fat,
    required this.fiber
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['ID'],
      name: json['NAME'],
      localName: json['LOCALNAME'],
      price: json['PRICE'],
      curCode: json['CURCODE'],
      preparePlace: json['PREPAREPLACE'],
      productGroupId: json['PRODUCTGROUPID'],
      imageUrl: json['PHOTOURL'],
      halfPortion: json['HALFPORTION'],
      includedInAi: json['INCLUDEDIN_AI'],
      isPackage: json['ISPACKAGE'],
      displayInfo: json['DISPLAYINFO'],
      localDisplayInfo: json['LOCALDISPLAYINFO'],
      allergic: json['ALLERGIC'],
      vegetarian: json['VEGETARIAN'],
      alcohol: json['ALCOHOL'],
      pork: json['PORK'],
      gluten: json['GLUTEN'],
      preperationTime: json['PREPERATIONTIME'],
      allergens: json['ALLERGENS'],
      calories: (json['CALORIES'] != null) ? double.parse(json['CALORIES'].toString()) : null, 
      cholesterol: (json['CHOLESTEROL'] != null) ? double.parse(json['CHOLESTEROL'].toString()) : null, 
      sodium: (json['SODIUM'] != null) ? double.parse(json['SODIUM'].toString()) : null, 
      carbonHydrates: (json['CARBONHYDRATES'] != null) ? double.parse(json['CARBONHYDRATES'].toString()) : null, 
      protein: (json['PROTEIN'] != null) ? double.parse(json['PROTEIN'].toString()) : null, 
      fat: (json['FAT'] != null) ? double.parse(json['FAT'].toString()) : null, 
      fiber: (json['FIBER'] != null) ? double.parse(json['FIBER'].toString()) : null
    );
  }
}
