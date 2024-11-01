import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

class ExceptionHandler {
  // A method to handle the exceptions and return user-friendly messages.
  static String handle(Exception exception) {
    if (exception is SocketException) {
      return "No Internet connection. Please check your connection.";
    } else if (exception is HttpException) {
      return "Could not find the data you're looking for.";
    } else if (exception is FormatException) {
      return "Invalid format. Please try again.";
    } else if (exception is TimeoutException) {
      return "Request timed out. Please try again later.";
    } else if (exception is RangeError) {
      return "Something went wrong. Please try again.";
    } else if (exception is StateError) {
      return "Unexpected error. Please restart the app.";
    } else {
      return "An unexpected error occurred. Please try again.";
    }
  }

  // A method to show a snackbar with the error message in the UI
  static void showError(BuildContext context, Exception exception) {
    final message = handle(exception);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // A method to log the exception (e.g., to an error logging service)
  static void log(Exception exception) {
    // Implement your error logging here, e.g., Firebase Crashlytics or Sentry
    print("Logged exception: $exception");
  }

  // A method to handle and show error
  static void handleErrorAndShow(BuildContext context, Exception exception) {
    log(exception); // Log the exception
    showError(context, exception); // Show the error message to the user
  }
}

