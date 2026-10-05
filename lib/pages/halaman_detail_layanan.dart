import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';

class HalamanDetailLayanan extends StatefulWidget {
  final String namaLayanan;
  final String dinas;
  final String jamOperasional;
  final String keterangan;

  const HalamanDetailLayanan({
    super.key,
    required this.namaLayanan,
    required this.dinas,
    required this.jamOperasional,
    required this.keterangan,
  });

  @override
  State<HalamanDetailLayanan> createState() =>
      _HalamanDetailLayananState();
}

class _HalamanDetailLayananState
    extends State<HalamanDetailLayanan> {
  bool isSending = false;

  Future<void> _ajukanPermohonan() async {
    setState(() {
      isSending = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) {
      return;
    }

    context.read<PengajuanModel>().tambahPengajuan(
          widget.namaLayanan,
        );

    setState(() {
      isSending = false;
    });

    Navigator.pop(
      context,
      'Pengajuan "${widget.namaLayanan}" berhasil dikirim.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rincian Layanan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.miscellaneous_services,
              size: 70,
            ),
            const SizedBox(height: 20),
            Text(
              widget.namaLayanan,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dinas Penanggung Jawab',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(widget.dinas),
            const SizedBox(height: 16),
            const Text(
              'Jam Operasional',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(widget.jamOperasional),
            const SizedBox(height: 16),
            const Text(
              'Keterangan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(widget.keterangan),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isSending
                    ? null
                    : _ajukanPermohonan,
                icon: isSending
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.send),
                label: Text(
                  isSending
                      ? 'Sedang Mengirim...'
                      : 'Ajukan Permohonan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}