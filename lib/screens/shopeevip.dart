import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ShopeeVipPage(),
  ));
}

class ShopeeVipPage extends StatelessWidget {
  final Color orangeColor = Color(0xFFFF5722);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(),
                  _buildBenefitCards(),
                  _buildKeuntunganSection(),
                  _buildSyaratSection(),
                ],
              ),
            ),
          ),
          _buildBottomBar(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.deepOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_back, color: Colors.white),
          SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Text("ShopeeVIP", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Langganan & Dapatkan Voucher Lebih dari 25JT",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitCards() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("DISKON 20%", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("SETIAP HARI", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 80,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.teal.shade100, borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("GRATIS ONGKIR", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("INSTANT TANPA BATAS", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeuntunganSection() {
    List<Map<String, String>> benefits = [
      {
        "icon": "assets/voucher.png",
        "title": "Voucher Diskon 500RB",
        "desc": "Keuntungan belanja maksimal sebagai VIP"
      },
      {
        "icon": "assets/shipping.png",
        "title": "Gratis Ongkir Instant Tanpa Batas",
        "desc": "Jadikan pesananmu selalu Gratis Ongkir"
      },
      {
        "icon": "assets/vipday.png",
        "title": "Akses VIP DAY",
        "desc": "Festival belanja eksklusif setiap tanggal 15"
      },
      {
        "icon": "assets/cs.png",
        "title": "Customer Service Prioritas",
        "desc": "Nikmati layanan CS Prioritas 24/7"
      },
      {
        "icon": "assets/food.png",
        "title": "Gratis Ongkir ShopeeFood 15RB",
        "desc": "Ongkir lebih murah, jajan jadi hemat"
      },
      {
        "icon": "assets/discount.png",
        "title": "Diskon 20% Pulsa, Tagihan & Tiket",
        "desc": "Bayar tagihan lebih murah dengan VIP"
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Keuntungan:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          ...benefits.map((b) => ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(4),
              child: Image.asset(b['icon']!, fit: BoxFit.contain),
            ),
            title: Text(b['title']!, style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(b['desc']!),
          )),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16),
              SizedBox(width: 4),
              Text("Masa Berlaku: 30 hari setelah pembelian", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSyaratSection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ExpansionTile(
        title: Text("Syarat & Ketentuan", style: TextStyle(fontWeight: FontWeight.bold)),
        children: [
          Text(
            "1. ShopeeVIP adalah fitur berlangganan berbayar...\n\n"
                "2. Dengan membeli Paket ShopeeVIP, Pengguna memahami ketentuan berikut ini...",
            style: TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Bayar dengan Saldo ShopeePay (Rp4.431)", style: TextStyle(fontSize: 12)),
            SizedBox(height: 4),
            Text("Total Rp14.900", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ]),
          ElevatedButton(
            onPressed: () {},
            child: Text("Langganan", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: orangeColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          )
        ],
      ),
    );
  }
}
