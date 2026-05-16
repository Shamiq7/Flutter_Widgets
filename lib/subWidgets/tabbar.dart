// used when we dont want bottomNavigation or both
import 'package:flutter/material.dart';
import 'package:flutter_widgets/subWidgets/contactwidget.dart';

class Tabbar extends StatelessWidget {
  const Tabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 5,
          backgroundColor: Colors.white,

          title: Text('Tab Bar'),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.green,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,

            tabs: [
              Tab(icon: Icon(Icons.chat), text: 'CHAT'),
              Tab(icon: Icon(Icons.import_contacts), text: 'CONTACT'),
              Tab(icon: Icon(Icons.call), text: 'CALL'),
              Tab(icon: Icon(Icons.person_4), text: 'PROFILE'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              Contactwidget(),

              Container(
                child: Center(
                  child: Text('CONTACT', style: TextStyle(fontSize: 50)),
                ),
              ),
              Container(
                child: Center(
                  child: Text('CALL', style: TextStyle(fontSize: 50)),
                ),
              ),
              Container(
                child: Center(
                  child: Text('PROFILE', style: TextStyle(fontSize: 50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
DefaultTabController(
bottom: TabBar(
tabs : [
Tab()
Tab()
]

)
)
body: TabBarView(
children[
chatpage(),

]
)
 */