import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cupertino vs Material',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cupertino vs Material'),
        ),
        body: ButtonComparison(),
      ),
    );
  }
}

class ButtonComparison extends StatelessWidget {
  void _showMaterialDialog(BuildContext context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
  }

  void _showCupertinoDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 500,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(children: [
          SizedBox(
            height: 400,
            child: CupertinoDatePicker(
                initialDateTime: DateTime.now(), onDateTimeChanged: (val) {}),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => _showMaterialDialog(context),
            child: const Text('Material Button 1'),
          ),
          CupertinoButton(
            color: CupertinoColors.activeBlue,
            onPressed: () => _showCupertinoDialog(context),
            child: const Text('Cupertino Button 2'),
          ),
        ],
      ),
    );
  }
}
