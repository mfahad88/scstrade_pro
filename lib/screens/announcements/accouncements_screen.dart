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
    /*AnnouncementProvider announcementProvider = Provider.of(context,listen: false);
    announcementProvider.fetchAccouncements();*/
    return Scaffold(
        body:SafeArea(
            child: Consumer<AnnouncementProvider>(builder: (BuildContext context, AnnouncementProvider provider, Widget? child) {
              return provider.isLoading?const Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          borderDate(context: context,text: 'Start Date: ',provider: provider),
                          Spacer(),
                          borderDate(context: context,text: 'End Date: ',provider: provider),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: FilledButton(onPressed: () => provider.fetchAccouncements(), child: Text('Show')),
                    ),
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
                                backgroundColor: Colors.grey.shade50,
                                headerBuilder: (context, isExpanded) {
                                  return ListTile(
                                    title: Text('$e',
                                      style:const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black45
                                      ) ,),  // You can use the index here
                                  );
                                },
                                body: index==0?NewsScreen(news: provider.news,):index==1?MeetingScreen(meetings: provider.meetings,):AnnouncementScreen(announcements:provider.announcement),  // Replace with your body widget
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

  Widget borderDate({required BuildContext context,required String text,required AnnouncementProvider provider}){
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
            child: GestureDetector(
              onTap: () async {
                final DateTime? pickedDate=await showDatePicker(context: context, initialDate: DateTime.now(),firstDate: DateTime(DateTime.now().year), lastDate: DateTime(DateTime.now().year+20));
                if(text.contains('Start')){
                  provider.startDate=pickedDate;
                }else{
                  provider.endDate=pickedDate;
                }
              },
              child: Padding(              
                padding: const EdgeInsets.all(8.0),
                child: Text(text.contains('Start')?'${provider.startDate?.day}/${provider.startDate?.month}/${provider.startDate?.year}':'${provider.endDate?.day}/${provider.endDate?.month}/${provider.endDate?.year}'),
                
              ),
            )
        )
      ],
    );
  }
}
