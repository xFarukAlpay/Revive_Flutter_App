import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tirloj/presentation/ilan_ver_shared/ilan_ver_shared_screen.dart';

class IlanVerPictureScreen extends StatefulWidget {
  @override
  _IlanVerPictureScreenState createState() => _IlanVerPictureScreenState();
}

class _IlanVerPictureScreenState extends State<IlanVerPictureScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _ilanBaslik;
  String? _urunDetay;
  List<XFile> _selectedImages = [];

  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    if (pickedImages != null && pickedImages.isNotEmpty) {
      setState(() {
        _selectedImages = pickedImages;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IlanVerSharedScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İlan Ver'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resim Ekle',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: _pickImages,
                child: Container(
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: _selectedImages.isNotEmpty
                      ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _selectedImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.file(
                          File(_selectedImages[index].path),
                          fit: BoxFit.cover,
                          width: 100.0,
                        ),
                      );
                    },
                  )
                      : Center(
                    child: Text('Resim Seç'),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'İlan Başlığı',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Başlık boş bırakılamaz';
                  }
                  return null;
                },
                onSaved: (value) {
                  _ilanBaslik = value;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Ürün Detayı',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Detay boş bırakılamaz';
                  }
                  return null;
                },
                onSaved: (value) {
                  _urunDetay = value;
                },
              ),
              SizedBox(height: 24.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Gönder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
