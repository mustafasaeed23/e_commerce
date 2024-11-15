import 'package:e_commerce/featuers/home/Domain/entities/brand.dart';

class BrandsResponse {
  int? results;
  Metadata? metadata;
  List<BrandModel> data;

  BrandsResponse({this.results, this.metadata, required this.data});

  BrandsResponse.fromJson(Map<String, dynamic> json)
      : data = List<BrandModel>.from(
            json['data']?.map((v) => BrandModel.fromJson(v)) ?? []) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['numberOfPages'] = numberOfPages;
    data['limit'] = limit;
    data['nextPage'] = nextPage;
    return data;
  }
}

class BrandModel extends Brand {
  String? slug;
  String? createdAt;
  String? updatedAt;

  BrandModel({
    required super.sId,
    required super.name,
    required super.image,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'BrandModel(id:$sId, name:$name, slug:$slug, createdAt:$createdAt, updatedAt:$updatedAt)';
  }

  // fromJson constructor
  BrandModel.fromJson(Map<String, dynamic> json)
      : super(
          sId: json['_id'],
          name: json['name'],
          image: json['image'],
        ) {
    slug = json['slug'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  // toJson method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
