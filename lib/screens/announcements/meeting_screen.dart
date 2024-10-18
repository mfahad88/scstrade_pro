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
    return meetings.isEmpty?ListTile(title: Text('No records found'),):ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
                const Icon(Icons.date_range),
                const Text('Date',style: TextStyle(
                  fontSize: 15
                ),
                ),
                const SizedBox(width: 20.0,),
                Text(Utils.convertDate(meetings[index].bmDate??"0"),style: const TextStyle(
                    fontSize: 15
                ),)
              ],
            ),
            Row(
              children: [
                const Icon(Icons.timer),
                const Text('Time'),
                const SizedBox(width: 20.0,),
                Text(meetings[index].bmTime??"0")
              ],
            ),
            Row(
              children: [
                const Icon(Icons.pin_drop),
                const Text('Place'),
                const SizedBox(width: 20.0,),
                Text(meetings[index].bmPlace??"")
              ],
            ),
            Row(
              children: [
                const Icon(Icons.calendar_today_sharp),
                const Text('Year End'),
                const SizedBox(width: 20.0,),
                Text(meetings[index].bmYear??"")
              ],
            ),
            Row(
              children: [
                const Text('Quarter'),
                const SizedBox(width: 20.0,),
                Text(meetings[index].bmQuarterNumber??"")
              ],
            )
          ],
        ),
      ),
    );
  }
}
