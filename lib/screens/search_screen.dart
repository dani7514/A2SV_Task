import 'package:flutter/material.dart';
import '../models/article.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<NewsArticle> _searchResults = [] ;

  void _performSearch(String keyword) {

    List<NewsArticle> searchResults = searchNewsArticles(keyword);

    setState(() {
      _searchResults = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Enter keyword',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    String keyword = _searchController.text;
                    _performSearch(keyword);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                NewsArticle article = _searchResults[index];
                return ListTile(
                  leading: Image.network(article.imageUrl),
                  title: Text(article.title),
                  subtitle: Text(article.description),
                  trailing: Text(article.author),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

