import 'dart:async';
import 'package:flutter/material.dart';

class TermurahSubScreen extends StatefulWidget {
  const TermurahSubScreen({Key? key}) : super(key: key);

  @override
  State<TermurahSubScreen> createState() => _TermurahSubScreenState();
}

class _TermurahSubScreenState extends State<TermurahSubScreen>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  Duration _flashSaleDuration = const Duration(hours: 1);

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _startCountdown();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
    _animationController.forward();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_flashSaleDuration.inSeconds > 0) {
        setState(() {
          _flashSaleDuration -= const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours.toString().padLeft(2, '0');
    final minutes = (d.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.deepOrange),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showSearch(context: context, delegate: _SimpleSearchDelegate());
                      },
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.search, color: Colors.grey),
                            ),
                            Expanded(
                              child: Text(
                                'Cari dalam Termurah di Shopee',
                                style: TextStyle(color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined, color: Colors.deepOrange),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartPage()),
                      );
                    },
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert, color: Colors.deepOrange),
                    onSelected: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Anda memilih: $value')),
                      );
                    },
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: 'Bantuan', child: Text('Bantuan')),
                      PopupMenuItem(value: 'Pengaturan', child: Text('Pengaturan')),
                      PopupMenuItem(value: 'Laporkan', child: Text('Laporkan Masalah')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryIcon('assets/images/vhr.jpg', 'Voucher\nHari Ini'),
                _buildCategoryIcon('assets/images/dm.jpg', 'Diskon\nMenyala'),
                _buildCategoryIcon('assets/images/jpm.jpg', 'Jaminan\nPaling Murah'),
                _buildCategoryIcon('assets/images/cct.jpg', 'Cara Cari\nTermurah'),
                _buildCategoryIcon('assets/images/bbk.jpg', 'Belanja Bds.\nKategori'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/ronaldinho.jpg',
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          _sectionTitle("VOUCHER HARI INI"),
          _voucherItem(
            context: context,
            image: 'assets/images/icon34.jpg',
            title: "Gratis Ongkir",
            subtitle: "Min. Blj Rp0",
            validUntil: "13 Apr",
            color: Colors.teal,
            buttonText: "Pakai",
          ),
          _voucherItem(
            context: context,
            image: 'assets/images/icon35.jpg',
            title: "Diskon 12%",
            subtitle: "Min. Blj Rp0",
            validUntil: "13 Apr",
            color: Colors.teal,
            buttonText: "Pakai",
          ),
          _voucherItem(
            context: context,
            image: 'assets/images/icon36.jpg',
            title: "Diskon 5%",
            subtitle: "Min. Blj Rp0",
            validUntil: "13 Apr",
            color: Colors.teal,
            buttonText: "Pakai",
          ),
          _sectionTitle("DISKON MENYALA"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Image.asset(
              'assets/images/diskon menyala.jpg',
              fit: BoxFit.cover,
            ),
          ),
          _sectionTitle("FLASH SALE"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      _formatDuration(_flashSaleDuration),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(width: 6),
                    const Text("Berlangsung", style: TextStyle(color: Colors.red)),
                    const Spacer(),
                    const Text("13 Apr", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _flashSaleItem(
                        imagePath: 'assets/images/make up.jpg',
                        title: 'Sea Makeup Acne Blur and Set Loose Powder',
                        oldPrice: 'Rp120.000',
                        newPrice: 'Rp9.900',
                      ),
                      _flashSaleItem(
                        imagePath: 'assets/images/tint.jpg',
                        title: 'True to Skin - Juicy Glass Tint',
                        oldPrice: 'Rp99.000',
                        newPrice: 'Rp8.900',
                      ),
                      _flashSaleItem(
                        imagePath: 'assets/images/maskerkopi.jpg',
                        title: 'Masker Organik Wajah - Matcha 100gr',
                        oldPrice: 'Rp80.000',
                        newPrice: 'Rp7.500',
                      ),
                      _flashSaleItem(
                        imagePath: 'assets/images/serum.jpg',
                        title: 'Serum Wajah Vit C + Niacinamide 30ml',
                        oldPrice: 'Rp150.000',
                        newPrice: 'Rp12.000',
                      ),
                      _flashSaleItem(
                        imagePath: 'assets/images/lipbalm.jpg',
                        title: 'Lip Balm Organic - Strawberry 10gr',
                        oldPrice: 'Rp50.000',
                        newPrice: 'Rp6.900',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                ScaleTransition(
                  scale: _animation,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "CEK SEMUA FLASH SALE",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIcon(String imagePath, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[200],
          child: Image.asset(imagePath, width: 24, height: 24),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.grey[200],
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.deepOrange,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _voucherItem({
    required BuildContext context,
    required String image,
    required String title,
    required String subtitle,
    required String validUntil,
    required Color color,
    required String buttonText,
  }) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        color: color,
        alignment: Alignment.center,
        child: const Icon(Icons.discount, color: Colors.white),
      ),
      title: Text(title),
      subtitle: Row(
        children: [
          Text("Berlaku Hingga: $validUntil"),
          const SizedBox(width: 5),
          const Text("S&K", style: TextStyle(color: Colors.blue)),
        ],
      ),
      trailing: OutlinedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Voucher "$title" berhasil dipakai!'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        child: Text(buttonText),
      ),
    );
  }

  Widget _flashSaleItem({
    required String imagePath,
    required String title,
    required String oldPrice,
    required String newPrice,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, height: 120, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text(
              oldPrice,
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
            Text(
              newPrice,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SimpleSearchDelegate extends SearchDelegate {
  final List<String> dummyResults = [
    'Gratis Ongkir',
    'Diskon 12%',
    'Diskon 5%',
    'Voucher Kecantikan',
    'Voucher Fashion'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () => close(context, null), icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text('Hasil untuk: "$query"'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = dummyResults.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(suggestions[index]),
        onTap: () => query = suggestions[index],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        backgroundColor: Colors.deepOrange,
      ),
      body: const Center(
        child: Text(
          'ini adalah keranjang',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
