import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../navigation/app_routes.dart';

class HalamanLayanan extends StatelessWidget {
  const HalamanLayanan({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.description_outlined),
                text: 'Perizinan',
              ),
              Tab(
                icon: Icon(Icons.local_hospital_outlined),
                text: 'Kesehatan',
              ),
              Tab(
                icon: Icon(Icons.directions_bus_outlined),
                text: 'Transportasi',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _daftarLayanan(
                  context,
                  [
                    {
                      'nama': 'Perizinan Usaha',
                      'dinas': 'Dinas Penanaman Modal',
                      'jam': '08.00 - 16.00',
                      'keterangan':
                          'Layanan pengurusan perizinan usaha bagi warga.',
                    },
                    {
                      'nama': 'Kartu Keluarga',
                      'dinas': 'Dinas Kependudukan',
                      'jam': '08.00 - 15.00',
                      'keterangan':
                          'Layanan pengajuan dan perubahan Kartu Keluarga.',
                    },
                    {
                      'nama': 'KTP Elektronik',
                      'dinas': 'Dinas Kependudukan',
                      'jam': '08.00 - 15.00',
                      'keterangan':
                          'Layanan pembuatan dan perubahan KTP elektronik.',
                    },
                  ],
                ),
                _daftarLayanan(
                  context,
                  [
                    {
                      'nama': 'Puskesmas Online',
                      'dinas': 'Dinas Kesehatan',
                      'jam': '08.00 - 16.00',
                      'keterangan':
                          'Informasi dan layanan kesehatan puskesmas.',
                    },
                    {
                      'nama': 'Jadwal Vaksinasi',
                      'dinas': 'Dinas Kesehatan',
                      'jam': '08.00 - 15.00',
                      'keterangan':
                          'Informasi jadwal dan lokasi vaksinasi.',
                    },
                    {
                      'nama': 'Ambulans Kota',
                      'dinas': 'Dinas Kesehatan',
                      'jam': '24 Jam',
                      'keterangan':
                          'Permohonan bantuan ambulans untuk warga.',
                    },
                  ],
                ),
                _daftarLayanan(
                  context,
                  [
                    {
                      'nama': 'Transportasi Umum',
                      'dinas': 'Dinas Perhubungan',
                      'jam': '05.00 - 22.00',
                      'keterangan':
                          'Informasi layanan transportasi umum kota.',
                    },
                    {
                      'nama': 'Kartu Transportasi',
                      'dinas': 'Dinas Perhubungan',
                      'jam': '08.00 - 16.00',
                      'keterangan':
                          'Layanan pembuatan kartu transportasi kota.',
                    },
                    {
                      'nama': 'Pengaduan Jalan',
                      'dinas': 'Dinas Perhubungan',
                      'jam': '24 Jam',
                      'keterangan':
                          'Laporan terkait kondisi jalan dan transportasi.',
                    },
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _daftarLayanan(
    BuildContext context,
    List<Map<String, String>> daftar,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: daftar.length,
      itemBuilder: (context, index) {
        final layanan = daftar[index];

        return _KartuLayanan(
          namaLayanan: layanan['nama']!,
          dinas: layanan['dinas']!,
          jamOperasional: layanan['jam']!,
          keterangan: layanan['keterangan']!,
        );
      },
    );
  }
}

class _KartuLayanan extends StatelessWidget {
  final String namaLayanan;
  final String dinas;
  final String jamOperasional;
  final String keterangan;

  const _KartuLayanan({
    required this.namaLayanan,
    required this.dinas,
    required this.jamOperasional,
    required this.keterangan,
  });

  @override
  Widget build(BuildContext context) {
    final favorit = context.watch<FavoritModel>();
    final sedangFavorit = favorit.isFavorit(namaLayanan);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.miscellaneous_services),
        ),
        title: Text(
          namaLayanan,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(dinas),
        trailing: IconButton(
          icon: Icon(
            sedangFavorit ? Icons.star : Icons.star_border,
          ),
          color: sedangFavorit ? Colors.amber : null,
          onPressed: () {
            final model = context.read<FavoritModel>();

            if (sedangFavorit) {
              model.batalTandai(namaLayanan);
            } else {
              model.tandai(namaLayanan);
            }
          },
        ),
        onTap: () async {
          final hasil = await Navigator.pushNamed(
            context,
            AppRoutes.detailLayanan,
            arguments: {
              'namaLayanan': namaLayanan,
              'dinas': dinas,
              'jamOperasional': jamOperasional,
              'keterangan': keterangan,
            },
          );

          if (!context.mounted) {
            return;
          }

          if (hasil is String) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(hasil),
              ),
            );
          }
        },
      ),
    );
  }
}