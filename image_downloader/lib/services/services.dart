import 'dart:convert';

import 'package:http/http.dart';
import 'package:image_downloader/model/url_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ApiServices {
  String key = 'rZnXFi3MGRHtwNnLMiQfx52lM2kQED8FPyP3cbWpUZY';
  String uri = 'https://api.unsplash.com/photos';

  Future<List<ImageUrl>> getImages() async {
    final List<ImageUrl> images = [];
    final String finalUri = '$uri/?client_id=$key';
    print('FINAL URI: ' + finalUri);
    Response response = await get(Uri.parse(finalUri));

    if (response.statusCode == 200) {
      final List body = jsonDecode(response.body);

      for (var element in body) {
        images.add(ImageUrl.fromJson(element['urls']));
      }

      return images;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final imageProvider = Provider<ApiServices>((ref) => ApiServices());
