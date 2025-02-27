// ignore_for_file: deprecated_member_use, depend_on_referenced_packages, non_constant_identifier_names, unused_field
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../bloc/request_form/request_form_bloc.dart';

final List<String> bloodGroup = <String>[
  'A(+)',
  'A(-)',
  'B(+)',
  'B(-)',
  'AB(+)',
  'AB(-)',
  'O(+)',
  'O(-)'
];
final List<String> Quantity = <String>[
  '1',
  '2',
];
final List<String> Gender = <String>[
  'Male',
  'Female',
  'Other',
];
final List<String> hospitalName = <String>[
  'Select Location',
  'Jamalpur 250 Beded General Hospital',
  'Jamalpur Central Hospital Ltd.',
  'M A Rashid Hospital',
  'Hazrat Shah Jamal (R)General Hospital',
  'Jamalpur Diabetic Hospital',
  'Other'
];

class VerifiedDialog extends StatefulWidget {
  const VerifiedDialog({super.key});

  @override
  State<VerifiedDialog> createState() => _VerifiedDialogState();
}

class _VerifiedDialogState extends State<VerifiedDialog> {
  File? _image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No Image Picked');
      }
    });
  }

  TextEditingController timePicker = TextEditingController();
  TextEditingController datePicker = TextEditingController();

  final _pageController = PageController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RequestFormBloc(),
      child: BlocBuilder<RequestFormBloc, RequestFormState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Onboarding Step ${state.step + 1}'),
            ),
            body: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                BlocProvider.of<RequestFormBloc>(context)
                    .add(UpdateStep(index));
              },
              children: [
                _buildStep1(context),
                _buildStep2(context),
                _buildStep3(context),
                _buildSummary(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStep1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Step 1: Enter your name'),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }

  Widget _buildStep2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Step 2: Enter your email'),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }

  Widget _buildStep3(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Step 3: Enter your phone number'),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
          ElevatedButton(
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text('Finish'),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Summary'),
          Text('Name: ${_nameController.text}'),
          Text('Email: ${_emailController.text}'),
          Text('Phone: ${_phoneController.text}'),
          ElevatedButton(
            onPressed: () {
              // Handle submit or finish action
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class DropdownMenuExample2 extends StatelessWidget {
  DropdownMenuExample2({super.key});

  final String dropdownValue = hospitalName.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: dropdownValue,
      onSelected: (String? value) {
        // This is called when the user selects an item.
      },
      dropdownMenuEntries:
          hospitalName.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

class DropdownMenuExample extends StatelessWidget {
  DropdownMenuExample({super.key});

  final String dropdownValue = bloodGroup.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: dropdownValue,
      onSelected: (String? value) {
        // This is called when the user selects an item.
      },
      dropdownMenuEntries:
          bloodGroup.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

class CustomQuantitys extends StatelessWidget {
  CustomQuantitys({super.key});

  final String dropdownValue = Quantity.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: Quantity.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
      },
      dropdownMenuEntries:
          Quantity.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

class CustomGenderMenu extends StatelessWidget {
  CustomGenderMenu({super.key});

  final String dropdownValue = Gender.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: Gender.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
      },
      dropdownMenuEntries:
          Gender.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}































// WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12.r),
//                     color: Colors.grey.shade100),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: AppDefaults.padding * 2,
//                     horizontal: AppDefaults.padding,
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(right: 8.0.w),
//                             child: IconButton.filled(
//                               onPressed: () {
//                                 context.pop();
//                               },
//                               icon: const Icon(Icons.close),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Text(
//                           "Blood Request",
//                           style:
//                               Theme.of(context).textTheme.titleLarge?.copyWith(
//                                     fontFamily: "Poppins",
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                         ),
//                       ),
//                       const Gap(10),
//                       InkWell(
//                         onTap: () {
//                           getImageGallery();
//                         },
//                         child: Container(
//                           width: 200,
//                           height: 200,
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade100,
//                             borderRadius: BorderRadius.circular(12.r),
//                             border: Border.all(width: 2.h,color: Colors.red)
//                           ),
//                           child: _image != null
//                               ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(12.r),
//                                 child: Image.file(
//                                     _image!.absolute,
//                                     fit: BoxFit.cover,
//                                   ),
//                               )
//                               : SizedBox(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.35,
//                                   child: const AspectRatio(
//                                     aspectRatio: 1 / 1,
//                                     child: NetworkImageWithLoader(
//                                       'https://images.pexels.com/photos/28517478/pexels-photo-28517478/free-photo-of-red-toned-close-up-portrait-of-a-woman.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                         ),
//                       ),
//                       const SizedBox(height: AppDefaults.padding),

//                       TextFormField(
//                         decoration: const InputDecoration(hintText: "Paitent Name"),
//                       ),
//                       const Gap(10),
//                       TextFormField(
//                         decoration:
//                             const InputDecoration(hintText: "Paitent Conditions"),
//                       ),
//                       const Gap(10),

//                       SizedBox(
//                         width: MediaQuery.of(context).size.width,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(
//                                       "Gender",
//                                       textAlign: TextAlign.start,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleMedium
//                                           ?.copyWith(
//                                             fontFamily: "Poppins",
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                     ),
//                                   ),
//                                   CustomGenderMenu(),
//                                 ],
//                               ),
//                             ),
//                              Gap(5.w),
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(
//                                       "Blood Group",
//                                       textAlign: TextAlign.start,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleMedium
//                                           ?.copyWith(
//                                             fontFamily: "Poppins",
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                     ),
//                                   ),
//                                   DropdownMenuExample(),
//                                 ],
//                               ),
//                             ),
//                             Gap(5.w),
//                             Expanded(
//                               child: Column(
//                                 children: [
//                                   Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(
//                                       "Unit",
//                                       textAlign: TextAlign.start,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleMedium
//                                           ?.copyWith(
//                                             fontFamily: "Poppins",
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                     ),
//                                   ),
//                                   CustomQuantitys(),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       //  Row(
//                       //    children: [
//                       //      ListTile(
//                       //                    title: const Text('Male'),
//                       //                    leading: Radio<String>(
//                       //                      value: 'Male',
//                       //                      groupValue: '1',
//                       //                      onChanged: (String? value) {
//                       //                        // setState(() {
//                       //                        //   _selectedGender = value!;
//                       //                        // });
//                       //                      },
//                       //                    ),
//                       //                  ),
//                       //    ],
//                       //  ),
//                       const Gap(10),
//                       Row(
//                         children: [
                         
//                           Expanded(
//                             child: TextFormField(
//                               readOnly: true,
//                               showCursor: false,
//                               controller: datePicker,
//                               decoration: const InputDecoration(
//                                 labelText: 'Date',
//                                 border: OutlineInputBorder(),
//                               ),
//                               onTap: () async {
//                                 DateTime? dateTime = await showDatePicker(
//                                   context: context,
//                                   initialDate: DateTime.now(),
//                                   firstDate: DateTime(1950),
//                                   lastDate: DateTime(2100),
//                                 );
//                                 if (dateTime != null) {
//                                   String formattedDate =
//                                       DateFormat('yyyy-MM-dd').format(dateTime);
//                                   setState(() {
//                                     datePicker.text = formattedDate;
//                                   });
//                                 }
//                               },
//                             ),
//                           ),
//                            Gap(10.w),
//                           Expanded(
//                             child: TextFormField(
//                               readOnly: true,
//                               showCursor: false,
//                               controller: timePicker,
//                               decoration: const InputDecoration(
//                                 labelText: 'Time',
//                                 border: OutlineInputBorder(),
//                               ),
//                               onTap: () async {
//                                 var time = await showTimePicker(
//                                     context: context,
//                                     initialTime: TimeOfDay.now());
//                                 if (time != null) {
//                                   setState(() {
//                                     timePicker.text = time.format(context);
//                                   });
//                                 }
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Gap(10),

//                       const Gap(10),
//                       DropdownMenuExample2(),

//                       const SizedBox(height: AppDefaults.padding),
//                       const Text(
//                         'Hurrah!!  You have successfully\nverified the account.',
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: AppDefaults.padding),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             context.pop();
//                           },
//                           child: const Text('Submit'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );