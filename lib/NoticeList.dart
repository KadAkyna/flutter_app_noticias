import 'package:flutter/material.dart';
import 'Notice.dart';
import 'NewsApiTwo.dart';

class NoticeList extends StatefulWidget{

  final state = new _NoticeListPageState();

  @override
  _NoticeListPageState createState() => state;

}

class _NoticeListPageState extends State<NoticeList> {


  List _news = new List();
  var repository = new NewsApiTwo();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('App de Noticias'),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: _getListViewWidget(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    loadNotices();
  }


  Widget _getListViewWidget() {
    var list = new ListView.builder(
        itemCount: _news.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index) {
          return _news[index];
        }
    );

    return list;
  }

  loadNotices() async {
    List result = await repository.loadNews();

    setState(() {
      result.forEach((item) {
        var notice = new Notice(
            item['url_img'],
            item['tittle'],
            item['date'],
            item['description']
        );


        _news.add(notice);
      });
    });
  }


}