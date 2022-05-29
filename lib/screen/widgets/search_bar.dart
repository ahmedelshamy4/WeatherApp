import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/dio_service.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stateSearch = Provider.of<DioState>((context), listen: true);
    return Consumer<DioState>(builder: (context, dioState, child) {
      return TextFormField(
        controller: stateSearch.searchBar,
        style: const TextStyle(
          fontSize: 25.0,
          color: Colors.blueAccent,
        ),
        decoration: InputDecoration(
            filled: true,
            suffixIcon: IconButton(
              onPressed: () {
                if (dioState.searchBar.text.isNotEmpty) {
                  stateSearch.searchCity(dioState.searchBar.text);
                  dioState.searchBar.clear();
                }
              },
              icon: const Icon(Icons.search),
            ),
            hintText: "Search Your City",
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlue, width: 32.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 32.0),
            )),
      );
    });
  }
}
