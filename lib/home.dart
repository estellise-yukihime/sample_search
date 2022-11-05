import 'package:flutter/material.dart';
import 'package:sample_show_search/data.dart';
import 'package:sample_show_search/home_search_delegate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    final data = names.where((current) => current.contains(searchValue)).toList();

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final temp = await showSearch(context: context, delegate: HomeSearchDelegate());

              setState(() {
                searchValue = temp ?? '';
              });
            },
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                searchValue = '';
              });
            },
            icon: const Icon(Icons.cleaning_services_rounded),
          )
        ],
      ),
      body: SizedBox.expand(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index]),
            );
          },
          physics: const BouncingScrollPhysics(),
          itemCount: data.length,
        ),
      ),
    );
  }
}
