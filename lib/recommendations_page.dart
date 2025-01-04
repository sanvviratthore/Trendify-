import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Recommendations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Recommended for You',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildRecommendationCard(
                'Sustainable Chic',
                'Explore eco-friendly and ethical fashion choices.',
                'https://kasheshglobal.com/cdn/shop/articles/Challenges_Opportunities.jpg',
                'https://brownliving.in/'),
            _buildRecommendationCard(
              'Retro Vibes',
              'Classic looks making a modern comeback.',
              'https://images.stockcake.com/public/5/1/d/51d8a166-b315-4bda-9b96-e9da190ad339_large/urban-retro-style-stockcake.jpg',
              'https://www.kusmi.co.in/'
            ),
            _buildRecommendationCard(
              'Future Fashion',
              'Clothing with a futuristic and functional vibe.',
              'https://images.stockcake.com/public/9/3/8/938f6d8e-7212-410a-a4bc-393ceef5e275_large/futuristic-fashion-show-stockcake.jpg',
              'https://en.fromfuture.com/'
            ),
            _buildRecommendationCard(
              'Seasonal Picks',
              'Trending outfits for the current season.',
              'https://media.hobbs.com/image/upload/f_auto,q_auto,dpr_auto/hb-content/HBSharedLibrary/content-pages/best-winter-coats-2024/d-hero-coats-aw24.jpg',
              'https://seasonalpicks.gifts/'
            ),
            _buildRecommendationCard(
                'Accessories Trends',
                'Popular accessories like bags, hats, and jewelry that are trending.',
                'https://fashionista.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cg_xy_center%2Cq_auto:good%2Cw_1200%2Cx_1621%2Cy_1708/MjAwNjg0NTcyMjM1OTk4NTk0/mirror-palais-spring-2024-hair-ribbon-2.jpg',
                'https://www.myntra.com/unisex-accessories'
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(
      String title, String description, String imageUrl, String shoppingUrl) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image.network(
              imageUrl,
              width: 70,
              height: 100,
              fit: BoxFit.cover,
            ),
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(description),
            onTap: () {
              // Handle navigation to a detailed page for this recommendation
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Launch the shopping URL
                _launchShoppingSite(shoppingUrl);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 176, 215, 246), // Button color
              ),
              child: Text('Explore More', style: TextStyle(
                color: Colors.black
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper function to launch URLs
void _launchShoppingSite(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
