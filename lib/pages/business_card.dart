import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          width: 300,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.center, // center == 디폴트 값
                // a Row's cross axis is vertical
                // a Column's cross axis is horizontal.
                children: [
                  const Padding(
                      padding: EdgeInsets.all(8.0),
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
              ),
              Column(children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('성동구 상원길 80'),
                    Text('010-0000-0000'),
                  ],
                ),
                const SizedBox(height: 16),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    Icons.accessibility,
                  ),
                  Icon(Icons.timer),
                  Icon(Icons.phone_android),
                  Icon(Icons.phone_iphone),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
