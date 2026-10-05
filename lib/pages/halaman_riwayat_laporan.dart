import 'package:flutter/material.dart';

class HalamanRiwayatLaporan extends StatelessWidget {
  const HalamanRiwayatLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Laporan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.water),
              title: Text('Laporan Banjir'),
              subtitle: Text(
                'Laporan kondisi banjir di wilayah kota.',
              ),
              trailing: Icon(Icons.check_circle),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.delete_outline),
              title: Text('Laporan Sampah'),
              subtitle: Text(
                'Laporan tumpukan sampah di lingkungan warga.',
              ),
              trailing: Icon(Icons.check_circle),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.traffic),
              title: Text('Laporan Lalu Lintas'),
              subtitle: Text(
                'Laporan mengenai kondisi lalu lintas.',
              ),
              trailing: Icon(Icons.check_circle),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tambah laporan baru'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}