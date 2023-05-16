class RateList {
  String? name;
  String? id;
  List<SubCategory>? subCategory;

  RateList({this.name, this.id, this.subCategory});

  RateList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    if (json['subCategory'] != null) {
      subCategory = <SubCategory>[];
      json['subCategory'].forEach((v) {
        subCategory!.add(new SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    if (this.subCategory != null) {
      data['subCategory'] = this.subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategory {
  String? sId;
  String? mainCategory;
  String? name;
  int? rate;
  int? iV;

  SubCategory({this.sId, this.mainCategory, this.name, this.rate, this.iV});

  SubCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    mainCategory = json['main_category'];
    name = json['name'];
    rate = json['rate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['main_category'] = this.mainCategory;
    data['name'] = this.name;
    data['rate'] = this.rate;
    data['__v'] = this.iV;
    return data;
  }
}