import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vanilla Example'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list_sharp),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),

      ),
    );
  }
}
