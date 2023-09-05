const express = require('express')
const app = express()
const port = 3000

// https://www.youtube.com/watch?v=2ojkb44XObc

app.get('/', function(req, res) {
    res.send('Hello World!')
})

app.get('/alien', function(req, res) {
    const id = req.query.id
    res.send('Welcome back Faisal ' + id)
})

app.get('/alien/:id', function(req, res) {
    const id = req.params.id
    res.send('hey Faisal ' + id )
})

// app.get('/', (req, res) => res.send('Hello World!'))
app.listen(port, () => console.log(`Example app listening on port ${port}!`))
