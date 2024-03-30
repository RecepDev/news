import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/core/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class NewCardItem extends StatefulWidget {
  NewCardItem({super.key, required this.article, required this.isRemoved});

  Article article;
  bool isRemoved;

  @override
  State<NewCardItem> createState() => _NewCardItemState();
}

class _NewCardItemState extends State<NewCardItem> {
  @override
  Widget build(BuildContext context) {
    return widget.isRemoved == false ? Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
         onTap: () => _launchUrl(widget.article.url!), 
        child: SizedBox(
          width: 222,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.hardEdge,
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.article.urlToImage == null ? false : true,
                      child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: widget.article.urlToImage == null
                                ? ""
                                : widget.article.urlToImage!,
                            fit: BoxFit.fitWidth,
                            fadeInDuration: const Duration(milliseconds: 100),
                            fadeOutDuration: const Duration(milliseconds: 100),
                            placeholder: (context, url) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                            errorWidget: (context, url, error) {
                              return const Text("error");
                            },
                          )),
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 75,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    width: MediaQuery.sizeOf(context).width,
                                    child: Text(
                                      widget.article.title!,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(DateFormat("MM/dd EEE - HH:mm")
                                .format(
                                    DateTime.parse(widget.article.publishedAt!))
                                .toString()),
                          )),
                    ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ) : const SizedBox();
  }

  _launchUrl(String url) {
    Uri uri = Uri.parse(url);
    if (url.isNotEmpty) {
      launchUrl(uri);
    }
  }
}
