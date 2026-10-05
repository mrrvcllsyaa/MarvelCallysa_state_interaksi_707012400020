import 'package:flutter/material.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_city,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Nusantara Cerdas Mobile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              'Aplikasi layanan warga berbasis Smart City '
              'yang membantu masyarakat mengakses layanan '
              'kota dengan mudah.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Modul III - Pemrograman Perangkat Bergerak Lanjut',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}