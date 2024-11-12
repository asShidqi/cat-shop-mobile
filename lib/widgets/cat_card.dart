import 'package:flutter/material.dart';
import 'package:cat_shop_mobile/screens/catentry_form.dart';

class ItemHomepage {
     final String name;
     final IconData icon;

     ItemHomepage(this.name, this.icon);
 }

class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item; 
  
  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Colors.black;
    // Set different colors based on the item name
    if (item.name == "Lihat Daftar Produk") {
      buttonColor = Colors.blue;
    } else if (item.name == "Tambah Produk") {
      buttonColor = Colors.green;
    } else if(item.name == "Logout") {
      buttonColor = Colors.red; // For Logout
    }
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: buttonColor,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
              // Navigate ke route yang sesuai (tergantung jenis tombol)
            if (item.name == "Tambah Produk") {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CatEntryFormPage(),
              ));
            }
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
