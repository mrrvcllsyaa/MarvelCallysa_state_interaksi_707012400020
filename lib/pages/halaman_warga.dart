import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../models/pengajuan_model.dart';
import '../navigation/app_routes.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPengajuan = context.select<PengajuanModel, int>(
      (model) => model.totalPengajuan,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Halaman Warga',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Total pengajuan: $totalPengajuan',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Layanan Favorit',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Consumer<FavoritModel>(
            builder: (context, model, child) {
              if (model.favorit.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.star_border,
                            size: 45,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Belum ada layanan favorit.',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return Column(
                children: model.favorit.map((namaLayanan) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      title: Text(namaLayanan),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.detailLayanan,
                            arguments: {
                              'namaLayanan': namaLayanan,
                              'dinas': 'Layanan Kota',
                              'jamOperasional': 'Sesuai layanan',
                              'keterangan':
                                  'Layanan yang telah ditandai sebagai favorit.',
                            },
                          );
                        },
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Pengajuan Saya',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Consumer<PengajuanModel>(
            builder: (context, model, child) {
              if (model.pengajuan.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'Belum ada pengajuan layanan.',
                      ),
                    ),
                  ),
                );
              }

              return Column(
                children: model.pengajuan.map((namaLayanan) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.assignment_turned_in,
                      ),
                      title: Text(namaLayanan),
                      subtitle: const Text(
                        'Pengajuan berhasil dikirim',
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}