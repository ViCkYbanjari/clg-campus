import 'package:flutter/material.dart';
import 'package:university/features/colors.dart';

const Color defaultContainerColor = Color(0xFFE5E7EB);
const Color tappedContainerColor = Colors.white;
const Color defaultTextColor = Colors.black45;
const Color tappedTextColor = TextDarkBlue1;

class PhotoItem {
  final String id;
  final String title;
  final String imageUrl;
  final String category;

  PhotoItem({
    required this.id,
    this.title = "",
    required this.imageUrl,
    required this.category,
  });
}

final List<PhotoItem> allPhotos = [
  PhotoItem(
    id: '1',
    imageUrl: 'https://i.pinimg.com/736x/4a/55/72/4a55720fc2756fa463e77222097653c9.jpg',
    category: 'Campus Life',
    title: 'Movement',
  ),
  PhotoItem(
    id: '2',
    imageUrl: 'https://i.pinimg.com/736x/76/66/f6/7666f61f33eaa2447e2a97c0a9928683.jpg',
    category: 'Sports',
    title: 'Shot put',
  ),
  PhotoItem(
    id: '3',
    imageUrl: 'https://i.pinimg.com/736x/cc/42/f1/cc42f1f11e72f25be42fe48d6e5a3f98.jpg',
    category: 'Campus Life',
    title: 'Library Study Session',
  ),
  PhotoItem(
    id: '4',
    imageUrl: 'https://i.pinimg.com/474x/2b/45/6a/2b456a19c20f54b0a939e3a43163e475.jpg',
    category: 'sport',
    title: 'Volleyball',
  ),
  PhotoItem(
    id: '4',
    imageUrl: 'https://i.pinimg.com/736x/11/76/cc/1176cc78a9d83868eeb5080aa08a4a5d.jpg',
    category: 'Event',
    title: 'Annual Fest',
  ),
  PhotoItem(
    id: '5',
    imageUrl: 'https://i.pinimg.com/736x/25/05/d3/2505d330552db2a1d116ed69936ef783.jpg',
    category: 'Sports',
    title: 'Volleyball',
  ),
  PhotoItem(
    id: '6',
    imageUrl: 'https://i.pinimg.com/736x/1e/be/35/1ebe3550923f4f4eda4f4a214d9e824a.jpg',
    category: 'Campus Life',
    title: 'Student Union Meet',
  ),
  PhotoItem(
    id: '7',
    imageUrl: 'https://i.pinimg.com/736x/99/e3/e5/99e3e56b1b95911f9f9d4a8e0a469312.jpg',
    category: 'Event',
    title: 'Graduate Caremony ',
  ),
  PhotoItem(
    id: '8',
    imageUrl: 'https://i.pinimg.com/736x/0d/d0/aa/0dd0aa56ec853877b626e9e845399e54.jpg',
    category: 'Sports',
    title: 'Cricket',
  ),
  PhotoItem(
    id: '9',
    imageUrl: 'https://i.pinimg.com/1200x/fc/e2/52/fce252e5e4a326d6d7d886243e345643.jpg',
    category: 'Campus Life',
    title: 'Lecture',
  ),
  PhotoItem(
    id: '10',
    imageUrl: 'https://i.pinimg.com/736x/1f/93/36/1f933659b96aca9f06517df0c78cb95c.jpg',
    category: 'Event',
    title: 'Annual Sport',
  ),
  PhotoItem(
    id: '8',
    imageUrl: 'https://i.pinimg.com/736x/67/d1/96/67d196db0b725ae272107116f81b37ab.jpg',
    category: 'Sports',
    title: 'Cricket',
  ),
  PhotoItem(
    id: '10',
    imageUrl: 'https://i.pinimg.com/1200x/41/27/02/412702f64e5047cfb87e3a4fa2dca942.jpg',
    category: 'Event',
    title: 'Annual Sport',
  ),
];

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  int _selectedIndex = 0;
  final List<String> _categories = ["All", "Event", "Sports", "Campus Life"];
  List<PhotoItem> _filteredPhotos = [];
  @override
  void initState() {
    super.initState();
    _filterPhotos();
  }
  void _filterPhotos() {
    String selectedCategory = _categories[_selectedIndex];
    if (selectedCategory == "All") {
      _filteredPhotos = List.from(allPhotos);
    } else {
      _filteredPhotos = allPhotos.where((photo) => photo.category == selectedCategory).toList();
    }
  }


  Widget _buildCategoryButton(String text, int index) {
    bool isSelected = _selectedIndex == index;
    Color containerColor = isSelected
        ? tappedContainerColor
        : defaultContainerColor;
    Color textColor = isSelected ? tappedTextColor : defaultTextColor;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;

          _filterPhotos();
        });
      },
      child: Container(
        height: 60,

        width:
            (MediaQuery.of(context).size.width -
                40 -
                10 * (_categories.length - 1) -
                20) /
            _categories.length,

        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: containerColor,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
        backgroundColor: backgroundcolor,
        elevation: 0,
        title: Text(
          "Gallery",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: TextDarkBlue1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          children: [
            Container(
              height: 72,
              padding: const EdgeInsets.symmetric(vertical: 5),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),

                color: Color(0xffE5E7EB),
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  return _buildCategoryButton(_categories[index], index);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _filteredPhotos.isEmpty
                  ? Center(
                child: Text(
                  "No photos found for '${_categories[_selectedIndex]}'.",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              )
                  :    GridView.builder(
                padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: _filteredPhotos.length,
                itemBuilder: (context, index) {
                  final photo = _filteredPhotos[index];
                  return Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: GridTile(
                      footer: photo.title.isNotEmpty ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          photo.title,
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ) : null,
                      child: Image.network(
                        photo.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return const Center(child: Icon(Icons.broken_image, color: Colors.grey, size: 40));
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
