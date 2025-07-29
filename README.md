
---

# Student Smart Expense Tracker App

A sleek and user-friendly Flutter application designed to help students efficiently track and manage their daily expenses. The app offers categorized expense tracking, detailed reports, and an intuitive interface with a calming yellow-themed design for a relaxing user experience.

---

## Table of Contents

* [About](#about)
* [Features](#features)
* [Screenshots](#screenshots)
* [Technology Stack](#technology-stack)
* [Getting Started](#getting-started)
* [Usage](#usage)
* [Project Structure](#project-structure)
* [Contributing](#contributing)
* [Contact](#contact)
* [License](#license)

---

## About

Managing finances as a student can be challenging without the right tools. This app simplifies expense tracking by allowing users to add, categorize, and review their expenses, while visualizing spending habits with interactive charts. The app uses a soothing yellow-themed UI to enhance user comfort and focus.

---

## Features

* Add, edit, and delete expenses effortlessly.
* Organize expenses by categories with intuitive icons.
* Interactive pie charts to visualize spending breakdown.
* Search feature to quickly find expenses.
* Toggle between light and dark themes with a warm yellow accent.
* Local persistent storage using SQLite with desktop support (`sqflite_ffi`).
* Responsive design supporting Android, iOS, macOS, Windows, Linux, and Web.

---

## Screenshots

| Home Screen                   | Expense Detail                    | Add/Edit Expense                           |
| ----------------------------- | --------------------------------- | ------------------------------------------ |
| ![Home](screenshots/home.png) | ![Detail](screenshots/detail.png) | ![AddExpense](screenshots/add_expense.png) |


---

## Technology Stack

* **Flutter** — Cross-platform UI toolkit.
* **Provider** — State management solution.
* **SQLite** via **sqflite\_ffi** — Local database for persistent storage.
* **Intl** — Date and currency formatting.
* **fl\_chart** — Beautiful and interactive charting library.
* **Dart** — Programming language powering the app.

---

## Getting Started

### Prerequisites

* Flutter SDK (version 3.x or above recommended)
* Dart SDK (bundled with Flutter)
* An IDE such as VS Code or Android Studio
* For desktop platforms: Windows, macOS, or Linux with support for `sqflite_ffi`

### Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/Gatera-Me/Student-Smart-Expense-Tracker-App.git
   cd Student-Smart-Expense-Tracker-App
   ```

2. Fetch dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app on your preferred device or emulator:

   ```bash
   flutter run
   ```

---

## Usage

* Tap the **+** button to add a new expense with details like title, amount, date, and category.
* Tap any category card to view expenses filtered by that category.
* Use the search bar on the “All Expenses” screen to locate specific entries quickly.
* Switch themes between light and dark modes using the toggle icon in the app bar.
* Review your spending with the interactive pie chart on the categories screen.

---

## Project Structure

```
lib/
├── constants/          # App-wide constants like icons and colors
├── models/             # Data models and providers (ThemeProvider, DatabaseProvider)
├── screens/            # UI screens (CategoryScreen, ExpenseScreen, AllExpenses)
├── widgets/            # Reusable widgets & components (ExpenseEntryForm, CategoryCard, PieChart)
├── main.dart           # App entry point
```

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add YourFeature'`).
4. Push to your branch (`git push origin feature/YourFeature`).
5. Open a Pull Request for review.

Please follow best practices, write clear commit messages, and update documentation as necessary.

---

## Contact

**Merveille Gatera Iriza **
Email: [gatemerveille@gmail.com](mailto:gatemerveille@gmail.com)
GitHub: [https://github.com/Gatera-Me](https://github.com/Gatera-Me)

Feel free to reach out with questions, feedback, or collaboration ideas!

---

## License

This project is licensed under the [MIT License](LICENSE).

---

