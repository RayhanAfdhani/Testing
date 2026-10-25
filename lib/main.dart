import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comic Books App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class ComicModel {
  final String title;
  final String category;
  final String description;
  final Color color;
  final Color textColor;

  const ComicModel({
    required this.title,
    required this.category,
    required this.description,
    required this.color,
    required this.textColor,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<ComicModel> comics = [
    ComicModel(
      title: 'Boku no Hero Academia',
      category: 'Manga',
      description: 'Boku no Hero Academia adalah manga shōnen Jepang karya Kohei Horikoshi yang mengisahkan tentang Izuku Midoriya, seorang anak tanpa kekuatan di dunia di mana hampir semua orang memilikinya. Ia kemudian bertemu All Might dan mulai perjalanan menjadi pahlawan.',
      color: Colors.amber,
      textColor: Colors.amber,
    ),
    ComicModel(
      title: 'Jujutsu Kaisen',
      category: 'Manga',
      description: 'Jujutsu Kaisen adalah manga shōnen Jepang karya Gege Akutami. Bercerita tentang Yuji Itadori yang terlibat dalam dunia kutukan setelah menelan salah satu jari Ryomen Sukuna. Manga ini terbit di Weekly Shōnen Jump sejak 2018 dan diadaptasi menjadi anime populer.',
      color: Colors.blue,
      textColor: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("M. Rayhan Ramadhan Afdhani's Comic Books"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: comics.length,
        itemBuilder: (context, index) {
          final comic = comics[index];
          return ListTile(
            leading: CircleAvatar(backgroundColor: comic.color, radius: 12),
            title: Text(
              comic.title,
              style: TextStyle(
                color: comic.textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(comic: comic),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final ComicModel comic;

  const DetailScreen({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comic.title),
        backgroundColor: comic.color,
        foregroundColor: Colors.black, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              comic.title,
              style: TextStyle(
                color: comic.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manga',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              comic.description,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'KEMBALI',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}