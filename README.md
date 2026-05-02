# form_renderer

A Flutter project for displaying forms, templates etc as widgets dynamically from the data.

## Getting Started

Setup and run: 
flutter pub get
flutter run


## Architecture

This app is buuilt using Flutter Clean Architecture and follows a good speration of responsibilities making it modular and scalable.

1.FlowManager - Manages the flow for the forms 
2.FormScreen - Display one form screen in the UI
3.TemplateScreen - Display one template in the UI
4.FormEngine - A form flow controller which manages the form page with navigation
