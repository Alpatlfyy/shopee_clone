import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: keuangan(),
  ));
}

class keuangan extends StatelessWidget {
  const keuangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Keuangan'),
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopCards(),
            _buildShopeePaySection(),
            _buildIconGrid(),
            _buildAsuransiBanner(),
            _buildInvestasiCards(),
            _buildVoucherProduk(),
            _buildPromoBanners(),
            _buildRekomendasiInvestasiList(),
            _buildAsuransiYangDisarankan(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopCards() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLimitCard('SPayLater'),
          _buildLimitCard('SPinjam'),
        ],
      ),
    );
  }

  Widget _buildLimitCard(String title) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [Colors.white, Color(0xFFFEEBDC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 6),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.account_balance_wallet, color: Colors.deepOrange),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Limit kredit s/d\nRp 50.000.000',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Aktifkan Sekarang',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShopeePaySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Aplikasi ShopeePay', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Klaim 50.000 >', style: TextStyle(color: Colors.deepOrange)),
        ],
      ),
    );
  }

  Widget _buildIconGrid() {
    final List<Map<String, dynamic>> items = [
      {'label': 'ShopeePay', 'icon': Icons.account_balance_wallet},
      {'label': 'SeaBank', 'icon': Icons.waves},
      {'label': 'SPinjam untuk Penjual', 'icon': Icons.store},
      {'label': 'SPayLater Limit Xtra', 'icon': Icons.credit_card},
      {'label': 'SJaminan BPKB', 'icon': Icons.directions_car},
      {'label': 'Asuransi', 'icon': Icons.verified_user},
      {'label': 'Investasi Pintar', 'icon': Icons.show_chart},
      {'label': 'Reksa Dana', 'icon': Icons.pie_chart},
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: items
            .map(
              (item) => Column(
            children: [
              Icon(item['icon'], color: Colors.deepOrange),
              const SizedBox(height: 4),
              Text(item['label'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 11)),
            ],
          ),
        )
            .toList(),
      ),
    );
  }

  Widget _buildAsuransiBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 6),
          ],
        ),
        child: Row(
          children: const [
            Icon(Icons.health_and_safety, color: Colors.red),
            SizedBox(width: 12),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text: 'GRATIS proteksi kecelakaan ',
                  children: [
                    TextSpan(text: 'Rp1JT', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInvestasiCards() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          _buildMiniCard('Investasi Pintar', 'Imbal hasil lebih'),
          const SizedBox(width: 12),
          _buildMiniCard('Reksa Dana', 'Cek reksa dana pilihan'),
        ],
      ),
    );
  }

  Widget _buildMiniCard(String title, String subtitle) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 6)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildVoucherProduk() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Voucher Produk', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Lihat Semua', style: TextStyle(color: Colors.deepOrange)),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildVoucherCard('Potongan 100%', 'SPayLater'),
                _buildVoucherCard('Potongan 10%', 'SPayLater'),
                _buildVoucherCard('Potongan 10%', ''),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVoucherCard(String title, String subtitle) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFFF2E5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.deepOrange.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            ),
            onPressed: () {},
            child: const Text('Pakai', style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanners() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Image.asset('assets/spaylater.png'),

          ),
          const SizedBox(width: 8),
          Expanded(
            child: Image.asset('assets/spaylater.png'),
          ),
        ],
      ),
    );
  }

  Widget _buildRekomendasiInvestasiList() {
    final List<Map<String, dynamic>> rekomendasi = [
      {
        'title': 'Sucorinvest Sharia Money Market',
        'return': '+5,33%',
        'year': '1 Tahun',
        'note': '50% pengguna membeli dalam 7 hari',
        'rankIcon': Icons.emoji_events,
        'rankColor': Colors.amber
      },
      {
        'title': 'BRI Seruni Pasar Uang II Kelas A',
        'return': '+4,90%',
        'year': '1 Tahun',
        'note': '15% pengguna membeli dalam 7 hari',
        'rankIcon': Icons.emoji_events,
        'rankColor': Colors.grey
      },
      {
        'title': 'BNI-AM Dana Lancar Syariah',
        'return': '+4,21%',
        'year': '1 Tahun',
        'note': '10% kepemilikan',
        'rankIcon': Icons.emoji_events,
        'rankColor': Colors.brown
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: rekomendasi.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(item['rankIcon'], color: item['rankColor'], size: 18),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        item['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        minimumSize: const Size(40, 32),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: const Text('B...', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(item['return'], style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                const Text('1 Tahun', style: TextStyle(fontSize: 12)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.local_fire_department, color: Colors.deepOrange, size: 16),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item['note'],
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // Tambahkan _buildAsuransiYangDisarankan di sini 👇
  Widget _buildAsuransiYangDisarankan() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Asuransi yang disarankan', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Lihat Semua', style: TextStyle(color: Colors.deepOrange)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildTabItem('Kecelakaan', isActive: true),
              _buildTabItem('Mobil'),
              _buildTabItem('Kesehatan'),
            ],
          ),
          const SizedBox(height: 12),
          _buildAsuransiCard(
            isNew: true,
            title: 'Sealnsure Kecelakaan Diri',
            price: 'Rp20.400',
            originalPrice: 'Rp24.000',
            discount: '15%',
            imageAsset: 'assets/asuransi1.png',
            benefits: [
              'Perlindungan cedera yang tidak disengaja',
              'Klaim hingga Rp100JT',
              'Perlindungan langsung dari kecelakaan',
            ],
          ),
          const SizedBox(height: 12),
          _buildAsuransiCard(
            isNew: true,
            title: 'Asuransi Kecelakaan Diri',
            price: 'Rp5.000',
            discount: '15%',
            imageAsset: 'assets/asuransi2.png',
            benefits: [
              'Melindungimu dari kejadian tak terduga',
              'Premi terjangkau mulai dari Rp5.000',
              'Klaim biaya pengobatan sampai Rp5JT',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: isActive ? Colors.deepOrange : Colors.black.withOpacity(0.6),
          decoration: isActive ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildAsuransiCard({
    required String title,
    required String price,
    String? originalPrice,
    required String discount,
    required String imageAsset,
    required List<String> benefits,
    bool isNew = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imageAsset, width: 60, height: 60, fit: BoxFit.cover),
              ),
              if (isNew)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: const Text('Baru', style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text('Dari $price', style: const TextStyle(color: Colors.deepOrange)),
                    if (originalPrice != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        originalPrice,
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade700,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '$discount OFF',
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                ...benefits.map((b) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 12)),
                    Expanded(child: Text(b, style: const TextStyle(fontSize: 12))),
                  ],
                )),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    ),
                    child: const Text('Beli'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}