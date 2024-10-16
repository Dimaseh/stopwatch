import 'package:flutter/material.dart';

class DaftarAnggotaPage extends StatefulWidget {
  const DaftarAnggotaPage({super.key});

  @override
  _DaftarAnggotaPageState createState() => _DaftarAnggotaPageState();
}

class _DaftarAnggotaPageState extends State<DaftarAnggotaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Anggota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 2 kolom dalam satu baris
            crossAxisSpacing: 8.0, // Jarak horizontal antar item
            mainAxisSpacing: 8.0, // Jarak vertikal antar item
            childAspectRatio: 0.9, // Rasio lebar/tinggi kotak anggota
          ),
          itemCount: members.length,
          itemBuilder: (context, index) {
            final member = members[index];
            return Card(
              child: Column(
                children: [
                  // Gambar dalam bentuk kotak
                  Expanded(
                    child: Image.asset(
                      member['imagePath'],
                      fit: BoxFit
                          .cover, // Mengatur gambar agar mengisi area penuh
                      width: double.infinity, // Mengisi lebar penuh Card
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    member['name'],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(member['id']),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Data anggota
final List<Map<String, dynamic>> members = [
  {
    'name': 'Dimas Guntara',
    'id': '1244220006',
    'imagePath': 'assets/dimas.jpg',
  },
  {
    'name': 'Ayumi Fitriani Galilea',
    'id': '1244220008',
    'imagePath': 'assets/ayumi.jpg',
  },
  {
    'name': 'Theo Sampang Banjir Pole',
    'id': '1244220135',
    'imagePath': 'assets/theo.png',
  },
];
