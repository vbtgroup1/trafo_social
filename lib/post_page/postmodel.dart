class PostModel {
  String sharedDate;
  List<SharedImg> sharedImg;
  String sharedLat;
  String sharedLong;
  String sharedText;
  String sharedUserId;
  String sharedUserName;
  String sharedUserProfileImg;

  PostModel(
      {this.sharedDate,
      this.sharedImg,
      this.sharedLat,
      this.sharedLong,
      this.sharedText,
      this.sharedUserId,
      this.sharedUserName,
      this.sharedUserProfileImg});

  PostModel.fromJson(Map<String, dynamic> json) {
    sharedDate = json['sharedDate'];
    if (json['sharedImg'] != null) {
      sharedImg = new List<SharedImg>();
      json['sharedImg'].forEach((v) {
        sharedImg.add(new SharedImg.fromJson(v));
      });
    }
    sharedLat = json['sharedLat'];
    sharedLong = json['sharedLong'];
    sharedText = json['sharedText'];
    sharedUserId = json['sharedUserId'];
    sharedUserName = json['sharedUserName'];
    sharedUserProfileImg = json['sharedUserProfileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sharedDate'] = this.sharedDate;
    if (this.sharedImg != null) {
      data['sharedImg'] = this.sharedImg.map((v) => v.toJson()).toList();
    }
    data['sharedLat'] = this.sharedLat;
    data['sharedLong'] = this.sharedLong;
    data['sharedText'] = this.sharedText;
    data['sharedUserId'] = this.sharedUserId;
    data['sharedUserName'] = this.sharedUserName;
    data['sharedUserProfileImg'] = this.sharedUserProfileImg;
    return data;
  }
}

class SharedImg {
  String url;

  SharedImg({this.url});

  SharedImg.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
