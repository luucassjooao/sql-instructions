import { startTx } from "./db/startTx.js";

// Race Condition logic
startTx(async (tx) => {
  await tx.query('SET TRANSACTION ISOLATION LEVEL SERIALIZABLE')

  // Pessimist locking
  const {rows: [row]} = await tx.query('SELECT quantity FROM products WHERE id = 1 FOR UPDATE');

  if(row.quantity < 1) {
    throw new Error('Not enough products');
  }

  await tx.query('UPDATE products SET quantity = quantity -1 WHERE id = 1')
  
})
