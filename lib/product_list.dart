import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _HomePageState();
}

class _HomePageState extends State<ProductList> {
  final List<String> filters = const [
    "All",
    "Mouse",
    "Keyboards",
    "Monitors",
    "Pre-Built PCs",
  ];
  late String selectedFilter;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 85, 85, 85)),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        bottomLeft: Radius.circular(32),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Shopping\nApp",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: border,
                      focusedBorder: border,
                      enabledBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            selectedFilter = filter;
                          },
                        );
                      },
                      child: Chip(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 226, 232, 255),
                        ),
                        backgroundColor: selectedFilter == filter
                            ? const Color.fromARGB(218, 94, 150, 255)
                            : const Color.fromARGB(255, 236, 240, 255),
                        padding: const EdgeInsets.all(8),
                        label: Text(filter),
                        labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetailsPage(product: product);
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as int,
                        image: product['imageUrl'] as String,
                        bgColor: index.isEven
                            ? const Color.fromARGB(255, 206, 223, 255)
                            : const Color.fromARGB(255, 236, 239, 255),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
