class CountryCode {
  final String code;
  final String name;
  final String flag;
  final String dialCode;

  CountryCode(
      {required this.code,
      required this.name,
      required this.flag,
      required this.dialCode});

  factory CountryCode.fromJson(Map<String, dynamic> json) => CountryCode(
        code: json['code'] as String? ?? "",
        name: json['name'] as String? ?? "",
        flag: json['flag'] as String? ?? "",
        dialCode: json['dial_code'] as String? ?? "",
      );
}
