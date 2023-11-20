import 'dart:convert';

class BuyerOrderResponseModel {
  final List<BuyerOrder> data;
  final Meta meta;

  BuyerOrderResponseModel({
    required this.data,
    required this.meta,
  });

  factory BuyerOrderResponseModel.fromJson(String str) =>
      BuyerOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BuyerOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      BuyerOrderResponseModel(
        data: List<BuyerOrder>.from(
            json["data"].map((x) => BuyerOrder.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "meta": meta.toMap(),
      };
}

class BuyerOrder {
  final int id;
  final Attributes attributes;

  BuyerOrder({
    required this.id,
    required this.attributes,
  });

  factory BuyerOrder.fromJson(String str) =>
      BuyerOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BuyerOrder.fromMap(Map<String, dynamic> json) => BuyerOrder(
        id: json["id"],
        attributes: Attributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes.toMap(),
      };
}

class Attributes {
  final List<Item> items;
  final int totalPrice;
  final String deliveryAddress;
  final String courierName;
  final int courierPrice;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final String noResi;
  final String buyerId;

  Attributes({
    required this.items,
    required this.totalPrice,
    required this.deliveryAddress,
    required this.courierName,
    required this.courierPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.noResi,
    required this.buyerId,
  });

  factory Attributes.fromJson(String str) =>
      Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        totalPrice: json["totalPrice"],
        deliveryAddress: json["deliveryAddress"],
        courierName: json["courierName"],
        courierPrice: json["courierPrice"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
        noResi: json["noResi"] ?? '-',
        buyerId: json["buyerId"],
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "totalPrice": totalPrice,
        "deliveryAddress": deliveryAddress,
        "courierName": courierName,
        "courierPrice": courierPrice,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
        "noResi": noResi,
        "buyerId": buyerId,
      };
}

class Item {
  final int id;
  final String productName;
  final int price;
  final int qty;

  Item({
    required this.id,
    required this.productName,
    required this.price,
    required this.qty,
  });

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        qty: json["qty"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "productName": productName,
        "price": price,
        "qty": qty,
      };
}

class Meta {
  final Pagination pagination;

  Meta({
    required this.pagination,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "pagination": pagination.toMap(),
      };
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageCount,
    required this.pageSize,
    required this.total,
  });

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
