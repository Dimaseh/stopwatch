import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'favorit_page.dart';

class SitusRekomendasiPage extends StatefulWidget {
  final Set<Situs> favoriteSites;
  final Function(Set<Situs>) onFavoritesChanged;

  const SitusRekomendasiPage({
    Key? key,
    required this.favoriteSites,
    required this.onFavoritesChanged,
  }) : super(key: key);

  @override
  State<SitusRekomendasiPage> createState() => _SitusRekomendasiPageState();
}

class _SitusRekomendasiPageState extends State<SitusRekomendasiPage> {
  late Set<Situs> favoriteSites;

  @override
  void initState() {
    super.initState();
    favoriteSites = widget.favoriteSites;
  }

  @override
  Widget build(BuildContext context) {
    final List<Situs> situsList = [
      Situs(
        name: 'Spada Tercinta',
        url: 'https://spada.upnyk.ac.id/my/',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4pSK5o0rYOhjI1XkqJ6UaQG17Sv6dkyckag&s',
      ),
      Situs(
        name: 'Youtube',
        url: 'https://www.youtube.com/',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png',
      ),
      Situs(
        name: 'Twitter',
        url: 'https://x.com/home',
        imageUrl:
            'https://cdn.prod.website-files.com/5d66bdc65e51a0d114d15891/64cebc6c19c2fe31de94c78e_X-vector-logo-download.png',
      ),
      Situs(
        name: 'Instagram',
        url: 'https://www.instagram.com/',
        imageUrl:
            'https://png.pngtree.com/png-clipart/20180518/ourmid/pngtree-instagram-icon-instagram-logo-png-image_3571406.png',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Situs Rekomendasi'),
      ),
      body: ListView.builder(
        itemCount: situsList.length,
        itemBuilder: (context, index) {
          final situs = situsList[index];
          final isFavorite = favoriteSites.contains(situs);

          return Card(
            child: ListTile(
              leading: Image.network(
                situs.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(situs.name),
              trailing: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.blue : null,
                ),
                onPressed: () {
                  setState(() {
                    if (isFavorite) {
                      favoriteSites.remove(situs);
                    } else {
                      favoriteSites.add(situs);
                    }
                    // Kirim pembaruan ke HomePage
                    widget.onFavoritesChanged(favoriteSites);
                  });
                },
              ),
              onTap: () async {
                if (await canLaunch(situs.url)) {
                  await launch(situs.url);
                } else {
                  throw 'Could not launch ${situs.url}';
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class Situs {
  final String name;
  final String url;
  final String imageUrl;

  Situs({required this.name, required this.url, required this.imageUrl});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Situs && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
