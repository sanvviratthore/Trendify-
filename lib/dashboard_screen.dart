import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/app_drawer.dart';
import 'trendspage.dart';
import 'settings.dart'; 
import 'package:url_launcher/url_launcher.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Track the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TrendsPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
    }
  }

 Widget _buildNewsCard(BuildContext context,
    {required String imageUrl, required String title, required String subtitle, required String link}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  if (await canLaunch(link)) {
                    await launch(link);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Indicate it's clickable
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trend Dynamics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Trend Graph
              Container(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: true),
                    borderData: FlBorderData(show: true),
                    minX: 0,
                    maxX: 7,
                    minY: 0,
                    maxY: 10,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 3),
                          FlSpot(1, 5),
                          FlSpot(2, 4),
                          FlSpot(3, 7),
                          FlSpot(4, 6),
                          FlSpot(5, 8),
                          FlSpot(6, 7),
                        ],
                        isCurved: true,
                        color: Colors.blue,
                        barWidth: 4,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Key Metrics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MetricCard(label: 'Active Users', value: '1,230'),
                  MetricCard(label: 'Revenue', value: '\$12,340'),
                  MetricCard(label: 'Conversion Rate', value: '72%'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'News & Updates',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildNewsCard(
                      context,
                      imageUrl: 'https://r.fashionunited.com/xAL_c9bUC6_AD4Qd68ecqCa7H_XX7XXKMC4Fr9qaGdQ/resize:fill-down:720:480:0/gravity:ce/quality:70/aHR0cHM6Ly9mYXNoaW9udW5pdGVkLmNvbS9pbWcvdXBsb2FkLzIwMjIvMTEvMDMvMjEtaDEtc3VzdGFpbmFiaWxpdHktYmxvZy1kdXJhYmlsaXR5LWhlYWRlci0xLTkxcW9mZmd1LTIwMjItMDEtMzEtMDIxZmdwYXMtMjAyMi0xMS0wMy5qcGVn',
                      title: 'Levi’s defends iconic tab trademark in legal battle with Philipp Plein',
                      subtitle: 'By Don-Alvin Adegeest, 20 Dec 2024',
                      link: 'https://fashionunited.in/news/fashion/levis-defends-iconic-tab-trademark-in-legal-battle-with-philipp-plein/2024122048138',
                    ),
                    _buildNewsCard(
                      context,
                      imageUrl: 'https://r.fashionunited.com/7FjLZZUYzgXMxtDdV1HutOB9zC1az-9-rDOBYJAR-eo/resize:fill-down:720:480:0/gravity:ce/quality:70/aHR0cHM6Ly9mYXNoaW9udW5pdGVkLmNvbS9pbWcvdXBsb2FkLzIwMjQvMDgvMDgvcmVzaWR1b3MtdGV4aXRsZXMtY2hpbGUtcG0zOWNrd3ktMjAyNC0wOC0wOC5qcGVn',
                      title: 'Tackling textile waste is a growing environmental challenge',
                      subtitle: 'By Tech Digest, December 27, 2024',
                      link: 'https://fashionunited.in/news/fashion/tackling-textile-waste-is-a-growing-environmental-challenge/2024122748185'
                    ),
                    _buildNewsCard(
                      context,
                      imageUrl: 'https://r.fashionunited.com/siQIuaqQ35gOGOkTm3gDXBNwAs4jTcy2lOabWInE__Y/resize:fill-down:720:480:0/gravity:ce/quality:70/aHR0cHM6Ly9mYXNoaW9udW5pdGVkLmNvbS9pbWcvdXBsb2FkLzIwMjQvMTEvMjUvaW1nLWo0azZnOWE1YjZpMGJnamZ2eHdlYWlyYi1zbm5lNHVoaC0yMDI0LTExLTI1LnBuZw',
                      title: 'Happy Holidays from FashionUnited!',
                      subtitle: 'By FashionUnited, 25 Dec 2024',
                      link: 'https://fashionunited.in/news/fashion/happy-holidays-from-fashionunited/2024122548165'
                    ),
                    _buildNewsCard(
                      context,
                      imageUrl: 'https://r.fashionunited.com/nI3coSddDzLdW08G_QrsXTCVVgA3OTnFaIjmzg2xOWc/resize:fill-down:720:480:0/gravity:ce/quality:70/aHR0cHM6Ly9mYXNoaW9udW5pdGVkLmNvbS9pbWcvdXBsb2FkLzIwMjQvMDkvMTcvZGlvci1ob21tZS1wZjIzLTAwNzYtd2V3bzVzMnYtMjAyMi0xMi0yOC00eDhlcnU2YS0yMDIzLTExLTI4LTBnbzU3NjVzLTIwMjQtMDktMTcuanBlZw',
                      title: 'Will luxury''s musical chairs continue in 2025 ?',
                      subtitle: 'By Don-Alvin Adegeest, 24 Dec 2024',
                      link: 'https://fashionunited.in/news/fashion/will-luxurys-musical-chairs-continue-in-2025/2024122448166'
                    ),
                    _buildNewsCard(
                      context,
                      imageUrl: 'https://r.fashionunited.com/p-HBKWqosTrSR-3Z5Sjw943xz7_tdV96wDxZu-ELtTQ/resize:fill-down:720:480:0/gravity:ce/quality:70/aHR0cHM6Ly9mYXNoaW9udW5pdGVkLmNvbS9pbWcvdXBsb2FkLzIwMjQvMTIvMjAvYm90dGVnYS12ZW5ldGEtYXRtLXMyNS0wMTAtMjFqbm4ydXQtMjAyNC0xMC0yMy15OTlheGVnNC0yMDI0LTEyLTIwLmpwZWc',
                      title: 'The 2025 luxury market outlook',
                      subtitle: 'By Don-Alvin Adegeest, 20 Dec 2024',
                      link: 'https://fashionunited.in/news/fashion/the-outlook-for-the-luxury-market-in-2025/2024122048144'
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Trends'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class MetricCard extends StatelessWidget {
  final String label;
  final String value;

  const MetricCard({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
