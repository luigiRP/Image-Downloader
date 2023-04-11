import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_downloader/data_provider/data_provider.dart';
import 'package:image_downloader/model/url_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(imageDataProvider);
    return Scaffold(
        appBar: AppBar(title: const Text("Image Downloader")),
        body: data.when(
            data: (data) {
              List<ImageUrl> images = data.map((e) => e).toList();
              return Wrap(
                children: [for (var url in images) Image.network(url.raw)],
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
