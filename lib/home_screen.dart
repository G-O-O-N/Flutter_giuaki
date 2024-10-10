import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _tenSPController = TextEditingController();
  final TextEditingController _loaiController = TextEditingController();
  final TextEditingController _giaController = TextEditingController();

  final CollectionReference _sanpham =
  FirebaseFirestore.instance.collection("sanpham");

  String? _selectedProductId; // Để lưu trữ ID của sản phẩm đang chỉnh sửa

  void _addOrUpdateSanpham() {
    if (_selectedProductId == null) {
      // Thêm sản phẩm mới
      _sanpham.add({
        'TenSP': _tenSPController.text,
        'Gia': _giaController.text,
        'Loai': _loaiController.text,
      });
    } else {
      // Cập nhật sản phẩm hiện có
      _sanpham.doc(_selectedProductId).update({
        'TenSP': _tenSPController.text,
        'Gia': _giaController.text,
        'Loai': _loaiController.text,
      });
      _selectedProductId = null; // Sau khi cập nhật, reset lại biến này
    }

    // Xóa nội dung của TextField sau khi thêm hoặc cập nhật
    _tenSPController.clear();
    _giaController.clear();
    _loaiController.clear();
  }

  // Chức năng sửa sản phẩm
  void _editSanpham(DocumentSnapshot docSanpham) {
    _tenSPController.text = docSanpham['TenSP'];
    _loaiController.text = docSanpham['Loai'];
    _giaController.text = docSanpham['Gia'].toString();

    // Lưu lại ID của sản phẩm để biết là đang chỉnh sửa
    _selectedProductId = docSanpham.id;
  }

  // Chức năng xóa sản phẩm
  void _deleteSanpham(String sanphamId) {
    _sanpham.doc(sanphamId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            "Dữ Liệu Sản Phẩm",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _tenSPController,
              decoration: const InputDecoration(labelText: "Nhập tên sản phẩm"),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _loaiController,
              decoration:
              const InputDecoration(labelText: "Nhập loại sản phẩm"),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _giaController,
              decoration: const InputDecoration(labelText: "Nhập giá sản phẩm"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                _addOrUpdateSanpham();
              },
              child: Text(_selectedProductId == null ? "Thêm Sản Phẩm" : "Cập Nhật Sản Phẩm"),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: StreamBuilder(
                stream: _sanpham.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var sanpham = snapshot.data!.docs[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tên sản phẩm: ${sanpham['TenSP']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Loại: ${sanpham['Loai']}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'giá sản phẩm: ${sanpham['Gia'].toString()}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        _deleteSanpham(sanpham.id);
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _editSanpham(sanpham);
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
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
