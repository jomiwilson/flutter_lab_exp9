# Experiment 9 – Accessing APIs through HTTP

**Course:** 24CS2016 – Building Applications using Flutter  
**Name:** Jomi W  
**Register No.:** URK23CS1299

## Aim

To access a REST API using HTTP and display JSON data in Flutter.

## Description

This experiment introduces accessing a REST API in Flutter using the http package. An HTTP GET request is sent to the API and the JSON response is decoded using jsonDecode. The data is displayed using ListView.builder, with loading and error messages handled in the UI.

## Source files

- `pubspec.yaml`
- `lib/main.dart`

## How to run

The repository contains the Dart source and `pubspec.yaml`. Generate the platform folders once, then run:

```bash
flutter create .
flutter pub get
flutter run
```

## Result

A Flutter application for accessing a REST API using HTTP was developed successfully. The application sent an HTTP GET request and decoded the JSON response using jsonDecode. The retrieved post titles were displayed in the UI using ListView.builder. A loading message was shown during the request and an error message was shown on failure.
