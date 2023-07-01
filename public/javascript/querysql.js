app.get('/item/:id', (req, res) => {
    const itemId = req.params.id;
  
    connection.query('SELECT * FROM livro WHERE id = ?', itemId, (err, results) => {
      if (err) throw err;
  
      if (results.length > 0) {
        const item = results[0];
        res.render('item', { item });
      } else {
        res.send('Item não encontrado!');
      }
    });
  });