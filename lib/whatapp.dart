import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatapp/taps/call.dart';
import 'package:whatapp/taps/camera.dart';
import 'package:whatapp/taps/chats.dart';
import 'package:whatapp/taps/status.dart';

class whatapp extends StatefulWidget {
  const whatapp({super.key});

  @override
  State<whatapp> createState() => _whatappState();
}

class _whatappState extends State<whatapp> with SingleTickerProviderStateMixin{
   late TabController _tabController;


   @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 4, vsync: this, initialIndex: 1)..addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('GT CHAT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        actions: [
         IconButton(onPressed: (){},
             icon: Icon(Icons.search,color: Colors.white,)),
          IconButton(onPressed: (){},
              icon: Icon(Icons.more_vert,color: Colors.white,)),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.camera_alt),),
            Tab(text: 'CHATS',),
            Tab(text: 'STATUS',),
            Tab(text: 'CALL',),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
          children: [
            new camera(),
            new chats(),
            new status(),
            new call(),
          ],
      ),
      floatingActionButton:_tabController.index == 0
        ?
      FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.camera,
        color: Colors.black,),
      ):
      _tabController.index == 1 ?
      FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.message,
          color: Colors.black,),
      ) :
      _tabController.index == 2 ?
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.edit,
                color: Colors.black,),
            ),
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.camera_alt,
              color: Colors.black,),
          )
        ],
      ):
      FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_call,
          color: Colors.black,),
      )
    );
  }
}
