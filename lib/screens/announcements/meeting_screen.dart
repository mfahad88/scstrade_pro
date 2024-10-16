import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scstrade_pro/helper/Utils.dart';
import 'package:scstrade_pro/provider/announcement_provider.dart';

import '../../data/dto/announcement/Meetings.dart';

class MeetingScreen extends StatelessWidget {
  final List<Meetings> meetings;
  const MeetingScreen({super.key,required this.meetings});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: meetings.length,
      itemBuilder: (context, index) => Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${meetings[index].companyCode} - ${meetings[index].companyName}',
            style: TextStyle(
              color: Colors.orange.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),),
            Row(
              children: [
                Icon(Icons.date_range),
                const Text('Date',style: TextStyle(
                  fontSize: 15
                ),
                ),
                SizedBox(width: 20.0,),
                Text(Utils.convertDate(meetings[index].bmDate??"0"),style: TextStyle(
                    fontSize: 15
                ),)
              ],
            ),
            Row(
              children: [
                Icon(Icons.timer),
                Text('Time'),
                SizedBox(width: 20.0,),
                Text(Utils.convertDate(meetings[index].bmTime??"0"))
              ],
            ),
            Row(
              children: [
                Icon(Icons.pin_drop),
                Text('Place'),
                SizedBox(width: 20.0,),
                Text(meetings[index].bmPlace??"")
              ],
            ),
            Row(
              children: [
                Icon(Icons.calendar_today_sharp),
                Text('Year End'),
                SizedBox(width: 20.0,),
                Text(meetings[index].bmYear??"")
              ],
            ),
            Row(
              children: [
                Text('Quarter'),
                SizedBox(width: 20.0,),
                Text(meetings[index].bmQuarterNumber??"")
              ],
            )
          ],
        ),
      ),
    );
  }
}
