import 'package:flutter/material.dart';

class HalamanKeluar extends StatelessWidget {
  const HalamanKeluar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keluar'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.logout,
                size: 70,
              ),
              const SizedBox(height: 20),
              const Text(
                'Apakah Anda ingin keluar?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali ke Aplikasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}