
# 📰 Flutter News App (Cubit Practice)

A minimal yet informative **Flutter + Cubit** news application built as a practice project to explore state management in Flutter using `flutter_bloc`. This app fetches Bangladeshi news sources from the NewsData.io API and displays them in a clean, scrollable list. Users can tap on any source to view a detailed page.

---

## 🧠 What is Cubit?

Cubit is a lightweight state management solution that’s part of the [flutter_bloc](https://pub.dev/packages/flutter_bloc) package. It offers a simpler, event-free way of managing state with minimal boilerplate code.

This app leverages Cubit to manage API loading, error handling, and displaying news data in a reactive UI.

---

## 🖼️ App Preview

> _This app displays a list of news sources from Bangladesh. Each source includes an icon, name, and brief description. Tapping a source navigates to a detailed view with extended information._

---

## 🛠️ Features

- ✅ Clean and responsive UI
- ✅ Built with `flutter_bloc` using Cubit
- ✅ API integration with [NewsData.io](https://newsdata.io/)
- ✅ Realtime UI updates via `BlocBuilder`
- ✅ Card-based list layout
- ✅ Detailed page with structured source info

---

## 📂 Project Structure

```bash
lib/
├── cubit/
│   ├── news_cubit.dart
│   └── news_cubit_state.dart
├── model/
│   └── news_model.dart
├── screens/
│   ├── news_list_page.dart
│   └── news_details_page.dart
└── main.dart
```

---

## 🧩 How It Works

- `NewsCubit` handles loading, error, and success states.
- State classes manage data (`NewsCubitLoading`, `NewsCubitError`, `NewsCubitDataLoaded`).
- The `ListView` UI displays each news source as a card.
- Clicking a source navigates to `NewsDetailsPage` showing rich details with image, description, and metadata.

---

## 🚀 Getting Started

To run this project locally:

1. **Clone the repository**
   ```bash
   git clone https://github.com/alamincse6615/flutter_news_app_with_cubit.git
   ```
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Run the app**
   ```bash
   flutter run
   ```

---

## 🧰 Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [http](https://pub.dev/packages/http)

---

## 👨‍💻 Author

**Md Alamin**  
🔗 [GitHub Profile](https://github.com/alamincse6615)

---

## 🌟 Support

If you liked this project or found it helpful, please consider giving it a ⭐ on GitHub. Your support helps others discover and learn from it too!

---
