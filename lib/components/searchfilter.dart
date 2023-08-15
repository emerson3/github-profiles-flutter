import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  final String searchText;
  final Function(String) onSearchTextChanged;

  SearchFilter({
    required this.searchText,
    required this.onSearchTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: onSearchTextChanged,
                      decoration: InputDecoration(
                        hintText: 'Filter by name',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
