import 'package:flutter/material.dart';

import '../pages/halaman_detail_layanan.dart';
import '../pages/halaman_pengaturan_kota.dart';
import '../pages/halaman_riwayat_laporan.dart';
import '../pages/halaman_tentang.dart';
import '../pages/halaman_keluar.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailLayanan = '/detail-layanan';
  static const String riwayatLaporan = '/riwayat-laporan';
  static const String pengaturanKota = '/pengaturan-kota';
  static const String tentang = '/tentang';
  static const String keluar = '/keluar';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      riwayatLaporan: (context) => const HalamanRiwayatLaporan(),
      pengaturanKota: (context) => const HalamanPengaturanKota(),
      tentang: (context) => const HalamanTentang(),
      keluar: (context) => const HalamanKeluar(),
    };
  }

  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detailLayanan) {
      final data = settings.arguments as Map<String, String>;

      return MaterialPageRoute(
        builder: (context) {
          return HalamanDetailLayanan(
            namaLayanan: data['namaLayanan'] ?? '',
            dinas: data['dinas'] ?? '',
            jamOperasional: data['jamOperasional'] ?? '',
            keterangan: data['keterangan'] ?? '',
          );
        },
      );
    }

    return null;
  }
}