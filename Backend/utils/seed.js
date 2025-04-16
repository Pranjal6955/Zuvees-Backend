const mongoose = require('mongoose');
const dotenv = require('dotenv');
const Product = require('../models/Product');
const ApprovedEmail = require('../models/ApprovedEmail');

// Load environment variables
dotenv.config();

// Sample products data
const products = [
  {
    title: 'Split AC 1.5 Ton',
    description: 'Energy efficient split AC with advanced cooling technology',
    price: 35999.99,
    image: 'https://example.com/images/split-ac.jpg',
    sizes: ['1 Ton', '1.5 Ton', '2 Ton'],
    colors: ['White', 'Silver'],
    available_quantity: 50
  },
  {
    title: 'Window AC 1 Ton',
    description: 'Compact window AC perfect for small rooms',
    price: 25999.99,
    image: 'https://example.com/images/window-ac.jpg',
    sizes: ['0.75 Ton', '1 Ton', '1.5 Ton'],
    colors: ['White'],
    available_quantity: 40
  },
  {
    title: 'Ceiling Fan',
    description: 'High-speed ceiling fan with decorative design',
    price: 2499.99,
    image: 'https://example.com/images/ceiling-fan.jpg',
    sizes: ['48 inch', '56 inch'],
    colors: ['Brown', 'White', 'Ivory'],
    available_quantity: 100
  }
];

// Approved emails for testing
const approvedEmails = [
  { email: 'admin@example.com' },
  { email: 'rider1@example.com' },
  { email: 'rider2@example.com' },
  { email: 'customer@example.com' }
];

// Function to reset collections and seed data
const seedData = async () => {
  try {
    // Connect to MongoDB
    await mongoose.connect(process.env.MONGO_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      serverSelectionTimeoutMS: 15000
    });

    console.log('MongoDB Connected');

    // Clear existing data
    await Product.deleteMany({});
    await ApprovedEmail.deleteMany({});

    console.log('Data cleared');

    // Seed products
    await Product.insertMany(products);
    console.log(`${products.length} products seeded`);

    // Seed approved emails
    await ApprovedEmail.insertMany(approvedEmails);
    console.log(`${approvedEmails.length} approved emails seeded`);

    console.log('Data seeding complete!');
    process.exit(0);
  } catch (error) {
    console.error('Error seeding data:', error);
    process.exit(1);
  }
};

// Run the seeding function
seedData();
