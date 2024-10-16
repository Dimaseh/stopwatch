import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tugas_kelompok/page/situs_rekomendasi_page.dart';

class FavoritePage extends StatefulWidget {
  final Set<Situs> favoriteSites;

  const FavoritePage({Key? key, required this.favoriteSites}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late Set<Situs> favoriteSites;

  @override
  void initState() {
    super.initState();
    favoriteSites = widget.favoriteSites;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situs Favorit'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Kembalikan daftar favorit saat kembali
            Navigator.pop(context, favoriteSites);
          },
        ),
      ),
      body: favoriteSites.isNotEmpty
          ? ListView.builder(
              itemCount: favoriteSites.length,
              itemBuilder: (context, index) {
                final situs = favoriteSites.elementAt(index);

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
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          favoriteSites.remove(situs);
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
            )
          : Center(
              child: Text('Belum ada situs favorit yang dipilih.'),
            ),
    );
  }
}
