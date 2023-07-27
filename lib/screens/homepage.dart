import 'package:flutter/material.dart';
import 'package:noteapp/constant.dart';
import 'package:noteapp/provider/addprovider.dart';
import 'package:noteapp/screens/additeam.dart';
import 'package:noteapp/screens/searchscreen.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notes",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  child: const Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AddProvider>(
              builder: (context, note, child) {
                return TextField(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SearchScreen())));
                  },
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
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
                        title: Text(DateTime.now().toString()),
                        trailing: IconButton(
                            onPressed: () {
                              value.removenote(value.addnote[index].toString());
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            )),
                        minLeadingWidth: 10,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade800,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AddIteam())));
        },
        child: const Icon(
          Icons.add,
          color: Colors.grey,
        ),
      ),
    );
  }
}
