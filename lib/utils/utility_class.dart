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

  static List<String> workingModel = ["All", "Remote", "On-site"];

  static final tabHeader = ["Discover", "Search", "Favorites", "Profile"];

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
    fontWeight: FontWeight.w500,
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
