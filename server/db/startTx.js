import { client } from "./client.js";

export async function startTx(cb) {
  async function createSavePoint(spName, spCb) {
    try {
      await client.query(`SAVEPOINT ${spName}`)
    
      await spCb();
    } catch {
      await client.query(`ROLLBACK TO SAVEPOINT ${spName}`)
    }
  }

  try {
    await client.query(`BEGIN`);

    await cb(client, createSavePoint);
  
    await client.query('COMMIT');
  }catch(erro) {
    await client.query('ROLLBACK');
  
    console.log(erro)
  } finally {
    await client.end();
  }
}