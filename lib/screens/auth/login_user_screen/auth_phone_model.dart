class OtpResponse {
  String? sId;
  String? shopName;
  String? ownerName;
  String? mobileNo;
  String? address;
  String? gst;
  String? shopPhoto;
  int? iV;
  String? token;

  OtpResponse({this.sId,
    this.shopName,
    this.ownerName,
    this.mobileNo,
    this.address,
    this.gst,
    this.shopPhoto,
    this.iV,
    this.token});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    shopName = json['shop_name'];
    ownerName = json['owner_name'];
    mobileNo = json['mobile_no'];
    address = json['address'];
    gst = json['gst'];
    shopPhoto = json['shop_photo'];
    iV = json['__v'];
    token = json['token'];
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
    data['token'] = this.token;
    return data;
  }
}