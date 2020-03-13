import 'package:flutter/material.dart';
import 'package:flutterapp/shared.dart';
import './diarymodel.dart';
import './nativepg.dart';
import './eventbus.dart';

class Adddiary extends StatelessWidget {
  diaryitem _diary;
  int _diaryIndex;
  String textContent;
  Adddiary(diaryitem diary, int index) {
    if (diary != null) {
      this._diary = diary;
      this.textContent = diary.content;
    }

    this._diaryIndex = index;    
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('写日记'),
          // leading: IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () { Navigator.pop(context); },
          // ),
          actions: <Widget>[
            new IconButton(
              color: Colors.white,
              // icon: Icon(Icons.save, color: Colors.white), 
              icon: ImageIcon(AssetImage('images/diaryadd.png')),
              onPressed: () { 
                _doAction();
                if (textContent.length > 0) {
                  if (_diaryIndex > -1) {
                    if (textContent != _diary.content) {
                      _diary.content = textContent;
                      shareData.replaceDiaryData(_diary, _diaryIndex);
                      Navigator.pop(context);
                    } else {
                      showDialogWithText(context, '请修改日记内容后进行保存');
                    }
                  } else {
                    int timeNow = DateTime.now().millisecondsSinceEpoch;
                    String timeStr = '$timeNow';
                    diaryitem item = diaryitem(textContent, timeStr);
                    shareData.addDiaryData(item);
                    // bus.emit('adddiary', 'add');
                    Navigator.pop(context);
                  }
                } else {
                  showDialogWithText(context, '请输入日记内容，日记不能为空');
                }
              },
            )
          ],
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.all(8),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: Color(0xfff2f2f2),
                ),
                constraints: BoxConstraints(
                  minHeight: 100,
                ),
                child: new TextField(
                  maxLines: 6,
                  controller: TextEditingController.fromValue(TextEditingValue(
                    text: _diary != null ? _diary.content : '',
                    selection: TextSelection.fromPosition(TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: _diary != null ? _diary.content.length : 0))
                  )),
                  decoration: InputDecoration(
                    
                    // labelText: _diary != null ? _diary.content : '',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      // borderSide: BorderStyle.none,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xff607d88),
                    ),
                    hintText: '记录今天...',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    )
                  ),
                  
                  onChanged: (String content){
                    print('$content');
                    textContent = '$content';
                  },
                ),
              )
              
            ],
          )
        ),
      ),
    );
  }

  void showDialogWithText(BuildContext context, String text) {
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
            title: new Text('提示'),
            content: new SingleChildScrollView(
                child: new ListBody(
                    children: <Widget>[
                        new Text(text),
                    ],
                ),
            ),
            actions: <Widget>[
                new FlatButton(
                    child: new Text('确定'),
                    onPressed: () {
                        Navigator.of(context).pop();
                    },
                ),
            ],
        );
    },
    ).then((val) {
        print(val);
    });
  }

  Future<void> _doAction()  async {
    String result = await dynativepg.call('adddiary', {'methodName': 'adddiary', 'content': 'test content'});
  }
}

