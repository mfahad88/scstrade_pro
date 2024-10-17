import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/announcement_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
                            getDescription(news[index].newsDesc!)[0].isNotEmpty?Text(news[index].newsDesc!.substring(0,int.parse(getDescription(news[index].newsDesc!)[1]))):Text(news[index].newsDesc!)
                          ],
                        )
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 80.0,),
                    getDescription(news[index].newsDesc!).first.contains('pdf')?GestureDetector(
                      child: Image.asset('images/pdf-icon.jpg',width: 40,fit: BoxFit.cover,),
                      onTap: () {
                        String mediaUrl =getDescription(news[index].newsDesc!)[0];
                        String customLocation = '/storage/emulated/0/Download';
                        String customFileName = getDescription(news[index].newsDesc!)[0].substring(getDescription(news[index].newsDesc!)[0].lastIndexOf('/')+1,getDescription(news[index].newsDesc!)[0].length);
                        _flutterMediaDownloaderPlugin.downloadMedia(context, mediaUrl,customLocation,customFileName);
                      },
                    ):getDescription(news[index].newsDesc!).first.isNotEmpty?GestureDetector(
                      child: Card(
                        elevation: 5.0,
                        clipBehavior: Clip.none,
                        child: Container(
                          width: 40,
                          height: 40,
                          color: Colors.white,
                          child: Icon(Icons.link),
                        ),
                      ),
                      onTap: () async {
                        var url = Uri.parse(getDescription(news[index].newsDesc!)[0]);
                        print("Click: ${getDescription(news[index].newsDesc!)[0]}");
                        if(await canLaunchUrl(url)){
                          await launchUrl(url);
                        }

                      },
                    ):Container(),
                  ],
                )

              ],
            ),
          );
        },  itemCount: news.length);
  }


  List<String> getDescription(String desc) {
    var output=List.filled(3, '',);
    // RegExp urlRegex = RegExp(r'((https?:\/\/)?(www\.)?[^\s]+\.[^\s]+)');
    RegExp urlRegex = RegExp(r'(https?:\/\/[^\s]+)');
    Iterable<RegExpMatch> matches = urlRegex.allMatches(desc);

    for (var match in matches) {

      output[0]=match.group(0)!;
      // print('Url: ${match.group(0)}'); // Prints the matched URL
      output[1]=match.start.toString();
      output[2]=match.end.toString();
    }

    return output;
  }
}
