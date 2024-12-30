import '../models/event.dart';
import 'package:latlong2/latlong.dart';
import '../models/musician.dart';

class EventService {
  Future<List<Event>> getEvents() async {
    // ここでバックエンドAPIへのリクエストやローカルデータソースからの読み込みを行う
    // 例として、遅延をシミュレート
    await Future.delayed(const Duration(milliseconds: 200));

    final musicians1 = [
      Musician(id: 1, name: 'John Doe'),
      Musician(id: 2, name: 'Jane Smith'),
    ];
    final musicians2 = [
      Musician(id: 3, name: 'Taro Yamada'),
    ];
    final musicians3 = [
      Musician(id: 4, name: 'Hanako Tanaka'),
      Musician(id: 5, name: 'Ken Sato'),
    ];

    return [
      Event(
        id: 1,
        name: '夏の音楽祭',
        description: '最高の音楽と夏の思い出をあなたに！',
        date: DateTime(2024, 8, 10),
        location: LatLng(35.681, 139.760),
        musicians: musicians1,
      ),
      Event(
        id: 2,
        name: '秋の収穫祭',
        description: '秋の味覚を満喫しよう！',
        date: DateTime(2024, 10, 20),
        location: LatLng(35.675, 139.770),
        musicians: musicians2,
      ),
      Event(
        id: 3,
        name: '冬のイルミネーション',
        description: '幻想的な光の世界へ！',
        date: DateTime(2024, 12, 25),
        location: LatLng(35.687, 139.775),
        musicians: musicians3,
      ),
    ];
  }
}