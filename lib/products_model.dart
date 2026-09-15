class ProductsResponse {
  final List<ProductModel>? items;
  final int? page;
  final int? pageSize;
  final int? totalCount;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  ProductsResponse({
    this.items,
    this.page,
    this.pageSize,
    this.totalCount,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      items: (json['items'] as List?)
          ?.map(
            (item) => ProductModel.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList(),
      page: json['page'],
      pageSize: json['pageSize'],
      totalCount: json['totalCount'],
      hasNextPage: json['hasNextPage'],
      hasPreviousPage: json['hasPreviousPage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items?.map((item) => item.toJson()).toList(),
      'page': page,
      'pageSize': pageSize,
      'totalCount': totalCount,
      'hasNextPage': hasNextPage,
      'hasPreviousPage': hasPreviousPage,
    };
  }
}

class ProductModel {
  final String? id;
  final String? productCode;
  final String? name;
  final String? description;
  final String? arabicName;
  final String? arabicDescription;
  final String? coverPictureUrl;
  final List<String>? productPictures;
  final double? price;
  final int? stock;
  final double? weight;
  final String? color;
  final double? rating;
  final int? reviewsCount;
  final double? discountPercentage;
  final String? sellerId;
  final List<String>? categories;

  ProductModel({
    this.id,
    this.productCode,
    this.name,
    this.description,
    this.arabicName,
    this.arabicDescription,
    this.coverPictureUrl,
    this.productPictures,
    this.price,
    this.stock,
    this.weight,
    this.color,
    this.rating,
    this.reviewsCount,
    this.discountPercentage,
    this.sellerId,
    this.categories,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      productCode: json['productCode'],
      name: json['name'],
      description: json['description'],
      arabicName: json['arabicName'],
      arabicDescription: json['arabicDescription'],
      coverPictureUrl: json['coverPictureUrl'],

      productPictures: (json['productPictures'] as List?)
          ?.map((item) => item.toString())
          .toList(),

      price: (json['price'] as num?)?.toDouble(),

      stock: json['stock'],

      weight: (json['weight'] as num?)?.toDouble(),

      color: json['color'],

      rating: (json['rating'] as num?)?.toDouble(),

      reviewsCount: json['reviewsCount'],

      discountPercentage:
          (json['discountPercentage'] as num?)?.toDouble(),

      sellerId: json['sellerId'],

      categories: (json['categories'] as List?)
          ?.map((item) => item.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productCode': productCode,
      'name': name,
      'description': description,
      'arabicName': arabicName,
      'arabicDescription': arabicDescription,
      'coverPictureUrl': coverPictureUrl,
      'productPictures': productPictures,
      'price': price,
      'stock': stock,
      'weight': weight,
      'color': color,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'discountPercentage': discountPercentage,
      'sellerId': sellerId,
      'categories': categories,
    };
  }
}