import 'package:flutter/material.dart';
import 'package:sample_show_search/data.dart';

class HomeSearchDelegate extends SearchDelegate<String> {
  static final List<String> history = <String>[];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    final data = names.where((name) => query != '' && name.toLowerCase().contains(query.toLowerCase()));

    return SizedBox.expand(
      child: ListView(
        children: <Widget>[
          for (final temp in data)
            ListTile(
              title: Text(temp),
              onTap: () {
                close(context, temp);
              },
            )
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final data = names.where((name) => query != '' && name.toLowerCase().contains(query.toLowerCase()));

    return SizedBox.expand(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          for (final temp in data)
            ListTile(
              title: Text(temp),
              onTap: () {
                close(context, temp);
              },
            ),
        ],
      ),
    );
  }

  @override
  void close(BuildContext context, String result) {
    super.close(context, result);

    history.insert(0, result);

    if (history.length >= 4) {
      history.removeAt(4);
    }
  }
}
