import 'package:flutter/material.dart';

final List<Map<String, dynamic>> products = [
  {
    'image': 'assets/images/sendal.jpg',
    'title': 'Alisa - Sandal Jepit Kare...',
    'label': 'Sandal Santai Wanita',
    'price': 'Rp18.900',
    'discount': '-69%',
    'badge': 'Star'
  },
  {
    'image': 'assets/images/dompet.webp',
    'title': 'Abraar Kadabra Domp...',
    'label': 'Dompet Wanita',
    'price': 'Rp28.500',
    'discount': '-62%',
    'badge': 'Star+'
  },
  {
    'image': 'assets/images/kulot.jpg',
    'title': 'ORO PANTS - Loose Pa...',
    'label': 'Celana Kulot Premium',
    'price': 'Rp56.475',
    'discount': '-61%',
    'badge': 'Star'
  },
  {
    'image': 'assets/images/kaoskaki.webp',
    'title': '[Gratis Ongkir 10 pasa...',
    'label': 'Kaos Kaki Olahraga',
    'price': 'Rp28.200',
    'discount': '-53%',
    'badge': 'Star+'
  },
  {
    'image': 'assets/images/tas.jpg',
    'title': 'AMALIA82_COLLECTION Tas Wanita ...',
    'label': 'Tas',
    'price': 'Rp15.000',
    'discount': '',
    'badge': 'Star'
  },
  {
    'image': 'assets/images/headset.jpg',
    'title': 'Headset Handsfree ear...',
    'label': 'Elektronik',
    'price': 'Rp26.354',
    'discount': '-2%',
    'badge': 'Star+'
  },
  {
    'image': 'assets/images/parfum.jpg',
    'title': 'Parfum Inspired Lelabo 35M...',
    'label': 'Parfum & Wewangian',
    'price': 'Rp5.850',
    'discount': '-22%',
    'badge': 'Trend'
  },
  {
    'image': 'assets/images/joger.jpg',
    'title': 'Celana Jogger Wanita ...',
    'label': 'Celana Santai Korea',
    'price': 'Rp29.650',
    'discount': '-33%',
    'badge': 'Star+'
  },
];

class LivePage extends StatelessWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TRENDING',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DummySearchDelegate(),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.check_circle, size: 18),
                Text('Baru Setiap Hari'),
                Icon(Icons.check_circle, size: 18),
                Text('Gratis Ongkir'),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: Image.asset(product['image'], fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        color: Colors.red.shade300,
                        child: Text(
                          product['badge'] ?? '',
                          style: const TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          product['title'] ?? '',
                          style: const TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      product['label'] ?? '',
                      style: const TextStyle(color: Colors.orange, fontSize: 10),
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (product['price'] != null && product['price'].toString().isNotEmpty)
                    Text(
                      product['price'],
                      style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
                    ),
                  if (product['discount'] != null && product['discount'].toString().isNotEmpty)
                    Text(
                      product['discount'],
                      style: const TextStyle(color: Colors.red, fontSize: 12),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: const Center(child: Text('Ini halaman keranjang.')),
    );
  }
}

class DummySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, ''),
  );

  @override
  Widget buildResults(BuildContext context) =>
      Center(child: Text('Hasil pencarian: "$query"'));

  @override
  Widget buildSuggestions(BuildContext context) => ListView(
    children: List.generate(
      5,
          (index) => ListTile(title: Text('Saran $index untuk "$query"')),
    ),
  );
}
