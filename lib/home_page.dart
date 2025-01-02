import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tr('shopify app')),
        ),
        body: ListView(
          children: [
            Text(
              tr('our products'),
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
                            width: 75,
                            height: 75,
                          ),
                        ),
                        Text('${tr('product')} $index'),
                        ElevatedButton.icon(
                          onPressed: _addToCart,
                          icon: Icon(Icons.add_shopping_cart),
                          label: Text(tr('add to cart')),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Text(
              tr('hot offers'),
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
                        Expanded(flex: 2, child: Text('${tr('offer')} $index')),
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
        content: Text(tr('snackbar')),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
