import 'package:flutter/material.dart';
import 'package:map_app/screens/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView( // ListViewに変更
        children: <Widget>[
          ListTile( // リスト項目
            leading: const Icon(Icons.map), // アイコン
            title: const Text('イベント検索マップ'), // タイトル
            onTap: () { // タップ時の処理
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapWidget()),
              );
            },
          ),
          // 他の機能もここに追加
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('イベント検索'),
            onTap: () {
              // イベント検索の処理
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('イベントカレンダー'),
            onTap: () {
              // イベントカレンダーの処理
            },
          ),
          // ...
        ],
      ),
    );
  }
}