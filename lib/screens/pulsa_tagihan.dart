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
  final Color orangeColor = Color(0xFFFF5722);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        title: Text("Pulsa, Tagihan & Tiket"),
        leading: Icon(Icons.arrow_back),
        actions: [IconButton(icon: Icon(Icons.receipt_long), onPressed: () {})],
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          _buildSearchBar(),
          SizedBox(height: 12),
          _buildGridMenu(),
          SizedBox(height: 16),
          _buildRekomendasi(),
          SizedBox(height: 12),
          _buildBannerPromo(),
          SizedBox(height: 12),
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
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: TextField(
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 12,
        crossAxisSpacing: 8,
      ),
      itemCount: menu.length,
      itemBuilder: (context, index) {
        var item = menu[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  radius: 24,
                  child: Icon(item['icon'], size: 24),
                ),
                if (item["promo"] == true)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text("PROMO", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
            SizedBox(height: 6),
            Text(item['label'], textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
          ],
        );
      },
    );
  }

  Widget _buildRekomendasi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Rekomendasi Untukmu", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        _buildRekomendasiItem("assets/pln.png", "Tagihan PLN", "100% cashback koin", "Beli"),
        SizedBox(height: 8),
        _buildRekomendasiItem("assets/xl.png", "Bebas Puas 6rb/hr, 9GB , 3hr", "Rp17.850  (-1%)", "Beli"),
      ],
    );
  }

  Widget _buildRekomendasiItem(String imagePath, String title, String sub, String btnLabel) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(imagePath, width: 40, height: 40),
              SizedBox(width: 8),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(height: 4),
                Text(sub, style: TextStyle(color: Colors.redAccent, fontSize: 12)),
              ]),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(btnLabel),
            style: ElevatedButton.styleFrom(backgroundColor: orangeColor),
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
        Text("Promo Menarik Untukmu", style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: promoItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 3 / 2.5,
          ),
          itemBuilder: (context, index) {
            var item = promoItems[index];
            return Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        item['image']!,
                        height: 60,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item['title']!,
                    style: TextStyle(fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item['sub']!,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Lihat"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orangeColor,
                        minimumSize: Size(60, 28),
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
