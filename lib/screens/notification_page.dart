import 'package:flutter/material.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            DefaultTabController(
              length: 2,
              child: Column(
                children: const [
                  TabBar(
                    tabs: [
                      Tab(text: "Notifikasi Saya"),
                      Tab(text: "Notifikasi Toko"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      NotificationTile("Promo Shopee", "Rekomendasi produk pilihan ini siap segera...", 14),
                      NotificationTile("Live, Video & Games", "Ternyata berubah jadi: 📱 iPhone 15...", 10),
                      NotificationTile("Info Shopee", "Fikry Fauzi, ambil Komisi tambahan s/d 4JT...", 4),
                      SizedBox(height: 16),
                      StatusOrderContainer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final int count;

  const NotificationTile(this.title, this.subtitle, this.count, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.notifications, color: Colors.orange),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 12,
        child: Text(
          "$count",
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

class StatusOrderContainer extends StatelessWidget {
  const StatusOrderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: Stack(
          children: [
            // Letakkan teks di pojok kiri atas
            Positioned(
              top: 16,
              left: 16,
              child: const Text(
                "Status Pemesanan",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Konten lainnya
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart, size: 80, color: Colors.orange),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Belanja Sekarang"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

