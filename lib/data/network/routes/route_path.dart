class Routes {
  static String baseURL =
      "https://us-central1-inventory-ts-firestore.cloudfunctions.net/api";
  static String showProducts = "$baseURL/show/222";
  static String addProduct = "$baseURL/inventory";
  static buyProduct(itemId) => "$baseURL/show/222/buy_item/$itemId";
}
