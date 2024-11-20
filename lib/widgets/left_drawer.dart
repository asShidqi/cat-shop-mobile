import 'package:cat_shop_mobile/screens/list_catentry.dart';
import 'package:flutter/material.dart';
import 'package:cat_shop_mobile/screens/menu.dart';
import 'package:cat_shop_mobile/screens/catentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: const Column(
                  children: [
                    Text(
                      'Cat Shop',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8)),
                    Text(
                      "Ayo jual kucing yang mengganggu dirumahmu disini!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                    ),
                  ],
                ),
          ),
              ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.mood),
              title: const Text('Tambah Produk'),
              // Bagian redirection ke MoodEntryFormPage
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CatEntryFormPage(),
                    ));
              },
            ),
            ListTile(
                leading: const Icon(Icons.add_reaction_rounded),
                title: const Text('Daftar Kucing'),
                onTap: () {
                    // Route menu ke halaman mood
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CatEntryPage()),
                    );
                },
            ),
        ],
      ),
    );
  }
}