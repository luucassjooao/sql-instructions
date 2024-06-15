import { startTx } from "./db/startTx.js";

startTx(async (tx, createSavePoint) => {
  await tx.query(
    'INSERT INTO customers (first_name, last_name) VALUES($1, $2)',
    ['Joao', 'Lucas']
  );

  await tx.query(`UPDATE back_accounts SET balance = balance - 10 WHERE user_id = 1;`);

  await createSavePoint('sp_01', async () => {
    await tx.query(`UPDATE back_accounts SET balance = balance - 10 WHERE user_id = 2;`);
    await tx.query(`UPDATE back_accounts SET balance = balance + 10 WHERE user_id = 1;`);
  })
})
