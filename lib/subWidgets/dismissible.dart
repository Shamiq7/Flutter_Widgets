import 'package:flutter/material.dart';
import 'package:flutter_widgets/list.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dismissible Widget'), centerTitle: true),
      body: ListView.builder(
        itemCount: Alphabet.length,
        itemBuilder: (context, index) {
          final item = Alphabet[index];
          // 
          // 
          // 
          return Dismissible(
            onDismissed: (direction) {
              setState(() {
                Alphabet.removeAt(index);
              });
              if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(item.name),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(item.name),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },

            key: Key(Alphabet.toString()),
            background: Container(color: Colors.red),
            secondaryBackground: Container(color: Colors.green),
            child: Card(child: ListTile(title: Text(item.name))),
          );
        },
      ),
    );
  }
}
