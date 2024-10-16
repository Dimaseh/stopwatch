import 'package:flutter/material.dart';
import 'package:tugas_kelompok/page/login.dart';
import 'package:tugas_kelompok/page//daftar_anggota_page.dart';
import 'package:tugas_kelompok/page/favorit_page.dart';
import 'package:tugas_kelompok/page/situs_rekomendasi_page.dart';
import 'package:tugas_kelompok/page/stopwatch_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Set to store favorite sites;
  Set<Situs> favoriteSites = {};

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      // Halaman Home
      Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 205, 232, 253),
                Color.fromARGB(255, 149, 200, 241)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _buildMenuItem(
              context: context,
              title: 'Daftar Anggota',
              page: const DaftarAnggotaPage(),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(
              context: context,
              title: 'Stopwatch',
              page: StopwatchPage(),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(
              context: context,
              title: 'Situs Rekomendasi',
              page: SitusRekomendasiPage(
                favoriteSites: favoriteSites,
                onFavoritesChanged: (Set<Situs> updatedFavorites) {
                  setState(() {
                    favoriteSites = updatedFavorites;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            _buildMenuItem(
              context: context,
              title: 'Favorit',
              page: FavoritePage(favoriteSites: favoriteSites),
            ),
          ])),

      // Halaman Bantuan
      const BantuanPage(),

      // Halaman Logout
      Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 205, 232, 253),
                Color.fromARGB(255, 149, 200, 241)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Klik tombol di bawah ini untuk keluar dari aplikasi!',
                  style: TextStyle(fontSize: 12)),
              const SizedBox(height: 20),
              _logout(),
            ],
          )),
    ];

    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.dashboard,
            color: Colors.white,
          ),
          title: const Text(
            'Dashboard',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 6, 132, 243),
        ),
        body: Center(
          child: pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amberAccent,
          backgroundColor: const Color.fromARGB(255, 7, 135, 233),
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Bantuan'),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required String title,
    required Widget page,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 200,
        height: 70,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 6, 132, 243),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _logout() {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 150,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6.0,
              offset: Offset(2, 2),
            ),
          ]),
      child: MaterialButton(
        animationDuration: const Duration(seconds: 2),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return const LoginPage();
            }),
            (route) => false,
          );
        },
        color: const Color.fromARGB(255, 7, 135, 233),
        child: const Text(
          'LOGOUT',
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Bantuan'),
      //   backgroundColor: const Color.fromARGB(255, 6, 132, 243),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: const [
            Text(
              'Cara Penggunaan Aplikasi',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 6, 132, 243),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Penggunaan Halaman Data Kelompok',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Pada halaman data kelompok, pengguna dapat melihat data kelompok yang terdiri dari 3 orang. Data kelompok yang ditampilkan adalah nama, nim, dan foto anggota kelompok.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Penggunaan Halaman Stopwatch',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Pada halaman stopwatch, pengguna dapat melihat stopwatch yang berjalan. Pengguna dapat menekan tombol start untuk memulai stopwatch, tombol stop untuk menghentikan stopwatch, dan tombol reset untuk mengembalikan stopwatch ke 0.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Penggunaan Halaman Situs Rekomendasi',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Pada Halaman Situs Rekomendasi, pengguna dapat melihat situs-situs rekomendasi yang ada di Bandung. Pengguna dapat menekan tombol love untuk menambahkan situs ke halaman favorit.',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Penggunaan Halaman Favorit',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Pada halaman favorit, pengguna dapat melihat situs favoritnya dari halaman situs sebelumnya, pengguna juga dapat menghapus situs favoritnya/ unfavourite',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
