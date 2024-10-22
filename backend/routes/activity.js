const express = require("express");
const Activity = require("../models/activity");

const activityRouter = express.Router();

activityRouter.post("/api/activity", async (req, res) => {
  try {
    const { type, title, timestamp, location, slot, imgUrl} = req.body;

    // Validate required fields
    if (!type || !title || !location || !slot || !imgUrl) {
      return res.status(400).json({ message: "All fields are required" });
    }

    // Check if the type is valid
    const validtypes = [
      "In-reach programme",
      "Art Bazaar",
      "Guided Tour",
    ];
    if (!validtypes.includes(type)) {
      return res.status(400).json({ message: "Invalid activity type" });
    }

    // Create a new activity
    const newActivity = new Activity({
      type,
      title,
      timestamp: new Date(timestamp),
      location,
      slot,
      imgUrl,
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
// activityRouter.get("/api/activity", async (req, res) => {
//   try {
//     // Get page and limit from query parameters (defaults to page 1 and 10 items per page)
//     const page = parseInt(req.query.page) || 1;
//     const limit = parseInt(req.query.limit) || 10;

//     // Calculate the skip value for pagination
//     const skip = (page - 1) * limit;

//     // Fetch the activities with pagination
//     const activities = await Activity.find({})
//       .skip(skip) // Skip the appropriate number of items
//       .limit(limit); // Limit the number of results

//     // Get the total number of documents
//     const total = await Activity.countDocuments();

//     // Return the paginated results with metadata
//     return res.status(200).json({
//       activities,
//       currentPage: page,
//       totalPages: Math.ceil(total / limit),
//       totalItems: total,
//     });
//   } catch (err) {
//     return res.status(500).json({ error: err.message });
//   }
// });

// pagination and search query
// example : GET /api/activity?search=tour&page=1&limit=5
activityRouter.get("/api/activity", async (req, res) => {
  try {
    // Get search, page, and limit from query parameters (default to empty search, page 1, and 10 items per page)
    const search = req.query.search || "";
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 5;

    // Calculate the skip value for pagination
    const skip = (page - 1) * limit;

    // Create a query object to handle search
    const searchQuery = {
      $or: [
        { title: { $regex: search, $options: "i" } }, // Search in the title (case-insensitive)
        { type: { $regex: search, $options: "i" } }, // Search in type (case-insensitive)
        { location: { $regex: search, $options: "i" } }, // Search in location (case-insensitive)
      ],
    };

    // Fetch the activities based on search query and pagination
    const activities = await Activity.find(searchQuery)
      .skip(skip)
      .limit(limit);

    // Get the total number of documents matching the search query
    const total = await Activity.countDocuments(searchQuery);

    // Return the paginated and searched results with metadata
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

module.exports = activityRouter;
