const express = require("express");
const Admin = express.Router();
const dbConfig = require("../database/config");
const cors = require("cors");
const jwt = require("jsonwebtoken");

const bcrypt = require("bcryptjs");

const admin = require("../model/users.model");
const user_controller = require("../controller/users.controller");

Admin.use(cors());

process.env.SECRET_KEY = "secret";
Admin.post("/register", (req, res) => {
  console.log("userbody", req.body);
  const UserData = {
    role_id: req.body.role_id,
    role_name: req.body.role_name,
    user_name: req.body.user_name,
    email: req.body.email,
    phone_number: req.body.phone_number,
    password: req.body.password,
    country_id: req.body.country_id,
    state_id: req.body.state_id,
    district_id: req.body.district_id,
    city_id: req.body.city_id,
    kuladeivam: req.body.kuladeivam,
    fav_god: req.body.fav_god,
    is_active: req.body.is_active,
  };

  admin
    .findOne({
      where: {
        phone_number: UserData.phone_number,
      },
    })
    .then(Admin => {
      if (!Admin) {
        console.log(Admin, "adminline-41");
        console.log(UserData, "usersData");
        const hash = bcrypt.hashSync(UserData.password, 10);
        UserData.password = hash;
        admin
          .create(UserData)
          .then(Admin => {
            let token = jwt.sign(Admin.dataValues, process.env.SECRET_KEY, {
              expiresIn: 1440,
            });

            res.json({
              users: Admin,
              token: token,
            });
          })
          .catch(err => {
            console.log("Error on users");
            res.send({ error: +err });
          });
      } else {
        console.log("users already exists");
        res.json({ error: "users already exists" });
      }
    })
    .catch(err => {
      res.send("error: " + err);
    });
});

Admin.post("/login", (req, res) => {
  console.log(req.body.phone_number);
  console.log(req.body.password);

  admin
    .findOne({
      where: {
        phone_number: req.body.phone_number,
      },
    })
    .then(user => {
      if (user) {
        console.log(req.body.password);
        if (bcrypt.compareSync(req.body.password, user.password)) {
          let token = jwt.sign(user.dataValues, process.env.SECRET_KEY, {
            expiresIn: 1440,
          });
          res.json({ user: user, token: token });
          console.log(token);
        } else {
          console.log("Wrong password");
          return res.json({ error1: "Wrong password" });
        }
      } else {
        console.log("User does not exist");
        return res.json({ error: "users does not exist" });
      }
    })
    .catch(err => {
      res.status(400).json({ error: err });
    });
});

Admin.put("/update/:id", (req, res) => {
  console.log(req.params.id);
  var phone_number = req.body.phone_number;
  var password = bcrypt.hashSync(req.body.password, 10);
  var sql = `UPDATE users
  SET
  phone_number = "${phone_number}",
  password = "${password}"
  WHERE user_id = "${req.params.id}";`;
  try {
    dbConfig.query(sql, (err, rows, fields) => {
      if (!err) res.send(rows);
      else console.log(err);
    });
  } catch (e) {
    throw e;
  }
});

//Userlogin
Admin.post("/getTemple", user_controller.templeGetUser);
Admin.get("/getfavgod/:id", user_controller.templefav_god);
Admin.get("/getsingleuser/:id", user_controller.getSingleUser);

//Router export
module.exports = Admin;
