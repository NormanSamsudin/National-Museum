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

// activityRouter.get("/api/activity", async (req, res) => {
//   try {
//     const activity = await Activity.find({});
//     return res.status(200).send(activity);
//   } catch (err) {
//     res.status(500).json({ error: err.message });
//   }
// });

// pagination get request
activityRouter.get("/api/activity", async (req, res) => {
  try {
    // Get page and limit from query parameters (defaults to page 1 and 10 items per page)
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;

    // Calculate the skip value for pagination
    const skip = (page - 1) * limit;

    // Fetch the activities with pagination
    const activities = await Activity.find({})
      .skip(skip) // Skip the appropriate number of items
      .limit(limit); // Limit the number of results

    // Get the total number of documents
    const total = await Activity.countDocuments();

    // Return the paginated results with metadata
    return res.status(200).json({
      activities,
      currentPage: page,
      totalPages: Math.ceil(total / limit),
      totalItems: total,
    });
  } catch (err) {
    return res.status(500).json({ error: err.message });
  }
});

module.exports = trainRouter;
