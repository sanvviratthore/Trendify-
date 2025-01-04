import 'package:flutter/material.dart';

class ArtistsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect with Artists'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trendy Artists',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Wrap the ListView with SingleChildScrollView to allow scrolling
              Column(
                children: [
                  ArtistTile(name: 'Stella McCartney', description: 'Fashion designer', imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQnd8pTxKsLRdKDqrZHx1qpM6uS-tZIONiWzAssJhFNEzmRv8LOmA_yKC6PDy1tdCsKIVr5WUUum16ltQ-kQcU36Q'),
                  ArtistTile(name: 'Anita Dogre', description: 'Sustainable Fashion Designer', imageUrl: 'https://www.bollywoodshaadis.com/img-scale/640/article-20231233813141447654000.webp'),
                  ArtistTile(name: 'Sabyasachi Mukherjee', description: 'Fashion designer', imageUrl: 'https://cdn.shopify.com/s/files/1/0447/0630/0063/files/Sabyasachi_Mukherjee_-_Top_Indian_Fashion_Designers_480x480.jpg?v=1713276937'),
                  ArtistTile(name: 'Manish Malhotra', description: 'Designer', imageUrl: 'https://cdn.shopify.com/s/files/1/0447/0630/0063/files/Manish_Malhotra_-_Top_Indian_Fashion_Designers_480x480.jpg?v=1713277132'),
                  ArtistTile(name: 'Neeta Lulla', description: 'Fashion Designer', imageUrl: 'https://cdn.shopify.com/s/files/1/0447/0630/0063/files/Neeta_Lulla_-_Top_Indian_Fashion_Designers_480x480.jpg?v=1713277261'),
                  ArtistTile(name: 'Anamika Khanna', description: 'Fashion Designer', imageUrl: 'https://cdn.shopify.com/s/files/1/0447/0630/0063/files/Anamika_Khanna_-_Top_Indian_Fashion_Designers_480x480.jpg?v=1713282442'),
                  ArtistTile(name: 'Masaba Gupta', description: 'Fashion Designer', imageUrl: 'https://cdn.shopify.com/s/files/1/0447/0630/0063/files/Masaba_Gupta_-_Top_Indian_Fashion_Designers_480x480.jpg?v=1713282897'),
                  ArtistTile(name: 'Anna Sui', description: 'Fashion Designer', imageUrl: 'https://t2.gstatic.com/licensed-image?q=tbn:ANd9GcRGj4HVL8pm14_rs7B0LxsoxoOhG4mxtM8Y4FMCzoaKBKlsY48H43AeH89K4JngYfr3'),
                  ArtistTile(name: 'Nick Cave', description: 'Fashion Designer', imageUrl: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcS8Q770a5S2vCiaoCbnZ8DoHIxPSnwiBlFaA0VoYJ5jXBGqgb83vM8lsoNcQETSxv1A2serSG_AJWXOtgfZbI_neg'),
                  ArtistTile(name: 'Richard Haines', description: 'Fashion Designer', imageUrl: 'https://www.out.com/media-library/richard-haines-studio-home-marcus-morris.jpg?id=32795580&width=1200&height=900'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArtistTile extends StatefulWidget {
  final String name;
  final String description;
  final String imageUrl;

  ArtistTile({required this.name, required this.description, required this.imageUrl});

  @override
  _ArtistTileState createState() => _ArtistTileState();
}

class _ArtistTileState extends State<ArtistTile> {
  bool isConnected = false;

  void _toggleConnection() {
    setState(() {
      isConnected = !isConnected;  // Toggle the connection state
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.imageUrl),
      ),
      title: Text(widget.name),
      subtitle: Text(widget.description),
      trailing: ElevatedButton(
        onPressed: _toggleConnection,
        child: Text(isConnected ? 'Connected' : 'Connect', style: 
        TextStyle(color: isConnected ? Colors.purple : Colors.pink),),  // Change text based on connection state
      ),
    );
  }
}