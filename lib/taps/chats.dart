import 'package:flutter/material.dart';
import 'package:whatapp/model/chat_model.dart';

class chats extends StatefulWidget {
  const chats({super.key});

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: chatsData.length,
        itemBuilder: (context,i) => new Column(
          children: [
            new Divider(height: 0.1,),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(chatsData[i].pic),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(chatsData[i].name,
                  style: TextStyle(
                    fontSize: 20.0,fontWeight: FontWeight.bold
                  ),),
                  new Text(
                    chatsData[i].time,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
              subtitle: Text(
                chatsData[i].msg,
                style: TextStyle(
                  color: Colors.grey,fontSize: 15
                ),
              ),
            )
          ],
        ));
  }
}