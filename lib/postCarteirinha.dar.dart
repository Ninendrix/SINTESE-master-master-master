class carteirinha {
  String uRL;

  carteirinha({this.uRL});

  carteirinha.fromJson(Map<String, dynamic> json) {
    uRL = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['URL'] = this.uRL;
    return data;
  }
}