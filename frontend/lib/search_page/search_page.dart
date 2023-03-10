import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<dynamic> products = [
    {
      'name': 'IPhone',
      'rating': 3.0,
      'image':
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'
    },
    {
      'name': 'IPhone X 2',
      'rating': 3.0,
      'image':
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 11',
      'rating': 4.0,
      'image':
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
    },
    {
      'name': 'IPhone 12',
      'rating': 5.0,
      'image':
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            actions: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Hero(
                    tag: "search",
                    child: Material(
                      type: MaterialType.transparency,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        autofocus: true,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: "Search products",
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (value) {
                          print("input");
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: buildSearchResult(products));
  }
}

Widget buildSearchResult(List searchResult) => ListView.builder(
      itemCount: searchResult.length,
      itemBuilder: (context, index) {
        final product = searchResult[index];

        return Card(
          child: ListTile(
            leading: Image.network(
              product['image'],
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            title: Text(product['name']),
          ),
        );
      },
    );
