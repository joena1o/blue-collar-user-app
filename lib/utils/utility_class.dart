import 'package:flutter/material.dart';
import 'package:blue_collar_app/core/app_colors.dart';

class UtilityClass {
  static EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 20);

  static EdgeInsets horizontalAndVerticalPadding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 20);

  static List<String> artisanCategories = [
    "Home Repairs", // Plumbing, electrical, carpentry, handyman
    "Cleaning", // House cleaning, window cleaning, carpet cleaning
    "Auto Services", // Mechanics, car washing, car detailing
    "Beauty & Grooming", // Hairdressing, barber services, makeup artists
    "Tailoring", // Tailors, seamstresses, clothing alterations
    "Health & Wellness", // Personal trainers, massage therapists, yoga instructors
    "Tech Repair", // Phone, computer, gadget repairs
    "Event Planning", // Event planning, photography, videography
    "Catering", // Caterers, private chefs, food delivery
    "Crafts", // Furniture makers, custom woodwork
    "Interior Design", // Decorators, painters, home improvement
    "Landscaping", // Gardeners, landscapers, pest control
    "Tutoring", // Academic, music, and language tutors
    "Art & Design", // Graphic designers, illustrators, photographers
    "Pet Care" // Grooming, pet sitting, vet assistance
  ];

  static List<String> daysOfTheWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  static String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  static List<String> workingModel = ["All", "Remote", "On-site"];

  static final tabHeader = ["Discover", "Search", "Favorites", "Profile"];

  static String? passwordValidator(String? value) {
    // Check if the password is empty
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    // Check password length
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for uppercase letters
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for lowercase letters
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for digits
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }

    // Check for special characters
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null; // Password is valid
  }

  static String? firstNameValidator(String? value) {
    // Check if the first name is empty
    if (value == null || value.isEmpty) {
      return 'First name cannot be empty';
    }

    // Check for valid length
    if (value.length < 2) {
      return 'First name must be at least 2 characters long';
    }

    // Check for invalid characters (optional)
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'First name can only contain letters';
    }

    return null; // First name is valid
  }

  static String? lastNameValidator(String? value) {
    // Check if the last name is empty
    if (value == null || value.isEmpty) {
      return 'Last name cannot be empty';
    }

    // Check for valid length
    if (value.length < 2) {
      return 'Last name must be at least 2 characters long';
    }

    // Check for invalid characters (optional)
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Last name can only contain letters';
    }

    return null; // Last name is valid
  }

//Button Container Styles
  static final buttonDecorationFill = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.primaryColor,
        AppColors.primaryColor,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(25),
  );

  static final buttonDecorationOnlyOutline = BoxDecoration(
    border: Border.all(color: AppColors.secondaryColor, width: 2),
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
  );
//Button Container Styles

//Font TextStyle
  static TextStyle blackRegular = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle blackSmaller = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle blackSmall = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackSemiLargeHeader = const TextStyle(
    fontSize: 28,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackMediumHeader = const TextStyle(
    fontSize: 20,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w700,
  );

  static TextStyle blackLargeHeader = const TextStyle(
    fontSize: 30,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
  );

  static TextStyle whiteLargeHeader = TextStyle(
    fontSize: 24,
    color: AppColors.lightColor,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
  );

  static TextStyle tertiarySmall = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.tertiaryColor);

  static TextStyle tertiaryRegular = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.tertiaryColor);

  static TextStyle tertiaryRegularBold = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.tertiaryColor);
//Font TextStyle
}
