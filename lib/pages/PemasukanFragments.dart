import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PemasukanFragments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: 4, // the length
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('A card that can be tapped'),
                ),
              ),
            ),
          );
        }
        );
  }

}