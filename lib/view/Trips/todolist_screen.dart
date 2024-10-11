import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_colors.dart';

class TodolistScreen extends StatefulWidget {
  @override
  _TodolistScreenState createState() => _TodolistScreenState();
}

class _TodolistScreenState extends State<TodolistScreen> {
  String selectedItem = 'Book';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Container(
        color: AppColors.whiteColor,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRadioItem('Passport'),
              Divider(height: 1, color: Colors.grey.shade300),
              _buildRadioItem('Book'),
              Divider(height: 1, color: Colors.grey.shade300),
              _buildRadioItem('Sunscreen'),
              SizedBox(height: 32),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: AppColors.darkredcolor,
                    radius: 25.r,
                    child: Icon(Icons.add, color: Colors.white, size: 30.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioItem(String value) {
    return RadioListTile<String>(
   
        value: value,
        groupValue: selectedItem,
        onChanged: (String? newValue) {
          setState(() {
            selectedItem = newValue!;
          });
        },
        title: Text(value),
        activeColor: AppColors.darkredcolor);
  }
}
