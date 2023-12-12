import 'package:bank_auction_hub/Custom%20Widgets/input_fields_widget.dart';
import 'package:bank_auction_hub/Settings/constants.dart';
import 'package:bank_auction_hub/Settings/responsive.dart';
import 'package:bank_auction_hub/bloc/add_property_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class AddPropertyWidget extends StatelessWidget {
  //key
  final GlobalKey<FormState> addPropertyFormKey = GlobalKey<FormState>();
  //controllers
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _cityController = TextEditingController();
  final _borrowerController = TextEditingController();
  final _areaController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _basePriceController = TextEditingController();
  final _bidIncrementController = TextEditingController();
  final _incrementTimeController = TextEditingController();
  final _bidExtensionController = TextEditingController();
  final _emdAmountController = TextEditingController();
  final _emdBankNoController = TextEditingController();

  AddPropertyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String dropDownType = "Residental";

    final addPropertyCubit = BlocProvider.of<AddPropertyCubit>(context);
    return SingleChildScrollView(
      child: Form(
        key: addPropertyFormKey,
        child: Column(
          children: [
            const Text(
              "Add Property",
              style: TextStyle(fontSize: 32),
            ),
            const Text(
              "Fill the form carefully to add new property for auction",
              style: TextStyle(
                fontSize: 20,
              ),
              softWrap: true,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Property Details",
                  style: TextStyle(fontSize: 20),
                ),
                Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    runSpacing: contentPadding,
                    direction: Axis.horizontal,
                    children: [
                      InputFieldWidget(
                        label: "Type",
                        child: DropdownButtonFormField(
                          value: dropDownType,
                          onSaved: (newValue) {
                            dropDownType = newValue!;
                          },
                          decoration: InputDecoration(border: myInputBorder),
                          hint: const Text("Select type"),
                          items: const [
                            DropdownMenuItem(
                              value: "Residental",
                              child: Text("Residental"),
                            ),
                            DropdownMenuItem(
                              value: "Agricultural",
                              child: Text("Agricultural"),
                            ),
                            DropdownMenuItem(
                              value: "Non-Agricultural",
                              child: Text("Non-Agricultural"),
                            ),
                            DropdownMenuItem(
                              value: "Land And Building",
                              child: Text("Land And Building"),
                            ),
                            DropdownMenuItem(
                              value: "Building",
                              child: Text("Building"),
                            ),
                            DropdownMenuItem(
                              value: "Land",
                              child: Text("Land"),
                            ),
                            DropdownMenuItem(
                              value: "Other",
                              child: Text("Other"),
                            ),
                          ],
                          onChanged: (Object? value) {},
                        ),
                        // child: TextFormField(
                        //     decoration: InputDecoration(
                        //         hintText: "Residential", border: myInputBorder)),
                      ),

                      //title
                      InputFieldWidget(
                        label: "Title",
                        child: TextFormField(
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter Title";
                              }
                              return null;
                            },
                            controller: _titleController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "XYZ Hotel", border: myInputBorder)),
                      ),

                      //Location
                      InputFieldWidget(
                        label: "Location",
                        child: TextFormField(
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter Location";
                              }
                              return null;
                            },
                            controller: _locationController,
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                                hintText: "xyz Street", border: myInputBorder)),
                      ),

                      //city
                      InputFieldWidget(
                        label: "City",
                        child: TextFormField(
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter City";
                              }
                              return null;
                            },
                            controller: _cityController,
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                                hintText: "Jaipur", border: myInputBorder)),
                      ),

                      //Borrower Name
                      InputFieldWidget(
                        label: "Borrower Name",
                        child: TextFormField(
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter Borrower Name";
                              }
                              return null;
                            },
                            controller: _borrowerController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                hintText: "abc Company",
                                border: myInputBorder)),
                      ),

                      //Area
                      InputFieldWidget(
                        label: "Area",
                        child: TextFormField(
                            controller: _areaController,
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter Title";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "400 Sq. Ft.",
                                border: myInputBorder)),
                      ),

                      //Description
                      InputFieldWidget(
                        isExpanded: true,
                        label: "Description",
                        child: TextFormField(
                            controller: _descriptionController,
                            minLines: 3,
                            maxLines: 10,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Description",
                                border: myInputBorder)),
                      ),
                    ]),
              ],
            ),
            const SizedBox(
              height: screenPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Auction Details",
                  style: TextStyle(fontSize: 20),
                ),
                Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    runSpacing: contentPadding,
                    direction: Axis.horizontal,
                    children: [
                      InputFieldWidget(
                        label: "Base Price",
                        child: TextFormField(
                            controller: _basePriceController,
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter Base Price";
                              } else if (int.tryParse(value) == null ||
                                  double.tryParse(value) == null) {
                                return "Enter Valid Price";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "xxxxxxxxxxx",
                                border: myInputBorder)),
                      ),

                      //Start Date
                      InputFieldWidget(
                        label: "Start Date",
                        child: TextFormField(
                            controller: _startDateController,
                            keyboardType: TextInputType.none,
                            readOnly: true,
                            onTap: () async {
                              DateTime? dateTime = await showOmniDateTimePicker(
                                  context: context,
                                  title: const Text("Pick date and Time"),
                                  borderRadius: BorderRadius.circular(6));
                              String timeDate = "";
                              if (dateTime == null) {
                                timeDate = DateFormat('dd MMM yyyy HH:mm')
                                    .format(DateTime.now());
                              } else {
                                timeDate = DateFormat('dd MMM yyyy HH:mm')
                                    .format(dateTime);
                              }
                              _startDateController.text = timeDate;
                            },
                            decoration: InputDecoration(border: myInputBorder)),
                      ),

                      //End Date
                      InputFieldWidget(
                        label: "End Date",
                        child: TextFormField(
                            keyboardType: TextInputType.none,
                            controller: _endDateController,
                            readOnly: true,
                            onTap: () async {
                              DateTime? dateTime = await showOmniDateTimePicker(
                                  context: context,
                                  title: const Text("Pick date and Time"),
                                  borderRadius: BorderRadius.circular(6));
                              String timeDate = "";
                              if (dateTime == null) {
                                timeDate = DateFormat('dd MMM yyyy HH:mm')
                                    .format(DateTime.now());
                              } else {
                                timeDate = DateFormat('dd MMM yyyy HH:mm')
                                    .format(dateTime);
                              }
                              _endDateController.text = timeDate;
                            },
                            decoration: InputDecoration(border: myInputBorder)),
                      ),

                      //Bid Increment
                      InputFieldWidget(
                        label: "Bid Increment",
                        child: TextFormField(
                            controller: _bidIncrementController,
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter  Bid Increment";
                              } else if (int.tryParse(value) == null ||
                                  double.tryParse(value) == null) {
                                return "Enter Valid Bid Increment";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "xxxxxxxx", border: myInputBorder)),
                      ),

                      //Increment Time
                      InputFieldWidget(
                        label: "Increment Time (in Minutes)",
                        child: TextFormField(
                            controller: _incrementTimeController,
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter Increment Time";
                              } else if (int.tryParse(value) == null ||
                                  double.tryParse(value) == null) {
                                return "Enter Valid Increment Time";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "xxxxxxxxx", border: myInputBorder)),
                      ),

                      //Bid Extension
                      InputFieldWidget(
                        label: "Bid Extension (in Number)",
                        child: TextFormField(
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter Bid Extension";
                              } else if (int.tryParse(value) == null ||
                                  double.tryParse(value) == null) {
                                return "Enter Valid Bid Extension";
                              }
                              return null;
                            },
                            controller: _bidExtensionController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "xxxxxx", border: myInputBorder)),
                      ),

                      //EMD Amount
                      InputFieldWidget(
                        label: "EMD Amount",
                        child: TextFormField(
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter EMD Amount";
                              } else if (int.tryParse(value) == null ||
                                  double.tryParse(value) == null) {
                                return "Enter Valid EMD Amount";
                              }
                              return null;
                            },
                            controller: _emdAmountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "xxxxxxx", border: myInputBorder)),
                      ),

                      //EMD Bank Account No.
                      InputFieldWidget(
                        label: "EMD Bank Account No.",
                        child: TextFormField(
                            validator: (value) {
                              value = value?.trim();
                              if (value == null || value.isEmpty) {
                                return "Enter Bank Account No.";
                              } else if (int.tryParse(value) == null ||
                                  double.tryParse(value) == null) {
                                return "Enter Bank Account No.";
                              }
                              return null;
                            },
                            controller: _emdBankNoController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "XXXXXXXXXXXXXXXXXXXX",
                                border: myInputBorder)),
                      ),

                      const SizedBox(
                        width: double.infinity,
                      )
                    ]),
              ],
            ),
            const SizedBox(
              height: contentPadding,
            ),

            //add button
            BlocConsumer<AddPropertyCubit, AddPropertyFormState>(
              listener: (context, state) {
                
                if (state is AddPropertyFormSuccessState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("Added")));
                  Navigator.pushReplacementNamed(context, homeScreenRoute);
                } else if (state is PropertyErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Something went wrong")));
                }
              },
              builder: (context, state) {
                if (state is PropertyLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  height: 54,
                  width: Responsive.isMobile(context) ? double.infinity : 500,
                  child: ElevatedButton(
                    onPressed: () {
                      if (addPropertyFormKey.currentState!.validate()) {
                        addPropertyFormKey.currentState?.save();
                        String title = _titleController.text.toString().trim();
                        String location =
                            _locationController.text.toString().trim();
                        String city = _cityController.text.toString().trim();
                        String area = _areaController.text.toString().trim();
                        String borrower =
                            _borrowerController.text.toString().trim();
                        String description =
                            _descriptionController.text.toString().trim();

                        String basePrice = _basePriceController.text.toString();
                        String startTime = _startDateController.text.toString();
                        String endTime = _endDateController.text.toString();
                        String bidIncrement =
                            _bidIncrementController.text.toString();
                        String incrementTime =
                            _incrementTimeController.text.toString();
                        String bidExtension =
                            _bidExtensionController.text.toString();
                        String emdAmount = _emdAmountController.text.toString();
                        String emdBankNo = _emdBankNoController.text.toString();

                        addPropertyCubit.submitPropertyForm(
                            dropDownType,
                            title,
                            location,
                            city,
                            area,
                            borrower,
                            description,
                            "INR $basePrice",
                            startTime,
                            endTime,
                            bidIncrement,
                            incrementTime,
                            bidExtension,
                            emdAmount,
                            emdBankNo);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shadowColor: null,
                        surfaceTintColor: primaryColor,
                        enableFeedback: false,
                        padding: const EdgeInsets.all(25),
                        backgroundColor: primaryColor,
                        foregroundColor: whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    child: const Text("Add Property"),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
