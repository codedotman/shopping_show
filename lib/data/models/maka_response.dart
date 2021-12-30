class MakaResponse {
  MakaResponse({
    this.itemID,
    this.itemName,
    this.quantitySold,
  });
  String? itemID;
  String? itemName;
  int? quantitySold;

  MakaResponse.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    itemName = json['itemName'];
    quantitySold = json['quantity_sold'];
  }
}
