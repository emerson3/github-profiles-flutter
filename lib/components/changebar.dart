import 'package:estudo/components/ListItems.dart';
import 'package:estudo/components/searchfilter.dart';
import 'package:estudo/models/repository.dart';
import 'package:flutter/material.dart';

import '../models/starred.dart';

class ChangeBar extends StatefulWidget {
  final List<Repository> repository;
  final List<Starred> starred;
  ChangeBar(this.repository, this.starred);
  @override
  _ChangeBarState createState() => _ChangeBarState();
}

class _ChangeBarState extends State<ChangeBar> with TickerProviderStateMixin {
  late TabController _tabController;
  String searchTextRepository = '';
  String searchTextStarred = '';
  List<Repository> filteredRepositories = [];
  List<Starred> filteredStarred = [];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void filterRepositories() {
    setState(() {
      if (searchTextRepository.isEmpty) {
        filteredRepositories = widget.repository;
      } else {
        filteredRepositories = widget.repository.where((repository) {
          return repository.name!
              .toLowerCase()
              .contains(searchTextRepository.toLowerCase());
        }).toList();
      }
    });
  }

  void filterStarred() {
    setState(() {
      if (searchTextStarred.isEmpty) {
        filteredStarred = widget.starred;
      } else {
        filteredStarred = widget.starred.where((starred) {
          return starred.name!.toLowerCase().contains(searchTextStarred.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildCustomTab(String title, int count) {
      return Tab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 5),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Color(0xFFE3E3E3),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView( // Use SingleChildScrollView
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              tabs: [
                _buildCustomTab('Repos', widget.repository.length),
                _buildCustomTab('Starred', widget.starred.length),
              ],
              indicatorColor: Color(0xFFE36209),
              unselectedLabelStyle: TextStyle(color: Colors.grey),
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchFilter(
                          searchText: searchTextRepository,
                          onSearchTextChanged: (value) {
                            setState(() {
                              searchTextRepository = value;
                              filterRepositories();
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    if (searchTextRepository.isNotEmpty && filteredRepositories.isEmpty)
                      Text('Nenhum repositório encontrado.'),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: searchTextRepository.isEmpty
                            ? widget.repository.length
                            : filteredRepositories.length,
                        itemBuilder: (context, index) {
                          final repository = searchTextRepository.isEmpty
                              ? widget.repository[index]
                              : filteredRepositories[index];

                          return ListItems(
                            name: repository.name,
                            description: repository.description,
                            icon: 'code',
                            additionalInfo: repository.language,
                            forksCount: repository.forksCount ?? 0,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchFilter(
                          searchText: searchTextStarred,
                          onSearchTextChanged: (value) {
                            setState(() {
                              searchTextStarred = value;
                              filterStarred();
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    if (searchTextStarred.isNotEmpty && filteredStarred.isEmpty)
                      Text('Nenhum repositório encontrado.'),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: searchTextStarred.isEmpty
                            ? widget.starred.length
                            : filteredStarred.length,
                        itemBuilder: (context, index) {
                          final starred = searchTextStarred.isEmpty
                              ? widget.starred[index]
                              : filteredStarred[index];

                          return ListItems(
                            name: starred.name,
                            description: starred.description,
                            icon: 'star',
                            additionalInfo: starred.starCount.toString(),
                            forksCount: starred.forksCount ?? 0,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
