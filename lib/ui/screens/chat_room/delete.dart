import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      body: SizedBox(
        child: Column(children: [
          Text('0'),
          ListView.builder(itemBuilder: (context,index){
            return ListTile(
              title: Text('data'),
            );
            
          },
          itemCount: 10,),
        ],),
        
      ),
    );
  }
}
