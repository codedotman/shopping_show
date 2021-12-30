class AddProductContent {
  AddProductContent({
    this.itemID,
    this.itemName,
    this.quantitySold,
  });
  int? itemID;
  String? itemName;
  int? quantitySold;

  Map<String, dynamic> toJson() =>
      {"itemID": itemID, "itemName": itemName, "quantity": quantitySold};
}
