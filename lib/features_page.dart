import 'package:flutter/material.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      {
        'title': 'Catalog Browsing',
        'description': 'Search for books by author, title, or category.',
        'icon': Icons.search,
      },
      {
        'title': 'Book Borrowing',
        'description': 'Digitally borrow and return books.',
        'icon': Icons.book,
      },
      {
        'title': 'GPS Library Location',
        'description': 'Real-time tracking of the library\'s current location.',
        'icon': Icons.location_on,
      },
      {
        'title': 'Notifications',
        'description':
            'Alerts for due dates, new arrivals, and library proximity.',
        'icon': Icons.notifications,
      },
      {
        'title': 'Offline Access',
        'description': 'Download books for offline reading.',
        'icon': Icons.cloud_download,
      },
      {
        'title': 'Reading Lists',
        'description': 'Manage personal reading lists and bookmarks.',
        'icon': Icons.list,
      },
      {
        'title': 'User Reviews and Ratings',
        'description': 'Leave reviews and ratings for books.',
        'icon': Icons.star,
      },
      {
        'title': 'Book Recommendations',
        'description':
            'Get book suggestions based on reading history and preferences.',
        'icon': Icons.recommend,
      },
      {
        'title': 'Social Sharing',
        'description': 'Share favorite books or reading lists on social media.',
        'icon': Icons.share,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ReadRover Features'),
      ),
      body: ListView.builder(
        itemCount: features.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(features[index]['icon'] as IconData),
              title: Text(features[index]['title'] as String),
              subtitle: Text(features[index]['description'] as String),
              onTap: () {
                // TODO: Implement feature-specific functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${features[index]['title']} tapped')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
