const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
  fullName: {
    type: String,
    required: true,
    trim: true,
  },

  email: {
    type: String,
    required: true,
    trim: true,
    unique: true,
    lowercase: true,
    validate: {
      validator: (value) => {
        const result = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
        return result.test(value);
      },
      message: "Please enter a valid email address",
    },
  },

  password: {
    type: String,
    required: true,
    minlength: 8,
    validate: {
      validator: (value) => {
        return value.length >= 8;
      },
      message: "Password at least 8 characters long",
    },
  },
});

const User = mongoose.model("Users", userSchema);

module.exports = User;
