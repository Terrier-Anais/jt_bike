import express from 'express';

export const app = express();

app.get('/', (req, res) => {
     res.send('Hello World!')
});

const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`🚀 Server listening at http://localhost:${port}`);
});