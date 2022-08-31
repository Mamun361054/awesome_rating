import 'package:flutter/material.dart';
import 'package:awesome_rating/awesome_rating.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Awesome rating',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Awesome rating Page'),
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            _DemoItem2(),
            SizedBox(height: 24.0,),
            _DemoItem1(),
          ],
        ),
      ),
    );
  }
}

class _DemoItem1 extends StatelessWidget {

  const _DemoItem1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AwesomeStarRating(
              starCount: 5,
              rating: 1.0,
              size: 30.0,
              color: Colors.orange,
              borderColor: Colors.orange,
            ),
            const SizedBox(width: 8.0),
            Text(
              '1 reviews',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AwesomeStarRating(
              starCount: 5,
              rating: 2.0,
              size: 30.0,
              color: Colors.orange,
              borderColor: Colors.orange,
            ),
            const SizedBox(width: 8.0),
            Text(
              '2 reviews',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AwesomeStarRating(
              starCount: 5,
              rating: 3.0,
              size: 30.0,
              color: Colors.orange,
              borderColor: Colors.orange,
            ),
            const SizedBox(width: 8.0),
            Text(
              '3 reviews',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AwesomeStarRating(
              starCount: 5,
              rating: 4.0,
              size: 30.0,
              color: Colors.orange,
              borderColor: Colors.orange,
            ),
            const SizedBox(width: 8.0),
            Text(
              '4 reviews',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AwesomeStarRating(
              starCount: 5,
              rating: 5.0,
              size: 30.0,
              color: Colors.orange,
              borderColor: Colors.orange,
            ),
            const SizedBox(width: 8.0),
            Text(
              '5 reviews',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}

class _DemoItem2 extends StatefulWidget {
  const _DemoItem2({Key? key}) : super(key: key);

  @override
  State<_DemoItem2> createState() => _DemoItem2State();
}

class _DemoItem2State extends State<_DemoItem2> {

  double rating = 4.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AwesomeStarRating(
          starCount: 5,
          rating: rating,
          size: 30.0,
          color: Colors.orange,
          onRatingChanged: (double value){
            setState((){
              rating = value;
            });
          },
          borderColor: Colors.orange,
        ),
        const SizedBox(height: 8.0),
        Text(
          'tap to update rating',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

