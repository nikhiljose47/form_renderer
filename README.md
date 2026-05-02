# form_renderer

A Flutter project for displaying forms, templates, etc. dynamically as widgets from data.

## Getting Started

Setup and run:

flutter pub get  
flutter run  

---

## Architecture

This app is built using a simple clean architecture and follows a clear separation of responsibilities, making it modular and easy to understand.

### Components

1. **FlowManager**  
   - Manages the overall flow of the app  
   - Decides which screen to show (Form / Template)

2. **FormScreen**  
   - Displays one form page in the UI  
   - Handles user interaction (Next / Back buttons)

3. **TemplateScreen**  
   - Displays template or success screen  
   - Shows submitted data

4. **FormEngine**  
   - Controls form flow logic  
   - Handles:
     - Page navigation (Next / Back)  
     - Submit actions  
     - Basic validation  

5. **FormStateStore**  
   - Stores user input data across pages  
   - Maintains state while navigating

