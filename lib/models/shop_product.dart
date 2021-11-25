import 'dart:convert';
import 'package:get/get.dart';

List<NewProduct> newProductFromJson(String str) => List<NewProduct>.from(json.decode(str).map((x) => NewProduct.fromJson(x)));

String newProductToJson(List<NewProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewProduct {
    NewProduct({
        this.id,
        this.brand,
        this.name,
        this.price,
        this.priceSign,
        this.currency,
        this.imageLink,
        this.productLink,
        this.websiteLink,
        this.description,
        this.rating,
        this.category,
        this.productType,
        this.tagList,
        this.createdAt,
        this.updatedAt,
        this.productApiUrl,
        this.apiFeaturedImage,
        this.productColors,
    });

    int? id;
    Brand? brand;
    String? name;
    String? price;
    dynamic priceSign;
    dynamic currency;
    String? imageLink;
    String? productLink;
    String? websiteLink;
    String? description;
    double? rating;
    String? category;
    String? productType;
    List<dynamic>? tagList;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? productApiUrl;
    String? apiFeaturedImage;
    List<ProductColor>? productColors;


 var isFavorite = false.obs;

    factory NewProduct.fromJson(Map<String, dynamic> json) => NewProduct(
        id: json["id"] ?? null,
        brand: brandValues.map[json["brand"]] ?? null,
        name: json["name"] ?? null,
        price: json["price"]  ?? "20.33",
        priceSign: json["price_sign"] ?? null,
        currency: json["currency"] ?? "USD",
        imageLink: json["image_link"] ?? "https://d3t32hsnjxo7q6.cloudfront.net/i/a20f3622d08d7b87492ca0af0319bf73_ra,w158,h184_pa,w158,h184.jpg",
        productLink: json["product_link"] ?? null,
        websiteLink: json["website_link"] ?? null,
        description: json["description"] ?? null,
        rating: json["rating"] ?? 5.00,//== null ? null : json["rating"].toDouble(),
        category: json["category"] ?? null ,
        productType: json["product_type"] ?? null,
        tagList: List<dynamic>.from(json["tag_list"].map((x) => x)) ,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        productApiUrl: json["product_api_url"] ?? null,
        apiFeaturedImage: json["api_featured_image"] ?? null,
        productColors: List<ProductColor>.from(json["product_colors"].map((x) => ProductColor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brandValues.reverse[brand],
        "name": name,
        "price": price == null ? null : price,
        "price_sign": priceSign,
        "currency": currency,
        "image_link": imageLink == null ? 'https://img.favpng.com/24/23/8/government-of-nepal-emblem-of-nepal-nepali-language-png-favpng-8u7bKq8ekp1Scxs8a5Z62LgjD.jpg' : imageLink,
        "product_link": productLink,
        "website_link": websiteLink,
        "description": description,
        "rating": rating == null ? null : rating,
        "category": category == null ? null : category,
        "product_type": productType,
        "tag_list": List<dynamic>.from(tagList!.map((x) => x)),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "product_api_url": productApiUrl,
        "api_featured_image": apiFeaturedImage,
        "product_colors": List<dynamic>.from(productColors!.map((x) => x.toJson())),
    };
}

enum Brand { MAYBELLINE }

final brandValues = EnumValues({
    "maybelline": Brand.MAYBELLINE
});

class ProductColor {
    ProductColor({
        this.hexValue,
        this.colourName,
    });

    String? hexValue;
    String? colourName;

    factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
        hexValue: json["hex_value"],
        colourName: json["colour_name"] == null ? null : json["colour_name"],
    );

    Map<String, dynamic> toJson() => {
        "hex_value": hexValue,
        "colour_name": colourName == null ? null : colourName,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
