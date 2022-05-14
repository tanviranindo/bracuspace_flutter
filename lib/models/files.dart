import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class Files {
  final Reference ref;
  final String name;
  final double? size;
  final DateTime? created;
  final String url;

  Files({
    required this.ref,
    required this.name,
    required this.size,
    required this.created,
    required this.url,
  });
}

Future<List<Files>> fetchFile() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User user = auth.currentUser!;

  final ref = FirebaseStorage.instance.ref().child("${user.email}/");
  final listResult = await ref.listAll();

  List<Files> list = [];

  for (var i = 0; i < listResult.items.length; i++) {
    final item = listResult.items[i];

    final fileMeta = await item.getMetadata();
    list.add(Files(
        ref: item,
        name: fileMeta.name,
        size: fileMeta.size?.toDouble(),
        created: fileMeta.timeCreated,
        url: fileMeta.fullPath));
  }
  return list;
}

Future<List<Files>> fileList = fetchFile();

// List<Files> fileList1 = [
//   Files(
//     ref: FirebaseStorage.instance.ref().child('file1.pdf'),
//     name: 'Mobile App',
//     size: 0,
//     created: DateTime.now(),
//     url: '',
//   ),
//   Files(
//     ref: FirebaseStorage.instance.ref().child('file2.pdf'),
//     name: 'SVG Icons',
//     size: 0,
//     created: DateTime.now(),
//     url: '',
//   ),
//   Files(
//     ref: FirebaseStorage.instance.ref().child('file3.pdf'),
//     name: 'Prototypes',
//     url: '',
//     created: DateTime.now(),
//     size: 0,
//   ),
//   Files(
//     ref: FirebaseStorage.instance.ref().child('file4.pdf'),
//     name: 'Avatars',
//     size: 0,
//     created: DateTime.now(),
//     url: '',
//   ),
//   Files(
//     ref: FirebaseStorage.instance.ref().child('file5.pdf'),
//     name: 'Design',
//     size: 0,
//     created: DateTime.now(),
//     url: '',
//   ),
//   Files(
//     ref: FirebaseStorage.instance.ref().child('file6.pdf'),
//     name: 'Portfolio',
//     size: 0,
//     created: DateTime.now(),
//     url: '',
//   ),
//   Files(
//     ref: FirebaseStorage.instance.ref().child('file7.pdf'),
//     name: 'References',
//     size: 0,
//     created: DateTime.now(),
//     url: '',
//   ),
//   Files(
//     ref: FirebaseStorage.instance.ref().child('file8.pdf'),
//     name: 'Clients',
//     size: 0,
//     created: DateTime.now(),
//     url: '',
//   ),
// ];
