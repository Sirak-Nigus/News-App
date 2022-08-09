import 'package:mekelletimes/model/category.dart';

const DUMMY_CATEGORIES = const [
  Category(categoryId: 'C2', categoryName: 'Politics'),
  Category(categoryId: 'C3', categoryName: 'Sport'),
  Category(categoryId: 'C4', categoryName: 'Technology'),
  Category(categoryId: 'C5', categoryName: 'Bussiness')
];

// final DUMMY_NEWS = [
//   News(
//       newsId: 'n1',
//       newsTitle: 'What is included in congress 13 TRILLION SPENDING BILL',
//       newsPicture: 'assets/images/image8.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit.' +
//               '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. \n\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image8.jpg'],
//       newsSource: 'CNN',
//       category: 'Politics',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n2',
//       newsTitle: 'FIVE PLACES UNDER THE FALLS AND ABOVE THE CLOUDS',
//       newsPicture: 'assets/images/image2.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit.' +
//               '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. \n\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image1.jpg'],
//       newsSource: 'CNN',
//       category: 'Politics',
//       comments: []),
//   News(
//       newsId: 'n3',
//       newsTitle:
//           'Dan carter rolls back years while pro dominance leaves Englands',
//       newsPicture: 'assets/images/image3.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image3.jpg'],
//       newsSource: 'CNN',
//       category: 'Tech',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n4',
//       newsTitle:
//           'Relations between Russia and the West are at a new low. But how should we describe the current situation?',
//       newsPicture: 'assets/images/image4.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image3.jpg'],
//       newsSource: 'CNN',
//       category: 'Sport',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n5',
//       newsTitle:
//           'WPP is investigating an allegation of personal misconduct against its chief executive Sir Martin Sorrell.',
//       newsPicture: 'assets/images/investigate.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massatristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image5.jpg'],
//       newsSource: 'CNN',
//       category: 'Politics',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n6',
//       newsTitle:
//           'WPP is investigating an allegation of personal misconduct against its chief executive Sir Martin Sorrell.',
//       newsPicture: 'assets/images/image6.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/investigate.jpg'],
//       newsSource: 'CNN',
//       category: 'Tech',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n7',
//       newsTitle:
//           'Bahrain Grand Prix: Will Sebastian Vettel reign in the heat of the desert?',
//       newsPicture: 'assets/images/image8.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/investigate.jpg'],
//       newsSource: 'CNN',
//       category: 'Sport',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n8',
//       newsTitle:
//           'New Zealand v England: Visitors have good chance of Test win - Jonny Bairstow',
//       newsPicture: 'assets/images/image8.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/investigate.jpg'],
//       newsSource: 'CNN',
//       category: 'Sport',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n9',
//       newsTitle:
//           'California investigators have said a car that plunged off a roadside cliff, killing a family of eight.',
//       newsPicture: 'assets/images/image8.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/investigate.jpg'],
//       newsSource: 'CNN',
//       category: 'Politics',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n10',
//       newsTitle:
//           'California investigators have said a car that plunged off a roadside cliff, killing a family of eight.',
//       newsPicture: 'assets/images/image10.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/investigate.jpg'],
//       newsSource: 'CNN',
//       category: 'Tech',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n11',
//       newsTitle:
//           'California investigators have said a car that plunged off a roadside cliff, killing a family of eight.',
//       newsPicture: 'assets/images/image10.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image11.jpg'],
//       newsSource: 'CNN',
//       category: 'Politics',
//       comments: ['I think this is a good news for everyone!']),
// ];

// final DUMMY_LATEST_NEWS = [
//   News(
//       newsId: 'n1',
//       newsTitle: 'WHAT`S INCLUDED IN CONGRESS 13 TRILLION SPENDING BILL.',
//       newsPicture: 'assets/images/image8.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image1.jpg'],
//       newsSource: 'CNN',
//       category: 'Politics',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n2',
//       newsTitle: 'FIVE PLACES UNDER THE FALLS AND ABOVE THE CLOUDS.',
//       newsPicture: 'assets/images/image2.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image1.jpg'],
//       newsSource: 'CNN',
//       category: 'Politics',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n3',
//       newsTitle:
//           'Dan carter rolls back years while pro dominance leaves Englands.',
//       newsPicture: 'assets/images/image3.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image3.jpg'],
//       newsSource: 'CNN',
//       category: 'Politics',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n4',
//       newsTitle:
//           'Relations between Russia and the West are at a new low. But how should we describe the current situation?',
//       newsPicture: 'assets/images/image4.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image3.jpg'],
//       newsSource: 'CNN',
//       category: 'Politics',
//       comments: ['I think this is a good news for everyone!']),
//   News(
//       newsId: 'n5',
//       newsTitle:
//           'WPP is investigating an allegation of personal misconduct against its chief executive Sir Martin Sorrell.',
//       newsPicture: 'assets/images/investigate.jpg',
//       newsContent:
//           'Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla maximus pellentes que velit, quis nulla effi citur at.Maecenas sed massa tristique. consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at. effi citur at.Maecenas sed massa tristique. Duis non volutpat arcu, eu mollis tellus. Sed finibus aliquam neque sit amet sodales. Lorem ipsum dolor sit amet consectetur adipiscing elit. Nulla maximus pellentes que velit, quis consequat nulla effi citur at.Maecenas sed massa tristique.Duis non volutpat arcu, eu mollis tellus.',
//       createdAt: DateTime.now(),
//       newsAuthor: 'Anthony',
//       newsImages: ['assets/images/image5.jpg'],
//       newsSource: 'CNN',
//       category: 'Politics',
//       comments: ['I think this is a good news for everyone!']),
// ];
