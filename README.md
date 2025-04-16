# Zuvees-Backend

A robust e-commerce backend service built with Node.js and Express, providing comprehensive API endpoints for multiple user roles:

- **Customers**: Browse products, manage orders, and handle payments
- **Administrators**: Manage inventory, users, and overall platform
- **Riders**: Handle order deliveries and logistics

The service implements secure authentication, real-time order tracking, and scalable database operations with MongoDB.

## Tech Stack

- Node.js & Express.js
- MongoDB with Mongoose
- REST API Architecture

## Prerequisites

- Node.js (v18 or higher)
- npm or yarn
- MongoDB

## Quick Start

1. Clone and install:
```bash
# Clone the repository
git clone https://github.com/username/Zuvees-Backend.git

# Navigate to project directory
cd Zuvees-Backend

# Install all dependencies
npm install


2. Environment setup:
```bash
cp .env.example .env
# Edit .env with your configurations
```

3. Start development server:
```bash
npm run dev     # Development mode
npm run start   # Production mode
```

4. Load sample data (optional):
```bash
npm run seed
```

## API Routes

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET    | /api/v1/health | Health check |
| POST   | /api/v1/auth/login | User login |
| POST   | /api/v1/auth/register | User registration |
| GET    | /api/v1/users | Get users list |

Full API documentation available at `/api-docs`

## Docker Support

```bash
# Build image
docker build -t zuvees-backend .

# Run container
docker run -p 3000:3000 zuvees-backend
```

## Project Structure

```
src/
├── config/         # Configuration files
├── controllers/    # Request handlers
├── models/         # Database models
├── routes/         # API routes
├── middleware/     # Custom middleware
├── utils/         # Utility functions
└── server.js      # App entry point
```

## Development

```bash
npm run dev         # Start development server
npm run test        # Run tests
npm run lint        # Run linter
npm run build      # Build for production
```

## Contributing

1. Fork repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## License

MIT License - see [LICENSE](LICENSE) for details