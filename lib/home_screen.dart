import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_api/model_together.dart';
import 'package:flutter_image_api/model_together.dart';
import 'package:flutter_image_api/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Data> _list = [];
  late int _page = 0;
  late int _count = 0;


  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {

      DiscoveryModel response = await ApiService.fetchModels();

      setState(() {
        _list = response.data!;
        _page = response.page ?? 0;
        _count = response.count ?? 0;


         print('${response.data}');
        print('${response.page}');
        print('${response.count}');
      });
    } catch (e) {
      print('Error loading lessons: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: DiscoveryModel == null || _list!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
            :
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Text('page : $_page'),
              Text('count : $_count'),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _list!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 500,
                      child: Card(
                        child: Row(
                          children: [
                            CircleAvatar(
                              foregroundImage: NetworkImage(_list[index].imageUrl ?? ''),
                            ),
                            Column(
                              children: [
                                Text('id : ${_list[index].id}'),
                                Text('title : ${_list[index].title}'),
                                Text('Description ${_list[index].description}')
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
