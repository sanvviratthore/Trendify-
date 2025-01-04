import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For opening URLs

class ArticlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = [
      {
        'title': 'Top fashion trends for 2025: A look into the Future ',
        'description': 'Explore the hottest styles and trends taking over this year.',
        'image':
            'https://heuritech.com/wp-content/uploads/2024/10/Untitled-design.png.webp',
        'link': 'https://heuritech.com/fashion-trends-2025/',
      },
      {
        'title': 'The Top Spring 2025 Fashion Trends You Can Shop and Wear Now',
        'description': 'Eco-friendly choices shaping the fashion industry.',
        'image':
            'https://hips.hearstapps.com/hmg-prod/images/14-tri-silverembellish-6712cb3d6ce06.jpg?resize=980:*',
        'link': 'https://www.vogue.com/article/spring-2025-fashion-trends',
      },
      {
        'title': 'The State of Fashion 2025: Challenges at every turn',
        'description': 'The global fashion industry faces economic uncertainty, a dynamic market, and consumer behavior shifts.',
        'image':
            'https://hips.hearstapps.com/hmg-prod/images/launchmetrics-hundred-s25-009-66ba9cae1a732.jpg?crop=1xw:1xh;center,top&resize=980:*',
        'link': 'https://www.mckinsey.com/industries/retail/our-insights/state-of-fashion',
      },
      {
        'title': 'The Best Spring 2025 Fashion Trends to Shop Now',
        'description': 'Here’s how to get a jump on some of our favorite new looks, from the layers at Miu Miu to the asymmetrical skirts at Bottega Veneta.',
        'image':
            'https://hips.hearstapps.com/hmg-prod/images/screen-shot-2024-10-05-at-3-05-53-pm-670192fe2406d.png?resize=980:*',
        'link': 'https://www.harpersbazaar.com/fashion/trends/a62302060/spring-2025-fashion-trends/',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(article['image']!),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article['title']!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    article['description']!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      final url = article['link']!;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Could not open the link.')),
                        );
                      }
                    },
                    child: Text(
                      'Read More',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

