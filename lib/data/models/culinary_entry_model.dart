import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  final String address;
  final GeoPoint coordinates;

  LocationModel({required this.address, required this.coordinates});

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      address: map['address'] ?? '',
      coordinates: map['coordinates'] ?? const GeoPoint(0, 0),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'coordinates': coordinates,
    };
  }
}

class RatingModel {
  final double user1Rating;
  final double user2Rating;
  final double averageRating;

  RatingModel(
      {required this.user1Rating,
      required this.user2Rating,
      required this.averageRating});

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      user1Rating: (map['user1Rating'] ?? 0).toDouble(),
      user2Rating: (map['user2Rating'] ?? 0).toDouble(),
      averageRating: (map['averageRating'] ?? 0).toDouble(),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'user1Rating': user1Rating,
      'user2Rating': user2Rating,
      'averageRating': averageRating,
    };
  }
}

class NotesModel {
  final String shared;
  final Map<String, String> private;
  NotesModel({required this.shared, required this.private});
  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
      shared: map['shared'] ?? '',
      private: Map<String, String>.from(map['private'] ?? {}),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'shared': shared,
      'private': private,
    };
  }
}

class CulinaryEntryModel {
  final String id;
  final String coupleId;
  final String addedBy;
  final String placeName;
  final String cuisineType;
  final DateTime dateVisited;
  final LocationModel location;
  final RatingModel ratings;
  final List<String> photos;
  final NotesModel notes;
  final List<String> tags;
  final String priceRange;
  final bool isBookmarked;
  final int visitCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  CulinaryEntryModel({
    required this.id,
    required this.coupleId,
    required this.addedBy,
    required this.placeName,
    required this.cuisineType,
    required this.dateVisited,
    required this.location,
    required this.ratings,
    required this.photos,
    required this.notes,
    required this.tags,
    required this.priceRange,
    required this.isBookmarked,
    required this.visitCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CulinaryEntryModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return CulinaryEntryModel(
      id: doc.id,
      coupleId: data['coupleId'] ?? '',
      addedBy: data['addedBy'] ?? '',
      placeName: data['placeName'] ?? '',
      cuisineType: data['cuisineType'] ?? '',
      dateVisited: (data['dateVisited'] as Timestamp).toDate(),
      location: LocationModel.fromMap(data['location'] ?? {}),
      ratings: RatingModel.fromMap(data['ratings'] ?? {}),
      photos: List<String>.from(data['photos'] ?? []),
      notes: NotesModel.fromMap(data['notes'] ?? {}),
      tags: List<String>.from(data['tags'] ?? []),
      priceRange: data['priceRange'] ?? '',
      isBookmarked: data['isBookmarked'] ?? false,
      visitCount: data['visitCount'] ?? 1,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'coupleId': coupleId,
      'addedBy': addedBy,
      'placeName': placeName,
      'cuisineType': cuisineType,
      'dateVisited': Timestamp.fromDate(dateVisited),
      'location': location.toMap(),
      'ratings': ratings.toMap(),
      'photos': photos,
      'notes': notes.toMap(),
      'tags': tags,
      'priceRange': priceRange,
      'isBookmarked': isBookmarked,
      'visitCount': visitCount,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}