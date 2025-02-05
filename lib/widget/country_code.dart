import 'package:country_codes/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryCodePicker extends StatefulWidget {
  final Function(String) onChanged;
  final String initialCode;
  final TextEditingController controller;

  const CountryCodePicker({
    Key? key,
    required this.onChanged,
    required this.initialCode,
    required this.controller,
  }) : super(key: key);

  @override
  _CountryCodePickerState createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  String? selectedCountryCode;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeCountryCodes();
  }

  Future<void> _initializeCountryCodes() async {
    await CountryCodes.init();
    setState(() {
      selectedCountryCode = widget.initialCode;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: DropdownButton<String>(
            value: selectedCountryCode,
            onChanged: (newValue) {
              setState(() {
                selectedCountryCode = newValue;
              });
              widget.onChanged(newValue!);
            },
            items: CountryCodes.countryCodes().map((code) {
              return DropdownMenuItem<String>(
                value: code.dialCode,
                child: Row(
                  children: [
                    Text('${code.name} ${code.dialCode}'),
                  ],
                ),
              );
            }).toList(),
            isExpanded: false,
            underline: Container(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: "Enter phone number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.white, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
