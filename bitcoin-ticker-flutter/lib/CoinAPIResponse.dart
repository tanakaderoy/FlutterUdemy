class CoinAPIResponse {
  String time;
  String assetIdBase;
  String assetIdQuote;
  double rate;

  CoinAPIResponse({this.time, this.assetIdBase, this.assetIdQuote, this.rate});

  CoinAPIResponse.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    assetIdBase = json['asset_id_base'];
    assetIdQuote = json['asset_id_quote'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['asset_id_base'] = this.assetIdBase;
    data['asset_id_quote'] = this.assetIdQuote;
    data['rate'] = this.rate;
    return data;
  }

  @override
  String toString() {
    return 'CoinAPIResponse{time: $time, assetIdBase: $assetIdBase, assetIdQuote: $assetIdQuote, rate: $rate}';
  }

}
