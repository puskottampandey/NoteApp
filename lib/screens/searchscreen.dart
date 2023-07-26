import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:noteapp/constant.dart';
import 'package:provider/provider.dart';

import '../provider/addprovider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Consumer<AddProvider>(
              builder: (context, note, child) {
                return TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Search notes",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    fillColor: (Colors.grey.shade800),
                    filled: true,
                  ),
                  onChanged: (value) {
                    note.setSearchquery(value);
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Consumer<AddProvider>(builder: (context, value, child) {
              return ListView.builder(
                  itemCount: value.addnote.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey.shade800,
                      child: ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              value.removenote(value.addnote[index].toString());
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                        leading: Text(
                          value.addnote[index].toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    );
                  });
            }))
          ],
        ),
      ),
    );
  }
}
