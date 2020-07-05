import 'package:flutter/material.dart';
import 'Notice.dart';
import 'NewsApiTwo.dart';

class NoticeList extends StatefulWidget{

  final state = new _NoticeListPageState();

  @override
  _NoticeListPageState createState() => state;

}

class _NoticeListPageState extends State<NoticeList>{

  List _news = new List();
  var repository = new NewsApiTwo();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(),
      body: new Container(
        child: _getListViewWidget(),
      ),
    );

  }

  @override
  void initState() {

    loadNotices();

  }

  Widget _getListViewWidget(){

    var list = new ListView.builder(
        itemCount: _news.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index){
          return _news[index];
        }
    );

    return list;
  }

  loadNotices() async{

    List<Map<String, Map<String, dynamic>>> results = await repository.loadNews();

    setState(() {


      for (final row in results) {
        var notice = new Notice(
          row["notices"]["url_img"],
          row["notices"]["tittle"],
          row["notices"]["date"],
          row["notices"]["description"]
        );


        _news.add(notice);

      }
  });
}
}
