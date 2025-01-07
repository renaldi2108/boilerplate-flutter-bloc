class BaseEntity<T> {
  int? code;
  String? status;
  T? data;
  String? error;

  BaseEntity({this.code, this.status, this.data, this.error});

  factory BaseEntity.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonT,
      ) => BaseEntity(
    code: json['code'],
    status: json['status'],
    data: json['data'] != null ? fromJsonT(json['data']) : null,
    error: json['error'],
  );

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    final Map<String, dynamic> result = {};
    result['code'] = code;
    result['status'] = status;
    if (data != null) {
      result['data'] = toJsonT(data!);
    }
    result['error'] = error;
    return result;
  }
}