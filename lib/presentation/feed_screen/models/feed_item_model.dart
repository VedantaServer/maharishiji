class FeedItemModel {
  final String? msg;
  final String? isError;
  final int? code;
  final List<Data>? data;

  FeedItemModel({
    this.msg,
    this.isError,
    this.code,
    this.data,
  });

  FeedItemModel copyWith({
    String? msg,
    String? isError,
    int? code,
    List<Data>? data,
  }) {
    return FeedItemModel(
      msg: msg ?? this.msg,
      isError: isError ?? this.isError,
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }

  FeedItemModel.fromJson(Map<String, dynamic> json)
      : msg = json['msg'] as String?,
        isError = json['isError'] as String?,
        code = json['code'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'msg' : msg,
    'isError' : isError,
    'code' : code,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final SubCategory? subCategory;
  final String? name;
  final String? href;
  final String? description;
  final String? image;
  final int? shareCount;
  final int? viewCount;
  final String? type;
  final List<dynamic>? comment;
  final String? updationDate;

  Data({
    this.id,
    this.subCategory,
    this.name,
    this.href,
    this.description,
    this.image,
    this.shareCount,
    this.viewCount,
    this.type,
    this.comment,
    this.updationDate,
  });

  Data copyWith({
    int? id,
    SubCategory? subCategory,
    String? name,
    String? href,
    String? description,
    String? image,
    int? shareCount,
    int? viewCount,
    String? type,
    List<dynamic>? comment,
    String? updationDate,
  }) {
    return Data(
      id: id ?? this.id,
      subCategory: subCategory ?? this.subCategory,
      name: name ?? this.name,
      href: href ?? this.href,
      description: description ?? this.description,
      image: image ?? this.image,
      shareCount: shareCount ?? this.shareCount,
      viewCount: viewCount ?? this.viewCount,
      type: type ?? this.type,
      comment: comment ?? this.comment,
      updationDate: updationDate ?? this.updationDate,
    );
  }

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        subCategory = (json['subCategory'] as Map<String,dynamic>?) != null ? SubCategory.fromJson(json['subCategory'] as Map<String,dynamic>) : null,
        name = json['name'] as String?,
        href = json['href'] as String?,
        description = json['description'] as String?,
        image = json['image'] as String?,
        shareCount = json['shareCount'] as int?,
        viewCount = json['viewCount'] as int?,
        type = json['type'] as String?,
        comment = json['comment'] as List?,
        updationDate = json['updationDate'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'subCategory' : subCategory?.toJson(),
    'name' : name,
    'href' : href,
    'description' : description,
    'image' : image,
    'shareCount' : shareCount,
    'viewCount' : viewCount,
    'type' : type,
    'comment' : comment,
    'updationDate' : updationDate
  };
}

class SubCategory {
  final int? id;
  final MainCategory? mainCategory;
  final String? name;
  final String? href;
  final String? updationDate;

  SubCategory({
    this.id,
    this.mainCategory,
    this.name,
    this.href,
    this.updationDate,
  });

  SubCategory copyWith({
    int? id,
    MainCategory? mainCategory,
    String? name,
    String? href,
    String? updationDate,
  }) {
    return SubCategory(
      id: id ?? this.id,
      mainCategory: mainCategory ?? this.mainCategory,
      name: name ?? this.name,
      href: href ?? this.href,
      updationDate: updationDate ?? this.updationDate,
    );
  }

  SubCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        mainCategory = (json['mainCategory'] as Map<String,dynamic>?) != null ? MainCategory.fromJson(json['mainCategory'] as Map<String,dynamic>) : null,
        name = json['name'] as String?,
        href = json['href'] as String?,
        updationDate = json['updationDate'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'mainCategory' : mainCategory?.toJson(),
    'name' : name,
    'href' : href,
    'updationDate' : updationDate
  };
}

class MainCategory {
  final int? id;
  final String? name;
  final String? href;
  final dynamic subCategory;
  final String? updationDate;

  MainCategory({
    this.id,
    this.name,
    this.href,
    this.subCategory,
    this.updationDate,
  });

  MainCategory copyWith({
    int? id,
    String? name,
    String? href,
    dynamic subCategory,
    String? updationDate,
  }) {
    return MainCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      href: href ?? this.href,
      subCategory: subCategory ?? this.subCategory,
      updationDate: updationDate ?? this.updationDate,
    );
  }

  MainCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        href = json['href'] as String?,
        subCategory = json['subCategory'],
        updationDate = json['updationDate'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'href' : href,
    'subCategory' : subCategory,
    'updationDate' : updationDate
  };
}