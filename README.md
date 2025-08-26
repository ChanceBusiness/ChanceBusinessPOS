# Chance Business POS App

A modern **Chance Business Point of Sale (POS) application** with support for **light/dark themes**, **right-side drawer menu**, and a **bottom navigation bar**. This project demonstrates a scalable POS app structure with user-friendly UI.

---

## Features

- **Login Page**

  - Username & password authentication
  - Logo support on login page

- **Main Page**

  - **Top AppBar**
    - Logo on the left
    - Page title dynamically changes
    - Right-side drawer menu
  - **Right-side Drawer**
    - Switch between Light / Dark theme
    - Logout button
  - **Bottom Navigation Bar**
    - Modern design
    - Pages:
      - Dashboard
      - Products
      - Orders
      - Settings
  - Animated page transitions

- **Theme Support**

  - Light & Dark modes
  - Global theme switch updates both login and main pages

- **Logout**
  - Clears navigation stack and returns to login page

---

## Project Structure

lib/
├── main.dart # App entry point with theme management
├── login.dart # Login page with theme toggle and logo
├── main_page.dart # Main page with AppBar, bottom navigation, endDrawer
├── assets/
│ ├── logo.png # Logo for AppBar & Login page
│ └── (optional assets)

## Getting Started

### Prerequisites

- Flutter SDK >= 3.0
- Dart >= 2.17
- IDE: VSCode / Android Studio / IntelliJ

### Installation

1. Clone the repository:

```bash
git clone https://github.com/ChanceBusiness/ChanceBusinessPOS.git
cd flutter_pos_app
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```
