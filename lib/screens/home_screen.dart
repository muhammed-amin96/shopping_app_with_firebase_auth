import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopify App'),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Text(
              'Our Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: PageView(
                children: [
                  Image.network('https://picsum.photos/200', fit: BoxFit.cover),
                  Image.network('https://picsum.photos/300', fit: BoxFit.cover),
                  Image.network('https://picsum.photos/400', fit: BoxFit.cover),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://picsum.photos/200',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        Text('Product $index'),
                        ElevatedButton.icon(
                          onPressed: _addToCart,
                          icon: Icon(Icons.add_shopping_cart),
                          label: Text('add to cart'),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(
              'Hot Offers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          'https://picsum.photos/200',
                          width: 120,
                        ),
                        Expanded(flex: 2, child: Text('Offer $index')),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }

  void _addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(' Item added to cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
