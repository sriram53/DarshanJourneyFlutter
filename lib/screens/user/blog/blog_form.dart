import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contentController = TextEditingController();
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  List<File> _images = [];
  AnimationController? _animationController;
  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController!,
        curve: Curves.easeInOut,
      ),
    );
    _animationController!.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contentController.dispose();
    _titleController.dispose();
    _locationController.dispose();
    _animationController?.dispose();
    super.dispose();
  }

  Future<void> _pickImages() async {
    List<XFile>? pickedImages = [];
    try {
      pickedImages = await ImagePicker().pickMultiImage(
        maxWidth: 500,
        maxHeight: 500,
        imageQuality: 80,
      );
    } catch (e) {
      print(e.toString());
    }

    if (pickedImages == null) return;

    setState(() {
      _images.clear();
      for (XFile imageFile in pickedImages!) {
        _images.add(File(imageFile.path));
      }
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Submission Complete"),
          content: Text(
              "Name: ${_nameController.text}\nTitle: ${_titleController.text}\nLocation: ${_locationController.text}\nContent: ${_contentController.text}"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form with Image Upload'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Builder(
          builder: (context) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SlideTransition(
                    position: _slideAnimation!,
                    child: Column(
                      children: [
                        _buildTextField(_nameController, 'Name', Icons.person),
                        const SizedBox(height: 16),
                        _buildTextField(_titleController, 'Title', Icons.title),
                        const SizedBox(height: 16),
                        _buildTextField(
                            _locationController, 'Location', Icons.location_on),
                        const SizedBox(height: 16),
                        _buildTextField(
                            _contentController, 'Content', Icons.text_fields),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _pickImages,
                    icon: const Icon(Icons.image),
                    label: const Text('Add Images'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_images.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _images
                          .map((image) => Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.file(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                              ))
                          .toList(),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(icon),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}