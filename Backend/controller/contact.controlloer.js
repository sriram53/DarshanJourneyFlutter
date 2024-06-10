const dbConfig= require("../database/config");

//Delete  ContactUS
exports.deleteContactUs = (req, res) => {
    try {
      dbConfig.query(
        `DELETE FROM contactus WHERE id = "${req.params.id}";`,
        (err, rows, fields) => {
          if (!err) res.send(rows);
          else console.log(err);
        }
      );
    } catch (e) {
      throw e;
    }
  };
  
  //Get all ContactUS
  exports.getAllContact = (req, res) => {
    try {
      dbConfig.query(`SELECT * FROM contactus;`, (err, rows, fields) => {
        if (!err) res.send(rows);
        else console.log(err);
      });
    } catch (e) {
      throw e;
    }
  };

  //Create Contact
exports.createContact = (req, res) => {
    var first_name = req.body.first_name;
    var second_name = req.body.second_name;
    var temple_name = req.body.temple_name;
    var email_id = req.body.email_id;
    var anything_else = req.body.anything_else;
    var phone_number = req.body.phone_number;
    var is_active = req.body.is_active;
    try {
      dbConfig.query(
        `INSERT INTO contactus
          (first_name,second_name,temple_name,
            email_id,anything_else,phone_number,
            is_active)
          VALUES
          ("${first_name}","${second_name}","${temple_name}",
          "${email_id}","${anything_else}","${phone_number}",
          "${is_active}");`,
        (err, rows, fields) => {
          if (!err) res.send(rows);
          else console.log(err);
        }
      );
    } catch (e) {
      throw e;
    }
  };