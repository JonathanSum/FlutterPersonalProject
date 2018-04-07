import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';
void main()=>runApp(new MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState()=>new _MyAppState();
}
class _MyAppState extends State<MyApp>{
  List<Song> _songs;
  @override
  void initState(){
    super.initState();
    songs = await MusicFinder.allSongs();
    songs = new List.from(songs);

    setState((){
      _songs = songs;
    });
  }



  @override
  Widget build(BuildContext context){

    Widget home(){
      return new Scaffold(
      appBar: new AppBar(title: new Text("Music App"),
    ),
    body: new ListView.builder(
        itemCount:_songs.length,
        itemBuilder: (context, int index){
          return new ListTile(
            leading: new CircleAvatar(
              child: new Text(_songs[index].title[0]),
            ),
            title: new Text(_songs[index].title),
          );
        },
    )
    );
    }
    return new MaterialApp(
      home: home(),
    );
  }
}