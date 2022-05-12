import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController _scrollController = ScrollController();
  final _numbers = [];
  int _lastNum = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agrega10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: Stack(
        children: [
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: _numbers.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          final item = _numbers[index];
          return FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/seed/$item/500/300'),
          );
        },
      ),
      onRefresh: _refresh,
    );
  }

  void _agrega10() {
    for (int i = 0; i < 10; i++) {
      _numbers.add(_lastNum);
      _lastNum++;
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    const duration = Duration(seconds: 2);
    Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 250),
    );

    _agrega10();
  }

  _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(height: 20),
        ],
      );
      /* return const CircularProgressIndicator(); */
    } else {
      return Container();
    }
  }

  Future _refresh() async {
    const duration = Duration(seconds: 1);
    Timer(duration, () {
      _numbers.clear();
      _lastNum++;
      _agrega10();
    });
    return Future.delayed(duration);
  }
}
