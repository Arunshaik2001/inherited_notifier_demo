import 'package:flutter/material.dart';
import 'package:inherited_notifier_demo/slide_data.dart';
import 'package:inherited_notifier_demo/slide_inherited_notifier.dart';

void main() {
  runApp(const MyApp());
}

final SlideData slideData = SlideData();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SliderInheritedNotifier(
          slideData: slideData,
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Slider(value: SliderInheritedNotifier.of(context), onChanged: (value) {
                    slideData.value = value;
                  }),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Opacity(
                        opacity: SliderInheritedNotifier.of(context),
                        child: Container(
                          color: Colors.yellow,
                          height: 200,
                        ),
                      ),
                      Opacity(
                        opacity: SliderInheritedNotifier.of(context),
                        child: Container(
                          color: Colors.blue,
                          height: 200,
                        ),
                      )
                    ].expandEqually().toList(),
                  )
                ],
              );
            }
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map((e) => Expanded(child: e));
}
