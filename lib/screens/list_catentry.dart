import 'package:flutter/material.dart';
import 'package:cat_shop_mobile/models/cat_entry.dart';
import 'package:cat_shop_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class CatEntryPage extends StatefulWidget {
  const CatEntryPage({super.key});

  @override
  State<CatEntryPage> createState() => _CatEntryPageState();
}

class _CatEntryPageState extends State<CatEntryPage> {
  Future<List<CatEntry>> fetchCat(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');
    
    // Decode response to JSON
    var data = response;

    // Convert JSON to List of CatEntry objects
    List<CatEntry> listCat = [];
    for (var d in data) {
      if (d != null) {
        listCat.add(CatEntry.fromJson(d));
      }
    }
    return listCat;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Shop List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchCat(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'No data available in the Cat Shop.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Price: \$${snapshot.data![index].fields.price}",
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Description: ${snapshot.data![index].fields.description}",
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          snapshot.data![index].fields.link, // Use 'link' as specified in JSON
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return const Text(
                              'Image could not be loaded',
                              style: TextStyle(color: Colors.red),
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
        },
      ),
    );
  }
}
