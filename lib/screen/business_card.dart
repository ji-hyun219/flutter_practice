import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center, // center == 디폴트 값
              // a Row's cross axis is vertical
              // a Column's cross axis is horizontal.
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.account_circle, size: 50)),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flutter Jihyun',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Text('Experienced App Developer'),
                    ]),
              ],
            )),
      ),
    );
  }
}
