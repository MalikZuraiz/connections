# 💑 Connection App

## 🚀 Project Overview
A Flutter mobile application that fetches and displays random user profiles with infinite scrolling, utilizing the RandomUser API for dynamic content generation.

## ✨ Features
- Infinite scrolling user profile list
- Fetch random user data from RandomUser API
- Cached network images
- Formatted date and time display
- Responsive UI design

## 🔧 Technologies Used
- **Framework**: Flutter
- **State Management**: GetX
- **HTTP Requests**: Dio
- **Image Caching**: CachedNetworkImage
- **Date Formatting**: Intl package

![App Screenshot](/Screenshot.png)

## 🏗️ Project Structure
- `DateItem`: Data model for user profiles
- `DateController`: Manages state and API fetching
- `DateListView`: Renders user profile list
- `KeepAliveWidget`: Preserves list item state during scrolling

## 🛠️ Setup Instructions
```bash
git clone <repository-url>
cd dating-app
flutter pub get
flutter run
```

## 📦 Dependencies
- dio: ^5.0.0
- get: ^4.6.5
- cached_network_image: ^3.2.3
- intl: ^0.18.0

## 🌟 API Integration
Uses RandomUser API for generating mock dating profiles with:
- Name
- Age
- Contact information
- Location details
- Profile picture

## 🖼️ UI Components
- Infinite scrolling ListView
- Card-based profile display
- Circular avatar images
- Action buttons for calling/messaging

## 📱 Functionality
- Dynamically load 10 profiles per API request
- Scroll-triggered pagination
- Loading indicator during data fetch

## 📧 Contact Zuraiz Nayyar 
- Email: malikzuraiz1214@gmail.com
- LinkedIn: [Zuraiz Nayyar](https://www.linkedin.com/in/malik-zuraiz-nayyar-3815a8227/)
- GitHub: [MalikZuraiz](https://github.com/MalikZuraiz)
