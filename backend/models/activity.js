const mongoose = require("mongoose");

const activitySchema = new mongoose.Schema({
  type: {
    type: String,
    enum: ["In-reach programme", "Art Bazaar", "Guided Tour"],
    required: true,
  },
  title: {
    type: String,
    required: true,
  },
  startDateTime: {
    type: Date,
    required: true,
    default: Date.now,
  },
  location: {
    type: String,
    required: true,
  },
  slot: {
    type: String,
    required: true,
  },
  imgUrl: {
    type: String,
    required: true,
  },
});

// Create a model from the schema
const Activity = mongoose.model("Activity", activitySchema);

module.exports = Activity;
