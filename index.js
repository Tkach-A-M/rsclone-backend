const express = require('express');

const PORT = process.env.PORT || 8080;

const app = express();

app.use(express.json());


// catch 404 and forward to error handler
app.use(function(req, res, next) {
    res.json({
        statusCode: 404,
        errorText: 'Page Not Found'
    });
});

// error handler
app.use(function(err, req, res, next) {
    res.json({
        statusCode: 500,
        message: err.message,
        stack: err.stack
    });
});

app.listen(PORT, ()=> console.log(`server start on port ${PORT}`));