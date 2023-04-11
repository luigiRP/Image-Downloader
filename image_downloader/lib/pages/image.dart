import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_downloader/utils/scaffold_messenger.dart';

class ImageWidget extends HookWidget {
  final String path;
  final double height;
  final double width;

  const ImageWidget(
      {required this.height,
      required this.width,
      super.key,
      required this.path});

  @override
  Widget build(BuildContext context) {
    final loading = useState(false);
    if (!loading.value) {
      return GestureDetector(
        onTap: () async {
          loading.value = true;
          String fullPath = '$path.jpg';
          await GallerySaver.saveImage(fullPath).then((bool? success) {
            if (success != null && success) {
              Messenger.showMessage("Saved image succesfully!", context);
            } else {
              Messenger.showMessage("Error saving image", context);
            }
          });
          loading.value = false;
        },
        child: Image.network(
          path,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
