import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/announcement_provider.dart';
import 'package:scstrade_pro/screens/announcements/announcement_screen.dart';
import 'package:scstrade_pro/screens/announcements/meeting_screen.dart';
import 'package:scstrade_pro/screens/announcements/news_screen.dart';

class AccouncementsScreen extends StatelessWidget {
  const AccouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title=['News','Meetings','Announcements'];
    AnnouncementProvider announcementProvider = Provider.of(context,listen: false);
    announcementProvider.fetchAccouncements();
    return Scaffold(
        body:SafeArea(
            child: Consumer<AnnouncementProvider>(builder: (BuildContext context, AnnouncementProvider provider, Widget? child) {
              return provider.isLoading?const Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
                child: Column(
                  children: [
                    borderDate('Start Date: '),
                    SizedBox(height: 20.0,),
                    borderDate('End Date: '),
                    SizedBox(height: 20.0,),
                    Column(
                      children: [
                        ExpansionPanelList(
                          expansionCallback: (panelIndex, isExpanded) => provider.setExpandable(panelIndex,isExpanded),
                          children: title.asMap().map<int, ExpansionPanel>((index, e) {
                            return MapEntry(
                              index,
                              ExpansionPanel(
                                canTapOnHeader: true,
                                headerBuilder: (context, isExpanded) {
                                  return ListTile(
                                    title: Text('Title: $e'),  // You can use the index here
                                  );
                                },
                                body:
                                index==0?NewsScreen(news: provider.news,):index==1?MeetingScreen(meetings: provider.meetings,):AnnouncementScreen(),  // Replace with your body widget
                                isExpanded: provider.expandable[index],   // Control expansion state if needed
                              ),
                            );
                          }).values.toList(),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },

            )
        )
    );
  }

  Widget borderDate(String text){
    return Row(
      children: [
        Text(text),
        Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade500,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(5.0)

            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
            )
        )
      ],
    );
  }
}
