class restaurantGeneralModel {
    dynamic dataTypes;
    dynamic totalCount;
    List<List<restaurantModel>>? resultSets;
    String? sql;

    restaurantGeneralModel({
        this.dataTypes,
        this.totalCount,
        this.resultSets,
        this.sql,
    });

}

class restaurantModel {
    int? producttypeid;
    dynamic targetpriceavg;
    dynamic targetpricelast;
    String? name;
    int? price;
    dynamic barcode;
    String? photourl;
    String? migrationkey;
    String? code;
    int? costamount;
    int? costamountLastprice;
    int? costpercentbyavgprice;
    int? costpercentbylastprice;
    dynamic name2;
    int? id;
    int? productgroupid;
    int? currencyid;
    int? revenueid;
    dynamic etsstockid;
    int? hotelid;
    int? portalid;
    int? displayorder;
    int? kitchendisplayno;
    dynamic prepareplace;
    bool? quicklist;
    bool? posactive;
    bool? halfportion;
    bool? ispackage;
    bool? includedinAi;
    bool? validforcomp;
    bool? validforunpaid;
    bool? isdisabled;
    bool? ismenu;
    bool? onlineorder;
    bool? spaactive;
    bool? discountactive;
    String? productgroupidName;
    dynamic productgroupidGroupcode;
    CurrencyidCode3? currencyidCode3;
    String? revenueidRevenuename;
    int? revenueidVat1;

    restaurantModel({
        this.producttypeid,
        this.targetpriceavg,
        this.targetpricelast,
        this.name,
        this.price,
        this.barcode,
        this.photourl,
        this.migrationkey,
        this.code,
        this.costamount,
        this.costamountLastprice,
        this.costpercentbyavgprice,
        this.costpercentbylastprice,
        this.name2,
        this.id,
        this.productgroupid,
        this.currencyid,
        this.revenueid,
        this.etsstockid,
        this.hotelid,
        this.portalid,
        this.displayorder,
        this.kitchendisplayno,
        this.prepareplace,
        this.quicklist,
        this.posactive,
        this.halfportion,
        this.ispackage,
        this.includedinAi,
        this.validforcomp,
        this.validforunpaid,
        this.isdisabled,
        this.ismenu,
        this.onlineorder,
        this.spaactive,
        this.discountactive,
        this.productgroupidName,
        this.productgroupidGroupcode,
        this.currencyidCode3,
        this.revenueidRevenuename,
        this.revenueidVat1,
    });

}

enum CurrencyidCode3 {
    TRY
}
