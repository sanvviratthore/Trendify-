import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/app_drawer.dart';
import 'package:myapp/artistspage.dart';
import 'package:myapp/articlespage.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the ArticlesPage

class TrendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trends & Discoveries'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Fashion Trends',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CarouselSlider(
                items: [
                  Image.network(
                    'https://images.pexels.com/photos/1926769/pexels-photo-1926769.jpeg?auto=compress&cs=tinysrgb&w=600',
                    fit: BoxFit.fill,
                  ),
                  Image.network(
                    'https://images.pexels.com/photos/1721558/pexels-photo-1721558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://images.pexels.com/photos/1566421/pexels-photo-1566421.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                  height: 300,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  viewportFraction: 0.8,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Trending Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Chip(
                      label: Text('Fashion', style: TextStyle(
                        color: Colors.white,
                      ),),
                      backgroundColor: Colors.pinkAccent,
                      onDeleted: null,
                    ),
                    SizedBox(width: 10),
                    Chip(
                      label: Text('Technology', style: TextStyle(
                        color: Colors.white,)
                        ),
                      backgroundColor: Colors.blueAccent,
                      onDeleted: null,
                    ),
                    SizedBox(width: 10),
                    Chip(
                      label: Text('Lifestyle', style: TextStyle(
                        color: Colors.white,)
                      ),
                      backgroundColor: Colors.greenAccent,
                      onDeleted: null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'What''s Trending?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.trending_up, color: Colors.blue),
                    title: Text('Sustainable Fashion'),
                    subtitle: Text('Eco-friendly and ethical choices in clothing.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.trending_up, color: Colors.blue),
                    title: Text('Vintage Revival'),
                    subtitle: Text('Classic looks making a modern comeback.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.trending_up, color: Colors.blue),
                    title: Text('Tech Wear'),
                    subtitle: Text('Clothing with a futuristic and functional vibe.'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Trend Spotlight',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://images.pexels.com/photos/292999/pexels-photo-292999.jpeg?auto=compress&cs=tinysrgb&w=600',
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sustainable Fashion: Leading the Charge in 2025',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Sustainable fashion is no longer a niche; it’s becoming mainstream. Find out how ethical brands are leading the charge.',
                        style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 102, 99, 99)),
                      ),
                    ),
                    SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the article or open a link
            const articleUrl = 'https://modistas.com.au/blogs/blogs/sustainable-fashion-trends-in-2025?srsltid=AfmBOoreDdAncDy8kiWpqdA1XG58u65Qc0Gu1J8C8ALDfIvZ8Pufox-v';
            launchURL(articleUrl);
          },
          child: Text('Read Article', style: TextStyle(
            color: Colors.blue
          ),),
        ),)
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the ArticlesPage when clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ArticlesPage()),
                      );
                    },
                    child: Text('View Articles', style: TextStyle(
                      color: Colors.blueAccent
                    ),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the ArtistsPage when clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ArtistsPage()),
                      );
                    },
                    child: Text('Connect with Artists', style: TextStyle(
                      color: Colors.blueAccent
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}