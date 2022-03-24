import 'package:flutter/material.dart';
import 'package:flutter_bloc_pkg/item.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  final List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.archive),
          ),
        ],
      ),
      body: ListView(
        children: _itemList.map((el) => _buildItem(el)).toList(),
      ),
    );
  }

  Widget _buildItem(Item item) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(
          item.title,
          style: const TextStyle(fontSize: 30),
        ),
        subtitle: Text('${item.price}'),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.check_box_outlined),
        ),
      ),
    );
  }
}
