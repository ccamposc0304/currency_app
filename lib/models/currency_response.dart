// To parse this JSON data, do
//
//     final currencyResponse = currencyResponseFromJson(jsonString);

import 'dart:convert';

CurrencyResponse currencyResponseFromJson(String str) => CurrencyResponse.fromJson(json.decode(str));

String currencyResponseToJson(CurrencyResponse data) => json.encode(data.toJson());

class CurrencyResponse {
    Data? data;
    int? timestamp;

    CurrencyResponse({
        this.data,
        this.timestamp,
    });

    factory CurrencyResponse.fromJson(Map<String, dynamic> json) => CurrencyResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        timestamp: json["timestamp"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "timestamp": timestamp,
    };
}

class Data {
    String? id;
    String? symbol;
    String? currencySymbol;
    String? type;
    String? rateUsd;

    Data({
        this.id,
        this.symbol,
        this.currencySymbol,
        this.type,
        this.rateUsd,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        symbol: json["symbol"],
        currencySymbol: json["currencySymbol"],
        type: json["type"],
        rateUsd: json["rateUsd"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "currencySymbol": currencySymbol,
        "type": type,
        "rateUsd": rateUsd,
    };
}
