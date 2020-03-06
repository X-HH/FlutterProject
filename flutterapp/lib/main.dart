import 'package:flutter/material.dart';
import 'package:flutterapp/shared.dart';
import './adddiray.dart';
import './diarymodel.dart';
import './eventbus.dart';

void main() => shareData.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
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
      home: DiaryListPage(title: '一本日记'),
    );
  }
}

class DiaryListPage extends StatefulWidget {
  DiaryListPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _DiaryListPageState createState() => _DiaryListPageState();
}

class _DiaryListPageState extends State<DiaryListPage> {


  Widget buildListWidget(BuildContext context, diaryitem diary, int index) {
    return new GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new Adddiary(shareData.diaryList == null ? null : shareData.diaryList[index], index)),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
        child: new Row(
          children: <Widget>[
            new Container(
              width: 80,
              height: 60,
              child: new Column(
                children: <Widget>[
                  new Text(
                    diary.day,
                    style: new TextStyle(
                      fontSize: 28,
                      color: Color(0xff607d88),
                    ),
                  ),
                  new Text(
                    '${diary.month}/${diary.week}',
                    style: new TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ), 
            ),
            Expanded(
              child: new Container(
                constraints: BoxConstraints(
                  minHeight: 60,
                ),
                padding: EdgeInsets.all(10),
                color: Color(0xffF2F2F2),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    new Text(
                      diary.content,
                      maxLines: 6,
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        fontSize: 16,
                        color: Color(0xff607d88),
                      ),
                    ),
                    new Text(
                      diary.hourSecond,
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            )
            
          ],
        )
        
      ),
    );

    
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          new IconButton(
            color: Colors.white,
            icon: Icon(Icons.add, color: Colors.white), 
            
            onPressed: () { 
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new Adddiary(null, -1)),
              ); 
            },
          )
        ],
      ),
      body: Scrollbar(
        
        child: new ListView.builder(
          
          itemBuilder: (context, i){
            return buildListWidget(context, shareData.diaryList == null ? null:shareData.diaryList[i], i);
          },
          itemCount: shareData.diaryList == null ? 0 : shareData.diaryList.length,
        ), 

      ),
      
    );
  }
}
