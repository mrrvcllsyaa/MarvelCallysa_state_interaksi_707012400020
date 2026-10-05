import 'package:flutter/material.dart';

class HalamanPengaturanKota extends StatelessWidget {
  const HalamanPengaturanKota({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Kota'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notifikasi Kota'),
            subtitle: const Text(
              'Menerima informasi terbaru dari kota.',
            ),
            value: true,
            onChanged: (nilai) {},
          ),
          ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Lokasi Kota'),
            subtitle: const Text('Nusantara'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Bahasa'),
            subtitle: const Text('Bahasa Indonesia'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}