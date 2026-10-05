import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';
import '../pages/halaman_beranda.dart';
import '../pages/halaman_layanan.dart';
import '../pages/halaman_warga.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  int _indeksTerpilih = 0;

  final List<Widget> _halaman = const [
    HalamanBeranda(),
    HalamanLayanan(),
    HalamanWarga(),
  ];

  final List<String> _judul = const [
    'Beranda',
    'Layanan',
    'Warga',
  ];

  void _pilihTujuan(int indeks) {
    setState(() {
      _indeksTerpilih = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lebarLayar = MediaQuery.of(context).size.width;
    final layarLebar = lebarLayar >= 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_judul[_indeksTerpilih]),
      ),
      drawer: _buatDrawer(),
      body: layarLebar
          ? _tataLetakLebar()
          : _halaman[_indeksTerpilih],
      bottomNavigationBar: layarLebar
          ? null
          : _buatBilahBawah(),
    );
  }

  Widget _buatBilahBawah() {
    final totalPengajuan = context.select<PengajuanModel, int>(
      (model) => model.totalPengajuan,
    );

    return NavigationBar(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: _pilihTujuan,
      destinations: [
        const NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Beranda',
        ),
        const NavigationDestination(
          icon: Icon(Icons.apps_outlined),
          selectedIcon: Icon(Icons.apps),
          label: 'Layanan',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('$totalPengajuan'),
            isLabelVisible: totalPengajuan > 0,
            child: const Icon(Icons.people_outline),
          ),
          selectedIcon: Badge(
            label: Text('$totalPengajuan'),
            isLabelVisible: totalPengajuan > 0,
            child: const Icon(Icons.people),
          ),
          label: 'Warga',
        ),
      ],
    );
  }

  Widget _tataLetakLebar() {
    final totalPengajuan = context.select<PengajuanModel, int>(
      (model) => model.totalPengajuan,
    );

    return Row(
      children: [
        NavigationRail(
          selectedIndex: _indeksTerpilih,
          onDestinationSelected: _pilihTujuan,
          extended: true,
          destinations: [
            const NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Beranda'),
            ),
            const NavigationRailDestination(
              icon: Icon(Icons.apps_outlined),
              selectedIcon: Icon(Icons.apps),
              label: Text('Layanan'),
            ),
            NavigationRailDestination(
              icon: Badge(
                label: Text('$totalPengajuan'),
                isLabelVisible: totalPengajuan > 0,
                child: const Icon(Icons.people_outline),
              ),
              selectedIcon: Badge(
                label: Text('$totalPengajuan'),
                isLabelVisible: totalPengajuan > 0,
                child: const Icon(Icons.people),
              ),
              label: const Text('Warga'),
            ),
          ],
        ),
        const VerticalDivider(
          width: 1,
        ),
        Expanded(
          child: _halaman[_indeksTerpilih],
        ),
      ],
    );
  }

  Widget _buatDrawer() {
    return NavigationDrawer(
      selectedIndex: _indeksTerpilih,
      onDestinationSelected: (indeks) {
        _pilihTujuan(indeks);
        Navigator.pop(context);
      },
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Nusantara Cerdas'),
          accountEmail: Text('Layanan Warga Smart City'),
          currentAccountPicture: CircleAvatar(
            child: Icon(Icons.person),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text('Menu Utama'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Beranda'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.apps_outlined),
          selectedIcon: Icon(Icons.apps),
          label: Text('Layanan'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.people_outline),
          selectedIcon: Icon(Icons.people),
          label: Text('Warga'),
        ),
        const Divider(
          indent: 28,
          endIndent: 28,
        ),
        ListTile(
          leading: const Icon(Icons.map_outlined),
          title: const Text('Riwayat Laporan'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(
              context,
              AppRoutes.riwayatLaporan,
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Pengaturan Kota'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(
              context,
              AppRoutes.pengaturanKota,
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Tentang Aplikasi'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(
              context,
              AppRoutes.tentang,
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Keluar'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(
              context,
              AppRoutes.keluar,
            );
          },
        ),
      ],
    );
  }
}