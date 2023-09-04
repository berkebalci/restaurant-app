class MenuItem {
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
  String displayInfo;
  String localDisplayInfo;
  bool allergic;
  bool vegetarian;
  bool alcohol;
  bool pork;
  bool gluten;
  int preparationTime;
  String allergens;
  double calories;
  double? cholesterol;
  double? sodium;
  double carbohydrates;
  double protein;
  double fat;
  double? fiber;
  String? displayPrice;
  String? period1Start;
  String? period1End;
  String? period2Start;
  String? period2End;
  bool? bestSeller;
  bool? vegan;
  bool? hot;

  MenuItem({
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
    required this.gluten,
    required this.preparationTime,
    required this.allergens,
    required this.calories,
    this.cholesterol,
    this.sodium,
    required this.carbohydrates,
    required this.protein,
    required this.fat,
    this.fiber,
    this.displayPrice,
    this.period1Start,
    this.period1End,
    this.period2Start,
    this.period2End,
    
    this.bestSeller,
    this.vegan,
    this.hot,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
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
      displayInfo: json['DISPLAYINFO'] as String,
      localDisplayInfo: json['LOCALDISPLAYINFO'] as String,
      allergic: json['ALLERGIC'] as bool,
      vegetarian: json['VEGETARIAN'] as bool,
      alcohol: json['ALCOHOL'] as bool,
      pork: json['PORK'] as bool,
      gluten: json['GLUTEN'] as bool,
      preparationTime: json['PREPERATIONTIME'] as int,
      allergens: json['ALLERGENS'] as String,
      calories: double.parse(json['CALORIES'] as String),
      cholesterol: json['CHOLESTEROL'] != null ? double.parse(json['CHOLESTEROL'] as String) : null,
      sodium: json['SODIUM'] != null ? double.parse(json['SODIUM'] as String) : null,
      carbohydrates: double.parse(json['CARBONHYDRATES'] as String),
      protein: double.parse(json['PROTEIN'] as String),
      fat: double.parse(json['FAT'] as String),
      fiber: json['FIBER'] != null ? double.parse(json['FIBER'] as String) : null,
      displayPrice: json['DISPLAYPRICE'] as String?,
      period1Start: json['PERIOD1_START'] as String?,
      period1End: json['PERIOD1_END'] as String?,
      period2Start: json['PERIOD2_START'] as String?,
      period2End: json['PERIOD2_END'] as String?,
      bestSeller: json['BESTSELLER'] as bool?,
      vegan: json['VEGAN'] as bool?,
      hot: json['HOT'] as bool?,
    );
  }
}
