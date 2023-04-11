class ImageUrl {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;
  String smallS3;

  ImageUrl(
      {required this.raw,
      required this.full,
      required this.regular,
      required this.small,
      required this.thumb,
      required this.smallS3});

  factory ImageUrl.fromJson(Map<String, dynamic> json) => ImageUrl(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
      smallS3: json['small_s3']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['raw'] = raw;
    data['full'] = full;
    data['regular'] = regular;
    data['small'] = small;
    data['thumb'] = thumb;
    data['small_s3'] = smallS3;
    return data;
  }
}
