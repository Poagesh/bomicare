// InputPageOne.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddCropPage extends StatefulWidget {
  final Function(Map<String, String>) updateAddress;

  AddCropPage({required this.updateAddress});

  @override
  _AddCropPageState createState() => _AddCropPageState();
}

class _AddCropPageState extends State<AddCropPage> {
  final TextEditingController nitrogenController = TextEditingController();
  final TextEditingController phosphorusController = TextEditingController();
  final TextEditingController potassiumController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController humidityController = TextEditingController();
  final TextEditingController rainfallController = TextEditingController();
  final TextEditingController phController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController address3Controller = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController areaController = TextEditingController();

  String selectedCrop = '';
  List<String> crops = [];
  bool isLoading = false;

  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }

  Map<String, String> addressDetails = {};

  void saveAddressDetails() {
    setState(() {
      addressDetails['address1'] = address1Controller.text;
      addressDetails['address2'] = address2Controller.text;
      addressDetails['address3'] = address3Controller.text;
      addressDetails['pincode'] = pincodeController.text;
      widget.updateAddress(addressDetails);
    });
  }

  Future<void> getRecommendation() async {
    setState(() {
      isLoading = true;
    });
    print('Button pressed, starting network call');

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/predict'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'N': int.parse(nitrogenController.text),
          'P': int.parse(phosphorusController.text),
          'K': int.parse(potassiumController.text),
          'temperature': double.parse(temperatureController.text),
          'humidity': double.parse(humidityController.text),
          'ph': double.parse(phController.text),
          'rainfall': double.parse(rainfallController.text),
        }),
      );

      print('Network call completed');

      if (response.statusCode == 200) {
        setState(() {
          selectedCrop = jsonDecode(response.body)['crop'];
          crops.add(selectedCrop);
          isLoading = false;
        });
        print('Crop recommendation received: $selectedCrop');
      } else {
        print('Failed to get recommendation: ${response.statusCode}');
        throw Exception('Failed to get recommendation');
      }
    } catch (e) {
      print('Error during network call: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Crop'),
        backgroundColor: Color(0xFF90EE90),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: _image == null
                  ? ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Upload Soil Image'),
                    )
                  : Image.file(
                      File(_image!.path),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 16),
            buildTextField(
                nitrogenController, 'Nitrogen amount', TextInputType.number),
            buildTextField(phosphorusController, 'Phosphorus amount',
                TextInputType.number),
            buildTextField(
                potassiumController, 'Potassium amount', TextInputType.number),
            buildTextField(temperatureController, 'Temperature',
                TextInputType.numberWithOptions(decimal: true)),
            buildTextField(humidityController, 'Humidity',
                TextInputType.numberWithOptions(decimal: true)),
            buildTextField(rainfallController, 'Rainfall',
                TextInputType.numberWithOptions(decimal: true)),
            buildTextField(phController, 'pH value',
                TextInputType.numberWithOptions(decimal: true)),
            buildTextField(
                address1Controller, 'Address line 1', TextInputType.text),
            buildTextField(
                address2Controller, 'Address line 2', TextInputType.text),
            buildTextField(
                address3Controller, 'Address line 3', TextInputType.text),
            buildTextField(pincodeController, 'Pincode', TextInputType.number),
            buildTextField(areaController, 'Area',
                TextInputType.numberWithOptions(decimal: true)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveAddressDetails,
              child: Text('Save Address'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: getRecommendation,
              child: isLoading
                  ? CircularProgressIndicator()
                  : Text('Get Crop Recommendation'),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedCrop.isEmpty ? null : selectedCrop,
              hint: Text('Select Crop'),
              items: crops.map((String crop) {
                return DropdownMenuItem<String>(
                  value: crop,
                  child: Text(crop),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCrop = newValue!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText,
      TextInputType keyboardType) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
