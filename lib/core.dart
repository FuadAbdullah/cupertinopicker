import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> _itemContent = [
  "Apple",
  "Samsung",
  "Huawei",
  "Xiaomi",
  "Motorola",
  "Vivo",
  "Panzerkampfwagen"
];

List<String> _options = ["Birth", "Egg"];
List<String> _catA = ["Cat", "Dog", "Mouse", "Lion", "Whale"];
List<String> _catB = ["Duck", "Chicken", "Platypus", "Lizard"];
int _index = 0;

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "Cupertino Test",
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino Test"),
        centerTitle: true,
      ),
      body: MiddlePart(),
      endDrawer: Drawer(),
    );
  }
}

class MiddlePart extends StatefulWidget {
  const MiddlePart({Key? key}) : super(key: key);

  @override
  _MiddlePartState createState() => _MiddlePartState();
}

class _MiddlePartState extends State<MiddlePart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CupertinoButton(
              child: Text("Press to display single column picker"),
              onPressed: () => popBottomSheet(context, 1)),
          CupertinoButton(
              child: Text("Press to display multi-column picker"),
              onPressed: () => popBottomSheet(context, 2)),
          CupertinoButton(
              child: Text("Press to display responsive, multi-column picker"),
              onPressed: () => popBottomSheet(context, 3))
        ],
      ),
      alignment: Alignment.center,
    );
  }

  bottomSheetHandler(type) {
    switch (type) {
      case 1:
        return Expanded(child: CupertinoSinglePicker());
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(child: CupertinoSinglePicker(), width: 150, height: 200),
            SizedBox(child: CupertinoSinglePicker(), width: 150, height: 200),
          ],
        );
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(child: CupertinoCause(), width: 150, height: 200),
            SizedBox(child: CupertinoReact(), width: 150, height: 200),
          ],
        );
    }
  }

  popBottomSheet(BuildContext context, type) {
    return showModalBottomSheet(
        context: context,
        builder: (_) =>
            StatefulBuilder(builder: (BuildContext ctx, StateSetter str) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black12,
                            blurRadius: 14,
                            spreadRadius: 4,
                            offset: Offset(0, -5)),
                      ]),
                  height: 300,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      bottomSheetHandler(type),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CupertinoButton(
                          child: Text("Return"),
                          onPressed: () => {Navigator.of(context).pop()},
                        ),
                      ),
                    ],
                  ));
            }),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        backgroundColor: Colors.white);
  }
}

class CupertinoSinglePicker extends StatefulWidget {
  const CupertinoSinglePicker({Key? key}) : super(key: key);

  @override
  _CupertinoSinglePickerState createState() => _CupertinoSinglePickerState();
}

class _CupertinoSinglePickerState extends State<CupertinoSinglePicker> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 50,
      children: <Widget>[
        for (String option in _itemContent)
          Center(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              option,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ))
      ],
      onSelectedItemChanged: (value) {},
      scrollController: FixedExtentScrollController(initialItem: 0),
    );
  }
}

class CupertinoCause extends StatefulWidget {
  const CupertinoCause({Key? key}) : super(key: key);

  @override
  _CupertinoCauseState createState() => _CupertinoCauseState();
}

class _CupertinoCauseState extends State<CupertinoCause> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 50,
      children: <Widget>[
        for (String option in _options)
          Center(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              option,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ))
      ],
      onSelectedItemChanged: (value) {
        setState(() {
          _index = value == 0 ? 0 : 1;
        });
      },
      scrollController: FixedExtentScrollController(initialItem: 0),
    );
  }
}

class CupertinoReact extends StatefulWidget {
  const CupertinoReact({Key? key}) : super(key: key);

  @override
  _CupertinoReactState createState() => _CupertinoReactState();
}

class _CupertinoReactState extends State<CupertinoReact> {
  setDataModel() {
    return _index == 0 ? _catA : _catB;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 50,
      children: <Widget>[
        for (String option in setDataModel())
          Center(
              child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              option,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ))
      ],
      onSelectedItemChanged: (value) {
        switch (value) {
          case 0:
        }
      },
      scrollController: FixedExtentScrollController(initialItem: 0),
    );
  }
}
