# Union Shop – Flutter E-Commerce Application

A comprehensive Flutter e-commerce application for a university union shop, featuring product browsing, shopping cart management, user authentication, and personalized merchandise services.

**Repository:** [github.com/OmerJT/union_shop](https://github.com/OmerJT/union_shop)

## Overview

Union Shop is a full-featured Flutter application that provides a modern e-commerce experience for a university students' union merchandise store. The application includes a responsive product catalog, shopping cart functionality, user authentication, and a specialized print personalization service for custom merchandise.

## Features

### Core E-Commerce Features
- **Homepage** – Featured products showcase and hero banner
- **Product Catalog** – Browse products with detailed product pages
- **Shopping Cart** – Full cart management with add, remove, and quantity updates
- **Collections** – Browse products organized by collections
- **Sales Page** – Special offers and discounted items
- **Search** – Search functionality to find products

### User Account Management
- **Authentication** – User registration and sign-in
- **Account Page** – View and manage user account details
- **Persistent Sessions** – Remember user login state

### Additional Features
- **Print Shack Service** – Personalize merchandise with custom text
  - One or two lines of personalization
  - Live preview of text on garments
  - Quantity selection and pricing
- **About Us Page** – Company information and mission statement
- **Footer** – Navigation links and newsletter subscription
- **Responsive Design** – Optimized for mobile and desktop devices

## Project Structure

```
union_shop/
├── lib/
│   ├── main.dart                      # Main application and home screen
│   ├── product_page.dart              # Product detail page
│   ├── about_us_page.dart             # Company information
│   ├── collections_page.dart          # Product collections/categories
│   ├── sale_page.dart                 # Sale and discount items
│   ├── search_page.dart               # Product search functionality
│   │
│   ├── cart_page.dart                 # Shopping cart display
│   ├── cart_model.dart                # Cart state management (singleton)
│   │
│   ├── auth_page.dart                 # Sign in and registration
│   ├── auth_model.dart                # Authentication logic
│   ├── account_page.dart              # User account details
│   │
│   ├── print_shack_about_page.dart    # Print service overview
│   ├── print_personalisation_page.dart # Custom text personalization
│   │
│   ├── shop_data.dart                 # Product data model
│   ├── union_footer.dart              # Footer component
│   │
│   └── ...
├── test/
│   ├── home_test.dart                 # Homepage widget tests
│   ├── product_test.dart              # Product page tests
│   ├── cart_page_test.dart            # Cart functionality tests
│   ├── cart_test.dart                 # Cart model unit tests
│   ├── auth_test.dart                 # Authentication page tests
│   ├── print_shack_test.dart          # Print service tests
│   │
│   └── ...
├── pubspec.yaml                       # Project dependencies
└── README.md                          # This file
```

## Navigation Structure

The application uses named routes for navigation:

| Route | Page | Description |
|-------|------|-------------|
| `/` | HomeScreen | Main homepage with featured products |
| `/product` | ProductPage | Single product detail view |
| `/about` | AboutUsPage | About us and company information |
| `/collections` | CollectionsPage | Product categories and collections |
| `/sale` | SalePage | Sale items with discounts |
| `/search` | SearchPage | Product search interface |
| `/cart` | CartPage | Shopping cart |
| `/auth` | AuthPage | Sign in and registration |
| `/account` | AccountPage | User account management |
| `/print-shack` | PrintShackAboutPage | Print service overview |
| `/print-personalisation` | PrintPersonalisationPage | Custom text personalization |

## Key Components

### State Management
- **CartModel**: Singleton pattern for cart state management
  - Add/remove items
  - Update quantities
  - Calculate totals
  
- **AuthModel**: Authentication state management
  - User registration
  - Sign in/sign out
  - Session management

### Data Models
- **Product**: Product information (name, price, image, description)
- **CartItem**: Shopping cart line item with options (color, size, quantity)
- **User**: User account data (name, email, authentication)

### UI Components
- **UnionFooter**: Reusable footer with links and newsletter signup
- **_CartItemRow**: Shopping cart item display component
- **Responsive layouts**: Mobile and desktop optimized views

## Getting Started

### Prerequisites
- Flutter SDK (2.17.0 or higher)
- Dart SDK (included with Flutter)
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd union_shop
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

   Or for web:
   ```bash
   flutter run -d chrome
   ```

### Running Tests

Run all tests:
```bash
flutter test
```

Run specific test file:
```bash
flutter test test/home_test.dart
```

Run tests with coverage:
```bash
flutter test --coverage
```

## Features in Detail

### Shopping Cart
The cart uses a singleton `CartModel` to maintain state across the application. Users can:
- Add products with options (color, size, quantity)
- Update item quantities
- Remove items from cart
- View cart totals
- Place orders (demo mode)

### User Authentication
- Users can sign up with name, email, and password
- Existing users can sign in
- Account page displays user details
- Authenticated state is maintained during the session

### Print Shack Service
The personalization feature allows users to:
- Choose between one or two lines of text
- Preview text on a garment mockup
- Set custom text (up to 10 characters per line)
- Select quantity
- See real-time pricing based on personalization options
  - One line: £3.00
  - Two lines: £5.00

### Responsive Design
The application automatically adjusts layout based on screen width:
- **Mobile view**: Column layout for narrower screens
- **Desktop view**: Row/grid layout for wider screens (>600px/700px/800px depending on page)

## Testing

The project includes comprehensive widget and unit tests:

- **Widget Tests**: UI interaction and rendering tests
  - Homepage layout and elements
  - Product page functionality
  - Cart operations
  - Authentication flow
  - Print personalization

- **Unit Tests**: Business logic tests
  - Cart model operations
  - Calculations and totals
  - Item management

### Test Results
All tests are currently passing:
- 19 tests passing
- Tests cover all major features and user flows

## Design System

### Color Scheme
- **Primary Color**: `#4d2963` (Deep Purple)
- **Accent Color**: Used throughout for buttons and highlights
- **Text Colors**: Black87 for headings, Grey for secondary text

### Typography
- **Headings**: Bold, 28px-32px for page titles
- **Section Headers**: Semi-bold, 18px-20px
- **Body Text**: Regular, 14px-16px
- **Small Text**: 12px-13px for captions and secondary info

### Spacing & Layout
- Standard padding: 24px
- Column/row gaps: 12px-16px
- Cards and sections: 40px padding

## Code Quality

### Testing Coverage
- Widget tests for all major pages
- Unit tests for models and business logic
- Test organization by feature/page

### Best Practices
- Responsive UI patterns
- Error handling for network requests
- Image error fallbacks
- Proper state management
- Clear component separation

## File Organization

### Models (`*_model.dart`)
- `cart_model.dart` – Shopping cart state and logic
- `auth_model.dart` – User authentication
- `shop_data.dart` – Product data and definitions

### Pages (`*_page.dart`)
- Main pages for each feature
- State management where needed
- Navigation logic

### Components (`union_footer.dart`, etc.)
- Reusable UI components
- Shared styling and functionality

### Tests (`test/`)
- Widget tests for pages
- Unit tests for models
- Test utilities and helpers

## Dependencies

### Core Dependencies
- `flutter`: UI framework
- `cupertino_icons`: Icon library

### Development Dependencies
- `flutter_test`: Widget testing framework
- `flutter_lints`: Code style and quality linting

## Browser Compatibility

The application runs on:
- ✅ Chrome (web)
- ✅ Firefox (web)
- ✅ Safari (web)
- ✅ Android devices
- ✅ iOS devices

## Future Enhancements

Potential improvements and features for future versions:
- Payment integration (Stripe, PayPal)
- Firebase backend for real database
- Order history and tracking
- Wishlist functionality
- Product reviews and ratings
- Admin dashboard for product management
- Email notifications
- Inventory management
- Multiple currency support
- Internationalization (i18n)

## Troubleshooting

### Build Issues
- Clear flutter cache: `flutter clean`
- Reinstall dependencies: `flutter pub get`
- Rebuild: `flutter run`

### Test Failures
- Ensure all dependencies are installed: `flutter pub get`
- Run single test for debugging: `flutter test test/home_test.dart -v`
- Check that image URLs are accessible (test environment returns 400 for network requests)

### Network Issues
- The app includes error handling for network failures
- Image loading has fallback widgets for failed requests
- Use `Image.network(..., errorBuilder: ...)` pattern throughout

## Contributing

When contributing to this project:
1. Follow the existing code structure and naming conventions
2. Write tests for new features
3. Ensure all tests pass: `flutter test`
4. Use meaningful commit messages
5. Keep pages/features in separate files

## License

This project is part of the University of Portsmouth coursework for Programming Applications and User Experience Design modules.

## Support

For issues or questions:
1. Check existing tests for usage examples
2. Review page implementations for patterns
3. Refer to Flutter documentation: https://flutter.dev/docs

---

**Developer:** [OmerJT](https://github.com/OmerJT)  
**Repository:** [github.com/OmerJT/union_shop](https://github.com/OmerJT/union_shop)  
**Last Updated:** December 2, 2025  
**Status:** All tests passing ✓  
**Flutter Version:** 2.17.0+
