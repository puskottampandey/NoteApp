import 'package:flutter/material.dart';
import 'package:noteapp/screens/constant.dart';

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
      backgroundColor: backgroundColor,
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
                    note.filternote;
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
                  itemCount: value.filternote.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey.shade800,
                      child: ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              value.removenote(
                                  value.filternote[index].toString());
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                        leading: Text(
                          value.filternote[index].toString(),
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
