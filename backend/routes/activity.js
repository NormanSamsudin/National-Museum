const express = require("express");
const Activity = require("../models/activity");

const activityRouter = express.Router();

activityRouter.post("/api/activity", async (req, res) => {
  try {
    const { activityType, title, timestamp, location, slot } = req.body;

    // Validate required fields
    if (!activityType || !title || !location || !slot) {
      return res.status(400).json({ message: "All fields are required" });
    }

    // Check if the activityType is valid
    const validActivityTypes = [
      "In-reach programme",
      "Art Bazaar",
      "Guided Tour",
    ];
    if (!validActivityTypes.includes(activityType)) {
      return res.status(400).json({ message: "Invalid activity type" });
    }

    // Create a new activity
    const newActivity = new Activity({
      activityType,
      title,
      timestamp: new Date(timestamp),
      location,
      slot,
    });

    // Save the new activity to the database
    await newActivity.save();

    return res
      .status(201)
      .json({ message: "Activity added successfully", activity: newActivity });
  } catch (error) {
    return res
      .status(500)
      .json({ message: "Server error", error: error.message });
  }
});

activityRouter.get("/api/activity", async (req, res) => {
  try {
    const activity = await Activity.find({});
    return res.status(200).send(activity);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = trainRouter;
