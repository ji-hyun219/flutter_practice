import 'package:flutter/material.dart';

class BuildingLayouts extends StatelessWidget {
  const BuildingLayouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [const TitleWidget(), ButtonSection(), TextBox()])),
    );
  }

  Container TextBox() {
    return Container(
        width: 200,
        child: Text(
            'sjkfldjsflsjdflksdjflkdsjlfgkjsdlfjsdlkjfsdklfjlskadjflskaffsjflsdahfsdhafsdafssdfsdhflsdfhlsdifhsdldhflishlfi'));
  }

  Container ButtonSection() {
    return Container(
      width: 250,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.call, color: Colors.blue)),
          Text('CALL', style: TextStyle(color: Colors.blue))
        ]),
        Column(children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.call, color: Colors.blue)),
          Text('CALL', style: TextStyle(color: Colors.blue))
        ]),
        Column(children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.call, color: Colors.blue)),
          Text('CALL', style: TextStyle(color: Colors.blue))
        ]),
      ]),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Oeschinen Lake Campground'),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red),
          Text('41'),
        ],
      ),
    );
  }
}
