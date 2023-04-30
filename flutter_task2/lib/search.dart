import 'package:flutter/material.dart';
import 'package:flutter_task2/providers/cart_provider.dart';
import 'package:provider/provider.dart';

// class Search extends StatelessWidget {
//   const Search({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Search'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Image(
//               image: AssetImage('assets/sadiq.jpeg'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    var items = context.watch<CartProvider>().items;
    var mylist = context.watch<CartProvider>().mylist;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Container()),
                );
              },
              icon: const Icon(Icons.shopping_cart),
              label: Text(
                "My Cart (${mylist.length})",
                style: const TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20)),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  final currentItem = items[index];
                  return Card(
                    key: ValueKey(currentItem.title),
                    color: Colors.black45,
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        currentItem.title,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: mylist.contains(currentItem)
                              ? Colors.red
                              : Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          if (!mylist.contains(currentItem)) {
                            context.read<CartProvider>().addToList(currentItem);
                          } else {
                            context
                                .read<CartProvider>()
                                .removeFromList(currentItem);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
