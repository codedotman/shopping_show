class AddProductResponse {
  AddProductResponse({
    required this.statusCode,
    required this.message,
  });
  late final int statusCode;
  late final String message;

  AddProductResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statusCode'] = statusCode;
    _data['message'] = message;
    return _data;
  }
}
