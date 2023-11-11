import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Image Gallery"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int crossAxisCount = 4; // Initial crossAxisCount

    final List<String> imageUrls = [
    'https://picsum.photos/250?image=1',
    'https://picsum.photos/250?image=2',
    'https://picsum.photos/250?image=3',
    'https://picsum.photos/250?image=4',
    'https://picsum.photos/250?image=5',
    'https://picsum.photos/250?image=6',
    'https://picsum.photos/250?image=7',
    'https://picsum.photos/250?image=8',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=10',
    'https://picsum.photos/250?image=11',
    'https://picsum.photos/250?image=12',
    'https://picsum.photos/250?image=13',
    'https://picsum.photos/250?image=14',
    'https://picsum.photos/250?image=15',
    'https://picsum.photos/250?image=16',
    'https://picsum.photos/250?image=17',
    'https://picsum.photos/250?image=18',
    'https://picsum.photos/250?image=19',
    'https://picsum.photos/250?image=20',
    'https://picsum.photos/250?image=21',
    'https://picsum.photos/250?image=22',
    'https://picsum.photos/250?image=23',
    'https://picsum.photos/250?image=24',
    'https://picsum.photos/250?image=25',
    'https://picsum.photos/250?image=26',
    'https://picsum.photos/250?image=27',
    'https://picsum.photos/250?image=28',
    'https://picsum.photos/250?image=29',
    'https://picsum.photos/250?image=30',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, // Use the dynamic value
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageDetailScreen(
                    imageUrl: imageUrls[index],
                    title: 'Image Title',
                    description: 'Description for the $index image goes here.',
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(8.0),
              child: Image.network(imageUrls[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Toggle between 2 and 4 columns (you can modify this logic)
          setState(() {
            crossAxisCount = crossAxisCount == 4 ? 2 : 4;
          });
        },
        child: Icon(Icons.grid_on),
      ),
    );
  }
}


class ImageDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  ImageDetailScreen({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Detail"),
        backgroundColor: Colors.purple[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
