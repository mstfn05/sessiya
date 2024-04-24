import 'package:flutter/material.dart';

class News {
  String title;
  String content;
  String imageUrl; // Добавлено поле для URL-адреса изображения

  News(this.title, this.content, this.imageUrl);
}

class Insta extends StatelessWidget {
  final List<News> sportsNews = [
    News(
      'Разнооборазие цветов',
      'Цветы на ваш вкус:розы,тюлпаны,орхидеи,лизиантусы,пионы и тд ',
      'data:image/jpeg;base64,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', // Пример URL-адреса изображения
    ),
    News(
      'Доставка по всему по всему городу',
      'Заказывай доставку к себе домой и мы привезем их вцелости и сохраности.Доставка в квадрате бесплатно.',
      'data:image/jpeg;base64,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', // Пример URL-адреса изображения
    ),
    News(
      'Оформление',
      'Оформим вам букет на ваш вкус! В полиэтелен, бумага, сетка, красивый горшок',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnJdEWG-fbwp0cMS4eulSxPukXFnZJg41GZg&usqp=CAU', // Пример URL-адреса изображения
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: sportsNews.length,
          itemBuilder: (context, index) {
            final news = sportsNews[index];
            return NewsCard(news: news);
          },
        ),
      ),
    );
  }
}

class NewsCard extends StatefulWidget {
  final News news;

  const NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  int likes = 0;
  int dislikes = 0;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.news.title),
            subtitle: Text(widget.news.content),
            leading: Image.network(
              widget.news.imageUrl,
              width: 100, // Ширина изображения
              height: 100, // Высота изображения
              fit: BoxFit.cover, // Масштабирование изображения для заполнения области
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  color: isLiked ? Colors.red : null,
                ),
                onPressed: () {
                  setState(() {
                    if (!isLiked) {
                      likes++;
                    } else {
                      likes--;
                    }
                    isLiked = !isLiked;
                  });
                },
              ),
              Text('$likes'),
              IconButton(
                icon: Icon(Icons.heart_broken),
                onPressed: () {
                  setState(() {
                    dislikes++;
                  });
                },
              ),
              Text('$dislikes'),
            ],
          ),
        ],
      ),
    );
  }
}