import 'package:flutter/material.dart';
import 'package:video_stream_spike/views/better_player_view.dart';
import 'package:video_stream_spike/views/chewie_view.dart';
import 'package:video_stream_spike/views/flick_video_player_view.dart';
import 'package:video_stream_spike/views/video_player_view.dart';

const hlslink =
    'https://otfp-demo.global.ssl.fastly.net/tears_of_steel/1080p,720p,480p,360p,master.m3u8';
void main() {
  runApp(const MyApp());
}

final Map<String, WidgetBuilder> routes = {
  'chewie': (_) => const ChewieDemo(),
  'video_player': (_) => const VideoApp(),
  'flick_video_player': (_) => const FlickVideoPlayerView(),
  'better_player': (_) => const BetterPlayerView(),
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const _App(),
      routes: routes,
    );
  }
}

class _App extends StatelessWidget {
  const _App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (BuildContext context, int i) => ListTile(
          title: Text(routes.keys.elementAt(i)),
          onTap: () =>
              Navigator.of(context).pushNamed(routes.keys.elementAt(i)),
        ),
      ),
    );
  }
}
