
import 'package:flutter/material.dart';

void main() {
  runApp(const LostFoundApp());
}

class LostFoundApp extends StatelessWidget {
  const LostFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lost & Found',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF315C4B),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;
  int selectedTab = 0;
  String searchText = '';

  final categories = ['All', 'Electronics', 'Bags', 'Keys', 'Documents'];

  final items = [
    {
      'name': 'Wireless Headphones',
      'place': 'Library, 1st Floor',
      'category': 'Electronics',
      'icon': Icons.headphones,
      'color': const Color(0xFFE5E9FF),
      'status': 'Lost',
    },
    {
      'name': 'Blue Backpack',
      'place': 'College Cafeteria',
      'category': 'Bags',
      'icon': Icons.backpack,
      'color': const Color(0xFFFFE8D9),
      'status': 'Found',
    },
    {
      'name': 'House Keys',
      'place': 'Parking Area',
      'category': 'Keys',
      'icon': Icons.key,
      'color': const Color(0xFFDDF3E8),
      'status': 'Lost',
    },
    {
      'name': 'Student ID Card',
      'place': 'Main Building',
      'category': 'Documents',
      'icon': Icons.badge,
      'color': const Color(0xFFFFF0C9),
      'status': 'Found',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = items.where((item) {
      final matchesSearch = item['name']
          .toString()
          .toLowerCase()
          .contains(searchText.toLowerCase());
      final matchesCategory = selectedCategory == 0 ||
          item['category'] == categories[selectedCategory];
      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8F5),
        title: const Row(
          children: [
            Icon(Icons.travel_explore, color: Color(0xFF315C4B), size: 30),
            SizedBox(width: 8),
            Text(
              'FindIt',
              style: TextStyle(
                color: Color(0xFF244536),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: selectedTab == 0
          ? SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(18),
                children: [
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: const Color(0xFF315C4B),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lost something?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Let’s help you find what matters.',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                        SizedBox(height: 18),
                        Row(
                          children: [
                            Icon(Icons.search, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Search. Connect. Recover.',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    onChanged: (value) => setState(() => searchText = value),
                    decoration: InputDecoration(
                      hintText: 'Search lost items...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Browse Categories',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(categories.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(categories[index]),
                            selected: selectedCategory == index,
                            onSelected: (_) => setState(
                              () => selectedCategory = index,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Items',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('${filteredItems.length} items'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (filteredItems.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(child: Text('No matching items found.')),
                    ),
                  ...filteredItems.map((item) {
                    final isLost = item['status'] == 'Lost';
                    return Card(
                      color: Colors.white,
                      elevation: 0,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            color: item['color'] as Color,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            item['icon'] as IconData,
                            size: 30,
                            color: const Color(0xFF315C4B),
                          ),
                        ),
                        title: Text(
                          item['name'] as String,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(item['place'] as String),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: isLost
                                ? const Color(0xFFFFE1DD)
                                : const Color(0xFFDDF3E8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            item['status'] as String,
                            style: TextStyle(
                              color: isLost
                                  ? Colors.red.shade800
                                  : Colors.green.shade800,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(item['name'] as String),
                              content: Text(
                                'Location: ${item['place']}\n'
                                'Category: ${item['category']}\n'
                                'Status: ${item['status']}',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            )
          : selectedTab == 1
              ? const Center(
                  child: Text(
                    'My Reports\n\nYour reported items will appear here.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                )
              : const Center(
                  child: Text(
                    'Profile\n\nWelcome to FindIt!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF315C4B),
        foregroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (dialogContext) {
              final nameController = TextEditingController();
              final locationController = TextEditingController();
              String status = 'Lost';

              return StatefulBuilder(
                builder: (context, refreshDialog) => AlertDialog(
                  title: const Text('Report an Item'),
                  content: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Item name',
                          ),
                        ),
                        TextField(
                          controller: locationController,
                          decoration: const InputDecoration(
                            labelText: 'Location',
                          ),
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          value: status,
                          decoration: const InputDecoration(labelText: 'Status'),
                          items: ['Lost', 'Found']
                              .map((value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              refreshDialog(() => status = value);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogContext),
                      child: const Text('Cancel'),
                    ),
                    FilledButton(
                      onPressed: () {
                        if (nameController.text.trim().isEmpty ||
                            locationController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Enter the item name and location.'),
                            ),
                          );
                          return;
                        }

                        setState(() {
                          items.insert(0, {
                            'name': nameController.text.trim(),
                            'place': locationController.text.trim(),
                            'category': 'Other',
                            'icon': Icons.inventory_2,
                            'color': const Color(0xFFE5E9FF),
                            'status': status,
                          });
                        });
                        nameController.dispose();
                        locationController.dispose();
                        Navigator.pop(dialogContext);
                        ScaffoldMessenger.of(this.context).showSnackBar(
                          const SnackBar(content: Text('Item reported!')),
                        );
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Report Item'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (index) => setState(() => selectedTab = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment),
            label: 'My Reports',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
