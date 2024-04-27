import 'package:flutter/material.dart';

import '../model/call_model.dart';

class call extends StatefulWidget {
  const call({super.key});

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {




  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: calData.length,
        itemBuilder: (context,i) => new Column(
          children: [
            new Divider(height: 0.1,),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage:  AssetImage(calData[i].pic),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(calData[i].name,
                    style: TextStyle(
                        fontSize: 20.0,fontWeight: FontWeight.bold
                    ),),
                  new Icon(
                    i % 2 == 0 ? Icons.call:Icons.videocam,
                  color: Colors.green,)
                ],
              ),
              subtitle: Text(
                calData[i].time,
                style: TextStyle(color: Colors.grey,fontSize: 15),
              ),
            )
          ],
        ));
  }
}
