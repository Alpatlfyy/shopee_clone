import 'package:flutter/material.dart';

// Halaman Profil
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Toko Saya'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Toko
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bungkus Avatar dan Text jadi satu Row supaya bisa atur jarak
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('URL_IMAGE_PROFILE'),
                      ),
                      const SizedBox(width: 8), // Jarak kecil agar tidak terlalu rapat
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'zastore_',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text('2 Pengikut', style: TextStyle(color: Colors.white)),
                          Text('7 Mengikuti', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Daftar Pesanan
            buildSectionTitle('Pesanan Saya', showHistory: true),
            buildButtonRow(),
            const SizedBox(height: 10), // Spasi antara tombol pesanan dan menu tambahan
            buildExtraMenu(), // Menambahkan dua menu baru di bawah "Pesanan Saya"
            // Keuangan
            buildSectionTitle('Dompet saya'),
            buildFinanceInfo(),
            // Dompet Saya
            buildSectionTitle('Keuangan'),
            buildWalletInfo(),

            // Aktivitas Saya
            buildSectionTitle('Aktivitas Saya'),
            buildActivityInfo(),
            // Bantuan
            buildSectionTitle('Bantuan'),
            buildHelpInfo(),
          ],
        ),
      ),
    );
  }

  // Method untuk section title dengan opsi tombol "Lihat Riwayat Pesanan"
  Widget buildSectionTitle(String title, {bool showHistory = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15, // Ukuran font menjadi 13
              fontWeight: FontWeight.w400, // Font reguler
            ),
          ),
          if (showHistory) // Jika showHistory true, tampilkan tombol
            TextButton(
              onPressed: () {
                // Tambahkan aksi untuk melihat riwayat pesanan
              },
              child: Row(
                children: const [
                  Text(
                    'Lihat Riwayat Pesanan',
                    style: TextStyle(fontSize: 13, color: Colors.blue), // Warna biru agar terlihat seperti link
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.blue), // Ikon panah kecil
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Method untuk tombol pesanan

  Widget buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton('assets/images/icon11.png'),
        buildButton('assets/images/icon12.png'),
        buildButton('assets/images/icon13.png'),
        buildButton('assets/images/icon14.png'),
      ],
    );
  }

// Method untuk button dengan gambar
  Widget buildButton(String imagePath) {
    return Column(
      children: [
        Image.asset(imagePath, width: 100, height: 100), // Gambar sebagai ikon
      ],
    );
  }


  // Method untuk menu tambahan di bawah "Pesanan Saya"
  // Method untuk menu tambahan di bawah "Pesanan Saya"
  Widget buildExtraMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          buildMenuItem('assets/images/icon15.png'),
          buildMenuItem('assets/images/icon16.png'),
        ],
      ),
    );
  }

// Method untuk item menu tambahan dengan gambar saja
  Widget buildMenuItem(String iconPath) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start, // Mengatur posisi ke kiri (start)
          children: [
            Image.asset(iconPath, width: 370, height: 40), // Menggunakan ikon dari aset lokal
          ],
        ),
        const SizedBox(height: 10), // Spasi antar item menu
      ],
    );
  }


  // Method untuk menu 4 item menggunakan Row
  // Method untuk menu 4 item menggunakan Row dengan gambar sebagai ikon penuh
  Widget buildWalletInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Padding untuk seluruh Row
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menyusun elemen di baris pertama
            children: [
              buildMenuWalletItem('assets/images/icon22.png'),
              buildMenuWalletItem('assets/images/icon23.png'),
            ],
          ),
          const SizedBox(height: 13), // Spasi antar baris
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Menyusun elemen di baris kedua
            children: [
              buildMenuWalletItem('assets/images/icon24.png'),
              buildMenuWalletItem('assets/images/icon25.png'),
            ],
          ),
        ],
      ),
    );
  }

// Method untuk setiap item menu hanya dengan gambar ikon yang memenuhi kontainer
  Widget buildMenuWalletItem(String iconPath) {
    return Container(
      width: 195, // Lebar kontainer untuk setiap menu
      height: 80, // Tinggi kontainer untuk setiap menu
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!), // Border abu-abu
        borderRadius: BorderRadius.circular(8), // Sudut border halus
        image: DecorationImage(
          image: AssetImage(iconPath),
          fit: BoxFit.fitWidth, // Menyesuaikan gambar agar memenuhi kontainer
        ),
      ),
    );
  }





  // Method untuk informasi keuangan menggunakan gambar
  // Method untuk informasi keuangan menggunakan Row dan gambar icon17 - icon20
  Widget buildFinanceInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/icon17.png', width: 80, height: 80),
          Image.asset('assets/images/icon18.png', width: 80, height: 80),
          Image.asset('assets/images/icon19.png', width: 80, height: 80),
          Image.asset('assets/images/icon20.png', width: 80, height: 80),
        ],
      ),
    );
  }



  // Method untuk informasi aktivitas
  // Method untuk informasi aktivitas: 3 baris, 2 item per baris
  Widget buildActivityInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildActivityItem('assets/images/icon26.png'),
              buildActivityItem('assets/images/icon27.png'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildActivityItem('assets/images/icon28.png'),
              buildActivityItem('assets/images/icon29.png'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildActivityItem('assets/images/icon30.png'),
              buildActivityItem('assets/images/icon31.png'),
            ],
          ),
        ],
      ),
    );
  }

// Method untuk setiap item aktivitas (gambar tanpa teks)
  Widget buildActivityItem(String imagePath) {
    return Container(
      width: 195,
      height: 80,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
      ),
    );
  }


  // Method untuk informasi bantuan
  Widget buildHelpInfo() {
    return Column(
      children: [
        ListTile(
          title: const Text('Pusat Bantuan'),
        ),
        ListTile(
          title: const Text('Chat dengan Shopee'),
        ),
      ],
    );
  }
}
