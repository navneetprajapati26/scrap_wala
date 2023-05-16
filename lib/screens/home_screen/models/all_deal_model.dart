class AllDeals {
  User? user;
  Deal? deal;

  AllDeals({this.user, this.deal});

  AllDeals.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    deal = json['deal'] != null ? new Deal.fromJson(json['deal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.deal != null) {
      data['deal'] = this.deal!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? shopName;
  String? ownerName;
  String? mobileNo;
  String? address;
  String? gst;
  String? shopPhoto;
  int? iV;

  User(
      {this.sId,
        this.shopName,
        this.ownerName,
        this.mobileNo,
        this.address,
        this.gst,
        this.shopPhoto,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    shopName = json['shop_name'];
    ownerName = json['owner_name'];
    mobileNo = json['mobile_no'];
    address = json['address'];
    gst = json['gst'];
    shopPhoto = json['shop_photo'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['shop_name'] = this.shopName;
    data['owner_name'] = this.ownerName;
    data['mobile_no'] = this.mobileNo;
    data['address'] = this.address;
    data['gst'] = this.gst;
    data['shop_photo'] = this.shopPhoto;
    data['__v'] = this.iV;
    return data;
  }
}

class Deal {
  String? sId;
  String? userId;
  String? mainCategory;
  String? subCategory;
  String? weight;
  String? rate;
  List<String>? images;
  String? title;
  String? description;
  String? dealAt;
  int? iV;

  Deal(
      {this.sId,
        this.userId,
        this.mainCategory,
        this.subCategory,
        this.weight,
        this.rate,
        this.images,
        this.title,
        this.description,
        this.dealAt,
        this.iV});

  Deal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    mainCategory = json['main_category'];
    subCategory = json['sub_category'];
    weight = json['weight'];
    rate = json['rate'];
    images = json['images'].cast<String>();
    title = json['title'];
    description = json['description'];
    dealAt = json['dealAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    data['main_category'] = this.mainCategory;
    data['sub_category'] = this.subCategory;
    data['weight'] = this.weight;
    data['rate'] = this.rate;
    data['images'] = this.images;
    data['title'] = this.title;
    data['description'] = this.description;
    data['dealAt'] = this.dealAt;
    data['__v'] = this.iV;
    return data;
  }
}