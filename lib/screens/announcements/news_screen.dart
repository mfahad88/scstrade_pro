import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/announcement_provider.dart';

import '../../data/dto/announcement/News.dart';

class NewsScreen extends StatelessWidget {
  final List<News> news;
  const NewsScreen({super.key,required this.news});

  @override
  Widget build(BuildContext context) {

    final _flutterMediaDownloaderPlugin = MediaDownload();
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${news[index].companyCode} - ${news[index].companyName}'),
                Row(
                  children: [
                    const Text('Date'),
                    const SizedBox(width: 20.0,),
                    Text(Utils.convertDate(news[index].newsDate??"0"))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Description'),
                    const SizedBox(width: 20.0,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.6,
                        child: Wrap(
                          children: [
                            RegExp(r'(https?:\/\/[^\s]+\.pdf)').firstMatch(news[index].newsDesc!) != null?Text(news[index].newsDesc?.substring(0,news[index].newsDesc!.indexOf('Source:'))??"",):Text(news[index].newsDesc??"")
                          ],
                        )
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 80.0,),
                    news[index].newsDesc!.contains('Source:')?GestureDetector(
                      child: Image.asset('images/pdf-icon.jpg',width: 40,fit: BoxFit.cover,),
                      onTap: () {
                        RegExp regex = RegExp(r'(https?:\/\/[^\s]+\.pdf)');
                        final match = regex.firstMatch(news[index].newsDesc!);

                        print('Url: ${match?.group(0)}');
                        _flutterMediaDownloaderPlugin.downloadMedia(context, match!.group(0).toString());
                      },
                      ):Container(),
                  ],
                )

              ],
            ),
          );
        },  itemCount: news.length);
  }
}
