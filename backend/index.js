const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const activityRouter = require("./routes/activity");

const PORT = 3000;

const app = express();

const DB =
  "mongodb://127.0.0.1:27017/museum?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.0.0";

app.use(express.json({ limit: "10kb" }));

app.use("/public", express.static("public"));

//middleware to register route
app.use(authRouter);
app.use(activityRouter);

mongoose
  .connect(DB, {})
  .then(() => {
    console.log("DB Connected...");
  })
  .catch((err) => console.log("DB LOCAL ERROR:", err));

app.listen(PORT, function() {
  console.log(`Server is running on port ${PORT}`);
});
