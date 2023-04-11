import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_downloader/model/url_model.dart';
import 'package:image_downloader/services/services.dart';

final imageDataProvider = FutureProvider<List<ImageUrl>>((ref) async {
  return ref.watch(imageProvider).getImages();
});
