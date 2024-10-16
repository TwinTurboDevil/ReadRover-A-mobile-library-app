import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // TextEditing Controllers for Form Fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _upozillaController = TextEditingController();
  final TextEditingController _thanaController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _wardNoController = TextEditingController();
  final TextEditingController _houseNoController = TextEditingController();

  // Division and District Data
  String? _selectedDivision;
  String? _selectedDistrict;
  final Map<String, List<String>> _divisionDistricts = {
    'Barishal': [
      'Barishal',
      'Barguna',
      'Bhola',
      'Jhalokathi',
      'Patuakhali',
      'Pirojpur'
    ],
    'Chattogram': [
      'Chattogram',
      'Cox\'s Bazar',
      'Feni',
      'Khagrachari',
      'Lakshmipur',
      'Noakhali',
      'Brahmanbaria',
      'Comilla',
      'Chandpur',
      'Bandarban',
      'Rangamati'
    ],
    'Dhaka': [
      'Dhaka',
      'Faridpur',
      'Gazipur',
      'Gopalganj',
      'Kishoreganj',
      'Manikganj',
      'Munshiganj',
      'Madaripur',
      'Rajbari',
      'Shariatpur',
      'Tangail',
      'Narail',
      'Narayanganj'
    ],
    'Khulna': [
      'Khulna',
      'Bagerhat',
      'Jessore',
      'Satkhira',
      'Chuadanga',
      'Kushtia',
      'Meherpur',
      'Narail',
      'Magura',
      'Jhenaidah'
    ],
    'Rajshahi': [
      'Bogura',
      'Chapainawabganj',
      'Joypurhat',
      'Naogaon',
      'Natore',
      'Pabna',
      'Rajshahi',
      'Sirajganj'
    ],
    'Rangpur': [
      'Rangpur',
      'Kurigram',
      'Nilphamari',
      'Lalmonirhat',
      'Gaibandha',
      'Dinajpur',
      'Thakurgaon',
      'Panchagarh'
    ],
    'Mymensingh': ['Mymensingh', 'Jamalpur', 'Netrokona', 'Sherpur'],
    'Sylhet': ['Sylhet', 'Moulvibazar', 'Habiganj', 'Sunamganj'],
  };

  // Image Picker Variables
  XFile? _profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const SizedBox(height: 20),
              const Text(
                'Registration Form',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Profile Photo
              GestureDetector(
                onTap: () async {
                  final ImagePicker _picker = ImagePicker();
                  XFile? pickedImage = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedImage != null) {
                    setState(() {
                      _profileImage = pickedImage;
                    });
                  }
                },
                child: _profileImage == null
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt, size: 40),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(
                          File(_profileImage!.path),
                        ),
                      ),
              ),
              const SizedBox(height: 16),

              // First Name
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Last Name
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Date of Birth
              TextFormField(
                controller: _dobController,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dobController.text = pickedDate.toString().split(' ')[0];
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your date of birth';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // National ID No.
              TextFormField(
                controller: _nationalIdController,
                decoration: const InputDecoration(
                  labelText: 'National ID No.',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your National ID No.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Mobile No. (String)
              TextFormField(
                controller: _mobileController,
                decoration: const InputDecoration(
                  labelText: 'Mobile No.',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Division (Dropdown)
              DropdownButtonFormField<String>(
                value: _selectedDivision,
                decoration: const InputDecoration(
                  labelText: 'Region (Division)',
                  border: OutlineInputBorder(),
                ),
                items: _divisionDistricts.keys.map((String division) {
                  return DropdownMenuItem<String>(
                    value: division,
                    child: Text(division),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDivision = newValue;
                    _selectedDistrict = null;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a division';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // District (Dropdown)
              DropdownButtonFormField<String>(
                value: _selectedDistrict,
                decoration: const InputDecoration(
                  labelText: 'District',
                  border: OutlineInputBorder(),
                ),
                items: _selectedDivision != null
                    ? _divisionDistricts[_selectedDivision]!
                        .map((String district) {
                        return DropdownMenuItem<String>(
                          value: district,
                          child: Text(district),
                        );
                      }).toList()
                    : [],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDistrict = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a district';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Upojilla
              TextFormField(
                controller: _upozillaController,
                decoration: const InputDecoration(
                  labelText: 'Upojilla',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your upozilla';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Thana
              TextFormField(
                controller: _thanaController,
                decoration: const InputDecoration(
                  labelText: 'Thana',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your thana';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Ward No.
              TextFormField(
                controller: _wardNoController,
                decoration: const InputDecoration(
                  labelText: 'Ward No.',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your ward number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // House No.
              TextFormField(
                controller: _houseNoController,
                decoration: const InputDecoration(
                  labelText: 'House No.',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your house number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Postal Code
              TextFormField(
                controller: _postalCodeController,
                decoration: const InputDecoration(
                  labelText: 'Postal Code',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your postal code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email Address
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  // Use the same regex as in login_page.dart
                  final RegExp _emailRegex = RegExp(
                      r'^[a-zA-Z]+\.stu20\d{0,3}@juniv\.edu$|^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
                  if (!_emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Confirm Password
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Register Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Check if Profile Image is selected
                    if (_profileImage == null) {
                      _showMessage(
                          "Unsuccessful Registration !! Complete the Registration Form");
                      return;
                    }

                    // Show Success Message
                    _showMessage("Registration is Successful !!");

                    // Navigate to the login page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  } else {
                    _showMessage(
                        "Unsuccessful Registration !! Complete the Registration Form");
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to show popup message
  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registration Status'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
