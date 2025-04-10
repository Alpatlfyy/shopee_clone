import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'pulsa_tagihan.dart';
import 'keuangan.dart';
import 'shopeevip.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = List.generate(10, (index) => {
      'image': 'assets/images/icon${index + 1}.png'
    });

    final List<Map<String, String>> products = [
      {'image': 'assets/images/masker_buff.png', 'title': 'Masker Buff', 'price': 'Rp3.950'},
      {'image': 'assets/images/kemeja_casual.png', 'title': 'Kemeja Casual', 'price': 'Rp50.000'},
      {'image': 'assets/images/sepatu_sport.png', 'title': 'Sepatu Sport', 'price': 'Rp120.000'},
      {'image': 'assets/images/jam_tangan.png', 'title': 'Jam Tangan', 'price': 'Rp99.999'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Cari di sini...',
              hintStyle: const TextStyle(color: Colors.deepOrange),
              prefixIcon: const Icon(Icons.search, color: Colors.deepOrange),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.deepOrange),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.deepOrange),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
              ),
            ),
            style: const TextStyle(color: Colors.deepOrange),
          ),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.chat, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/image 1.png', height: 50),
                  Image.asset('assets/images/image 2.png', height: 50),
                  Image.asset('assets/images/image 3.png', height: 50),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 100,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (categories.length / 5).ceil(),
                itemBuilder: (context, pageIndex) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(5, (index) {
                      int dataIndex = pageIndex * 5 + index;
                      if (dataIndex >= categories.length) return const SizedBox();

                      final pages = [
                        PulsaTagihanTiketPage(),
                         keuangan(),
                         ShopeeVipPage(),
                      ];

                      return GestureDetector(
                        onTap: () {
                          if (dataIndex < pages.length) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => pages[dataIndex]),
                            );
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/images/icon${dataIndex + 1}.png',
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/images/image 4.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.only(left: 10, top: 8, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Row(
                            children: [
                              Text('Shopee Live', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 18)),
                              const SizedBox(width: 4),
                              const Icon(Icons.arrow_forward_ios, size: 18 , color: Colors.deepOrange),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          right: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset('assets/images/image 5.jpg', height: 120),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset('assets/images/image 6.jpg', height: 120),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 180,
                    margin: const EdgeInsets.only(right: 10, top: 8, left: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Row(
                            children: [
                              Text('Shopee Video', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 18)),
                              const SizedBox(width: 4),
                              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.deepOrange),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 8,
                          right: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset('assets/images/image 7.jpg', height: 120),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset('assets/images/image 8.jpg', height: 120),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length + 1,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 220,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                viewportFraction: 1.0,
                                enlargeCenterPage: false,
                              ),
                              items: [
                                'assets/images/banner_promo.png',
                                'assets/images/jam_tangan.png',
                                'assets/images/kemeja_casual.png',
                                'assets/images/masker_buff.png',
                                'assets/images/sepatu_sport.png'
                              ].map((imagePath) {
                                return Image.asset(
                                  imagePath,
                                  width: double.infinity,
                                  height: 150,
                                  fit: BoxFit.cover,
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      }

                      final product = products[index - 1];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                product['image'] ?? '',
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                              child: Text(
                                product['title'] ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                              child: Text(
                                product['price'] ?? '',
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}