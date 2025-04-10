import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PulsaTagihanTiketPage(),
    );
  }
}

class PulsaTagihanTiketPage extends StatelessWidget {
  final Color orangeColor = const Color(0xFFFF5722);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: const Text("Pulsa, Tagihan & Tiket"),
        leading: const Icon(Icons.arrow_back),
        actions: [IconButton(icon: const Icon(Icons.receipt_long), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 12),
          _buildGridMenu(),
          const SizedBox(height: 16),
          _buildRekomendasi(),
          const SizedBox(height: 12),
          _buildBannerPromo(),
          const SizedBox(height: 12),
          _buildPromoMenarik(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Cari "Telkomsel"',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildGridMenu() {
    List<Map<String, dynamic>> menu = [
      {"icon": Icons.wifi, "label": "Paket Data"},
      {"icon": Icons.smartphone, "label": "Pulsa"},
      {"icon": Icons.flash_on, "label": "Listrik PLN", "promo": true},
      {"icon": Icons.school, "label": "Biaya Pendidikan"},
      {"icon": Icons.calendar_today, "label": "Angsuran Kredit"},
      {"icon": Icons.local_gas_station, "label": "PGN"},
      {"icon": Icons.account_balance_wallet, "label": "Uang Elektronik"},
      {"icon": Icons.credit_card, "label": "BPJS"},
      {"icon": Icons.opacity, "label": "PDAM", "promo": true},
      {"icon": Icons.more_horiz, "label": "Lihat Semua"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: menu.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
        childAspectRatio: 0.75, // tambahkan rasio untuk proporsionalitas
      ),
      itemBuilder: (context, index) {
        var item = menu[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  radius: 20, // diperkecil
                  child: Icon(item['icon'], size: 18), // ukuran ikon lebih kecil
                ),
                if (item["promo"] == true)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text("PROMO", style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 4),
            Flexible(
              child: Text(
                item['label'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }


  Widget _buildRekomendasi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Rekomendasi Untukmu", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildRekomendasiItem("assets/pln.png", "Tagihan PLN", "100% cashback koin", "Beli"),
        const SizedBox(height: 8),
        _buildRekomendasiItem("assets/xl.png", "Bebas Puas 6rb/hr, 9GB , 3hr", "Rp17.850  (-1%)", "Beli"),
      ],
    );
  }

  Widget _buildRekomendasiItem(String imagePath, String title, String sub, String btnLabel) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 40, height: 40),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(sub, style: const TextStyle(color: Colors.redAccent, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: orangeColor,
              foregroundColor: Colors.white, // agar text putih
              padding: const EdgeInsets.symmetric(horizontal: 20),
              minimumSize: const Size(64, 36),
            ),
            child: Text(btnLabel),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerPromo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset("assets/banner_promo1.png", fit: BoxFit.cover, height: 120),
    );
  }

  Widget _buildPromoMenarik() {
    List<Map<String, String>> promoItems = [
      {"title": "Token PLN 20.000", "sub": "100% cashback koin", "image": "assets/tokenpln.png"},
      {"title": "Tiket Kereta Api", "sub": "Train", "image": "assets/train.png"},
      {"title": "Bebas Puas 3rb/hr, 3GB , 3hr", "sub": "-1%", "image": "assets/wifii.png"},
      {"title": "Token PLN 500.000", "sub": "-1%", "image": "assets/tokenpln.png"},
      {"title": "Bebas Puas 3rb/hr, 6GB , 3hr", "sub": "-1%", "image": "assets/wifii.png"},
      {"title": "Bebas Puas 3rb/hr, 9GB , 3hr", "sub": "-1%", "image": "assets/wifii.png"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Promo Menarik Untukmu", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: promoItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 3 / 2.5,
          ),
          itemBuilder: (context, index) {
            var item = promoItems[index];
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      item['image']!,
                      height: 30,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['title']!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item['sub']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Lihat"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orangeColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(60, 28),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
