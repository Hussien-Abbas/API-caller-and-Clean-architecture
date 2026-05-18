# 🎬 TV Show Characters App

A Flutter application showcasing popular TV show characters, built with **Clean Architecture** and robust state management. The app fetches live data from a REST API, supports advanced filtering, and features a smooth, animated user experience.

---

## 🚀 Key Features

* **Dynamic API Integration**: Fetches and displays a comprehensive list of characters on the home screen.
* **Detailed Character Profiles**: Seamlessly passes data between screens to show in-depth information for each character.
* **Instant Search & Filter**: Real-time search functionality to find characters instantly.
* **Polished UI/UX**: Implements smooth text animations and clean transitions for an enhanced user experience.

---

## 🛠️ Tech Stack & Architecture

* **Framework**: Flutter & Dart
* **Architecture**: Clean Architecture (Separation of concerns into Data, Domain, and Presentation layers)
* **State Management**: BLoC / Cubit for predictable and scalable state tracking
* **Networking**: HTTP / Dio for seamless REST API communication

---

## 📁 Project Structure & Layers

The project strictly follows Clean Architecture principles:

* 📦 **Data Layer**: Handles API calls, data sources, models, and repository implementations.
* 📦 **Domain Layer**: Contains business logic, use cases, and repository interfaces (independent of any external framework).
* 📦 **Presentation Layer**: UI screens, widgets, and BLoC state management components.

---

## ⚙️ Getting Started

### Prerequisites
* Flutter SDK installed
* Dart SDK installed

### Installation
1. Clone the repository:
   ```bash
   git clone [https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY_NAME.git)
