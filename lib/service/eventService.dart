import 'package:latlong2/latlong.dart';
import '../models/event.dart';
import '../models/musician.dart';
import 'package:intl/intl.dart';

class EventService {
  Future<List<Event>> getEvents({required DateTime date, required LatLng location}) async {
    // API endpoint (replace with your actual one)
    final String apiUrl = 'YOUR_API_ENDPOINT?date=${date.toIso8601String()}&lat=${location.latitude}&lng=${location.longitude}';

    try {
      // APIリクエストを行う場合はここに追加
      // final response = await http.get(Uri.parse(apiUrl));
      // ... (APIからのデータ処理)

      // モックデータを使用する場合
      final List<Event> events = _mockEvents.where((event) {
        //日付のみを比較
        return DateFormat('yyyy-MM-dd').format(event.date) == DateFormat('yyyy-MM-dd').format(date);
      }).toList();
      return Future.delayed(Duration(milliseconds: 500), () => events); // 擬似的な遅延を追加
    } catch (e) {
      print('Error during API request: $e');
      return []; // Return empty list on error
    }
  }

  // Mock data (for testing without API)
  final List<Event> _mockEvents = [
    Event(
      id: 1,
      name: '冬の音楽祭',
      description: '最高の音楽と冬の思い出をあなたに！',
      date: DateTime(2024, 12, 31),
      location: LatLng(35.581, 139.767),
      musicians: [Musician(id: 1, name: 'アーティストA')],
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTv9lnvTEDNGGVv-_GZXVmPLZjZl0uYn-rK7JBIjfCsDQ5DOEwCdTR0DkXohrtbXZAG4qGfxdZljL4EmKNOYFiXZmvnROwFZ2EFpoAOgC4u',
    ),
    Event(
      id: 2,
      name: 'ウィンターフェスティバル',
      description: '極寒の中、熱い音楽をお楽しみください！',
      date: DateTime(2024, 12, 30),
      location: LatLng(35.682, 139.768),
      musicians: [Musician(id: 2, name: 'アーティストB')],
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTv9lnvTEDNGGVv-_GZXVmPLZjZl0uYn-rK7JBIjfCsDQ5DOEwCdTR0DkXohrtbXZAG4qGfxdZljL4EmKNOYFiXZmvnROwFZ2EFpoAOgC4u',
    ),
    Event(
      id: 3,
      name: 'beautiful music festival',
      description: '高原の美しい景色と音楽をお楽しみください！',
      date: DateTime(2024, 12, 30),
      location: LatLng(35.2750995, 139.6175),
      musicians: [Musician(id: 3, name: 'アーティストC')],
      imageUrl: 'https://rykeydaddydirty.com/wp-content/uploads/jacket02.jpg',
    ),
    Event(
      id: 4,
      name: 'カウントダウンパーティー~音楽とともに~',
      description: 'カウントダウンを音楽とともに！ 2024年を音楽で締めくくろう！',
      date: DateTime(2024, 12, 31),
      location: LatLng(35.4437, 139.6407),
      musicians: [Musician(id: 3, name: 'アーティストC')],
      imageUrl: 'https://scontent-nrt1-2.xx.fbcdn.net/v/t51.75761-15/470809190_18377202370108115_2562996050921243045_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=127cfc&_nc_ohc=Sag7pN2zwvIQ7kNvgH9Owxg&_nc_zt=23&_nc_ht=scontent-nrt1-2.xx&_nc_gid=Agpmj68bVFmYM2HXn6KKdiE&oh=00_AYB5_CgzrA1Vlja1dPAsaCpzLRZEhXHNqM-rElr8mpd0oQ&oe=67780249',
    ),
    Event(
      id: 5,
      name: '僕らのmusic',
      description: '音楽で繋がる、新しい年へ！',
      date: DateTime(2024,12,31),
      location: LatLng(35.700, 139.750),
      musicians: [Musician(id: 3, name: 'アーティストC')],
      imageUrl: 'https://scontent-nrt1-2.xx.fbcdn.net/v/t51.75761-15/470809190_18377202370108115_2562996050921243045_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=127cfc&_nc_ohc=Sag7pN2zwvIQ7kNvgH9Owxg&_nc_zt=23&_nc_ht=scontent-nrt1-2.xx&_nc_gid=AONQA3eXLdw0EGBrqFr-IwG&oh=00_AYBEw4pPE3ItCvib1GOoe-ljutlKuFAelPaoxcrJAChbXg&oe=6777CA09',
    ),
    Event(
      id: 6,
      name: 'Kアリーナ音楽祭 2024',
      description: '音楽で新年を迎えよう！',
      date: DateTime(2024, 12, 31), //横浜Kアリーナ
      location: LatLng(35.464444, 139.630556),
      musicians: [Musician(id: 1, name: 'アーティストA')],
      imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTv9lnvTEDNGGVv-_GZXVmPLZjZl0uYn-rK7JBIjfCsDQ5DOEwCdTR0DkXohrtbXZAG4qGfxdZljL4EmKNOYFiXZmvnROwFZ2EFpoAOgC4u',
    ),
  ];
}