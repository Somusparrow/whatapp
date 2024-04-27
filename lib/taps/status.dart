import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/status_model.dart';

class status extends StatefulWidget {
  const status({super.key});

  @override
  State<status> createState() => _statusState();
}

class _statusState extends State<status> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: ListTile(
                  leading: Container(
                    width: 50,
                    child: Stack(
                      children: [
                        ClipOval(
                          child: Image.asset('assets/gr.jpg',
                          height: 40,
                          width: 40,),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(Icons.add,color: Colors.white,
                            size: 15,),
                          ),
                        )
                      ],
                    ),
                  ),
                  title: Text('My status',style: TextStyle(fontWeight: FontWeight.bold
                  ),),
                  subtitle: Text('Tap to add status update'),
                ))
          ],
        ),
        SizedBox(
          height: 30,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Text('Recent update',style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.black),),
          ),
        ),
        Expanded(
            child: ListView.builder(
              itemCount: StatusData.length,
                itemBuilder: (context,i)=>new Column(
                 children: [
                   new Divider(height: 0.1,),
                   new ListTile(
                     leading: CircleAvatar(
                       backgroundColor: Colors.grey,
                       backgroundImage:AssetImage('assets/gr.jpg'),
                     ),
                     title: Row(
                       children: [
                         new Text(StatusData[i].name,
                         style: TextStyle(
                           fontSize: 13,
                           fontWeight: FontWeight.bold,
                         ),)
                       ],
                     ),
                     subtitle: Container(
                       child: Text(StatusData[i].name,
                       style: TextStyle(color: Colors.grey,fontSize: 12),),
                     ),
                   )
                 ],
                )))
      ],
    );
  }
}