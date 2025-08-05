import 'package:flutter/material.dart';
import 'package:logbook_fav/presentation/widgets/responsive_entry_card.dart';
import 'package:logbook_fav/data/models/culinary_entry_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Culinary Journey'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filter functionality
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ResponsiveEntryCard(
            entry: _getDummyEntry(),
          ),
          const SizedBox(height: 16),
          ResponsiveEntryCard(
            entry: _getDummyEntry(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to Add Entry Page
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  CulinaryEntryModel _getDummyEntry() {
    return CulinaryEntryModel(
      id: '1',
      coupleId: 'couple1',
      addedBy: 'user1',
      placeName: 'Seafood Paradise',
      cuisineType: 'Seafood',
      dateVisited: DateTime.now(),
      location: LocationModel(
          address: '123 Ocean Drive', coordinates: const GeoPoint(0, 0)),
      ratings:
          RatingModel(user1Rating: 4, user2Rating: 5, averageRating: 4.5),
      photos: [
        'https://images.unsplash.com/photo-1559847844-5315695d0e66?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      ],
      notes: NotesModel(shared: 'Great place for a date night!', private: {}),
      tags: ['anniversary', 'favorite'],
      priceRange: '\$\$\$',
      isBookmarked: true,
      visitCount: 2,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}