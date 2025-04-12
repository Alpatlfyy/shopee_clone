import 'package:flutter/material.dart';

class SPayLaterPage extends StatelessWidget {
  const SPayLaterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SPayLater'),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: const Color.fromARGB(255, 241, 241, 240),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepOrange, Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    const Icon(Icons.account_balance_wallet, size: 40, color: Colors.white),
                    const SizedBox(height: 10),
                    const Text(
                      'SPayLater',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'DAPATKAN LIMIT S/D',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const Text(
                      'Rp 50.000.000',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.yellowAccent),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'AKTIVASI CUMA 5 MENIT\nUNTUK NIKMATI KEUNTUNGANNYA',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              // Navigasi ke halaman aktivasi
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AktivasiPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 244, 109, 51), // warna background orange
                              foregroundColor: Colors.white, // warna font putih
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            child: const Text('AKTIFKAN SEKARANG →'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'KEUNTUNGAN SPESIAL UNTUKMU',
                        style: TextStyle(color: Colors.red.shade900, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildBenefitItem(Icons.calendar_today, 'Beli Sekarang, Bayar Nanti'),
                    _buildBenefitItem(Icons.trending_down, 'Bunga Kompetitif, Cicilan s/d 24 Bulan'),
                    _buildBenefitItem(Icons.verified_user, 'Aman & Terpercaya'),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'PROMO CICILAN 0% S/D 24 BULAN',
                  style: TextStyle(
                    color: Colors.red.shade900,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitItem(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepOrange),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(color: Colors.deepOrange))),
        ],
      ),
    );
  }
}

// Halaman Aktivasi Dummy
class AktivasiPage extends StatelessWidget {
  const AktivasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aktivasi SPayLater'),
        backgroundColor: Colors.deepOrange,
      ),
      body: const Center(
        child: Text(
          'Proses Aktivasi Dimulai...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
