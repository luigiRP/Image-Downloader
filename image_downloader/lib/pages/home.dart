import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_downloader/data_provider/data_provider.dart';
import 'package:image_downloader/model/url_model.dart';
import 'package:image_downloader/pages/image.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var data = ref.watch(imageDataProvider);
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(title: const Text("Image Downloader")),
            body: data.when(
                data: (data) {
                  List<ImageUrl> images = data.map((e) => e).toList();
                  return SingleChildScrollView(
                    child: SizedBox(
                      width: currentWidth,
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          for (var url in images)
                            ImageWidget(
                                height: currentHeight * 0.3,
                                width: currentWidth * 0.3,
                                path: url.small)
                        ],
                      ),
                    ),
                  );
                },
                error: (err, s) => Center(
                        child: Column(
                      children: [
                        const Text(
                          'Error',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: currentHeight * 0.3),
                        Text(err.toString()),
                        SizedBox(
                          height: currentHeight * 0.1,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              data = ref.refresh(imageDataProvider);
                            },
                            child: const Text("Try Again"))
                      ],
                    )),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ))),
      ],
    );
  }
}
