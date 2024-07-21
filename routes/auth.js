const express = require("express");
const User = require("../models/user")


const router = new express.Router();
/** POST /login - login: {username, password} => {token}
 *
 * Make sure to update their last-login!
 *
 **/

/** POST /register - register user: registers, logs in, and returns token.
 *
 * {username, password, first_name, last_name, phone} => {token}.
 *
 *  Make sure to update their last-login!
 */

router.post("/register", async function (req, res, next) {
    try {
        const user = await User.register(req.body);
        return res.json(user);
    } catch (err) {
        return next(err);
    }
});

module.exports = router
