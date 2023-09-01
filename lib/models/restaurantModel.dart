class RestaurantModelClass {
    int? id;
    String? departmentname;
    dynamic orderonlinephone;
    bool? guestposactive;
    dynamic posprogdate;
    bool? routeordersbydistrict;
    dynamic address;
    dynamic citysub;
    dynamic city;
    dynamic zipcode;
    dynamic state;
    dynamic country;
    dynamic phone;
    dynamic email;
    dynamic website;
    dynamic taxscheme;
    dynamic taxnumber;
    dynamic taxplace;
    dynamic fax;
    dynamic registerno;
    dynamic latitude;
    dynamic longitude;
    dynamic turkeydistrictid;
    dynamic addressdirections;
    bool? digitalmenuTakeaway;
    dynamic dmLogourl;
    dynamic dmBannerurl;
    bool? dmShowprices;
    String? dmServicetype;
    dynamic dmSharebonuspercent;
    dynamic dmShoppingbonuspercent;
    dynamic dmOrdertimestart;
    dynamic dmOrdertimeend;
    dynamic dmMenuurl;
    dynamic dmMobilemenuurl;
    dynamic dmMenudisplaymode;
    dynamic dmBasketdisable;
    String? dmColorschemes;
    bool? dmHidedepartmentchange;
    bool? dmOnlinepaymentattable;
    dynamic dmOnlinepaymentattablerequired;
    bool? dmOpensurvey;
    dynamic guestloginreqfororder;
    dynamic dmInstagram;
    dynamic dmFacebook;
    dynamic dmPhone;
    dynamic dmWhatsapp;
    bool? dmQrtoqractive;
    bool? dmDigitalmenuCreatecheck;
    bool? dmCallforwaiter;
    int? dmDesignmode;
    dynamic dmSurveyoption;
    dynamic dmAutoservicepercent;
    dynamic dmAutoserviceamount;
    dynamic dmMenupopup;
    dynamic dmPopup;
    String? name;
    String? localname;
    String? imageurl;
    int? displayorder;
    Menudesign? menudesign;
    int? parentgroupid;
    dynamic price;
    Cur? curcode;
    String? prepareplace;
    int? productgroupid;
    String? photourl;
    bool? halfportion;
    bool? includedinAi;
    int? empty;
    bool? ispackage;
    String? displayinfo;
    String? localdisplayinfo;
    bool? allergic;
    bool? vegetarian;
    bool? alcohol;
    bool? pork;
    bool? gluten;
    int? preperationtime;
    String? allergens;
    int? calories;
    int? cholesterol;
    int? sodium;
    int? carbonhydrates;
    int? protein;
    int? fat;
    int? fiber;
    int? displayprice;
    DateTime? period1Start;
    DateTime? period1End;
    DateTime? period2Start;
    DateTime? period2End;
    bool? notavailableforOnlineorder;
    bool? bestseller;
    bool? vegan;
    bool? hot;
    int? depid;
    int? productid;
    int? currencyid;
    Cur? currency;
    dynamic time1;
    dynamic time2;
    dynamic dayofweeks;
    String? groupname;
    String? localgroupname;
    int? hotelid;
    int? portalid;
    dynamic migrationkey;
    bool? isdefault;
    bool? isrequired;
    dynamic showplusminus;
    dynamic footertextlang;
    dynamic localfootertextlang;

    RestaurantModelClass({
        this.id,
        this.departmentname,
        this.orderonlinephone,
        this.guestposactive,
        this.posprogdate,
        this.routeordersbydistrict,
        this.address,
        this.citysub,
        this.city,
        this.zipcode,
        this.state,
        this.country,
        this.phone,
        this.email,
        this.website,
        this.taxscheme,
        this.taxnumber,
        this.taxplace,
        this.fax,
        this.registerno,
        this.latitude,
        this.longitude,
        this.turkeydistrictid,
        this.addressdirections,
        this.digitalmenuTakeaway,
        this.dmLogourl,
        this.dmBannerurl,
        this.dmShowprices,
        this.dmServicetype,
        this.dmSharebonuspercent,
        this.dmShoppingbonuspercent,
        this.dmOrdertimestart,
        this.dmOrdertimeend,
        this.dmMenuurl,
        this.dmMobilemenuurl,
        this.dmMenudisplaymode,
        this.dmBasketdisable,
        this.dmColorschemes,
        this.dmHidedepartmentchange,
        this.dmOnlinepaymentattable,
        this.dmOnlinepaymentattablerequired,
        this.dmOpensurvey,
        this.guestloginreqfororder,
        this.dmInstagram,
        this.dmFacebook,
        this.dmPhone,
        this.dmWhatsapp,
        this.dmQrtoqractive,
        this.dmDigitalmenuCreatecheck,
        this.dmCallforwaiter,
        this.dmDesignmode,
        this.dmSurveyoption,
        this.dmAutoservicepercent,
        this.dmAutoserviceamount,
        this.dmMenupopup,
        this.dmPopup,
        this.name,
        this.localname,
        this.imageurl,
        this.displayorder,
        this.menudesign,
        this.parentgroupid,
        this.price,
        this.curcode,
        this.prepareplace,
        this.productgroupid,
        this.photourl,
        this.halfportion,
        this.includedinAi,
        this.empty,
        this.ispackage,
        this.displayinfo,
        this.localdisplayinfo,
        this.allergic,
        this.vegetarian,
        this.alcohol,
        this.pork,
        this.gluten,
        this.preperationtime,
        this.allergens,
        this.calories,
        this.cholesterol,
        this.sodium,
        this.carbonhydrates,
        this.protein,
        this.fat,
        this.fiber,
        this.displayprice,
        this.period1Start,
        this.period1End,
        this.period2Start,
        this.period2End,
        this.notavailableforOnlineorder,
        this.bestseller,
        this.vegan,
        this.hot,
        this.depid,
        this.productid,
        this.currencyid,
        this.currency,
        this.time1,
        this.time2,
        this.dayofweeks,
        this.groupname,
        this.localgroupname,
        this.hotelid,
        this.portalid,
        this.migrationkey,
        this.isdefault,
        this.isrequired,
        this.showplusminus,
        this.footertextlang,
        this.localfootertextlang,
    });

}

enum Cur {
    EUR,
    TRY
}

enum Menudesign {
    THE_1_X1,
    THE_1_X2,
    THE_1_X3,
    THE_2_X1,
    THE_2_X2,
    THE_2_X3
}
