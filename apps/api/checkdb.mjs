import pg from 'pg';
const p = new pg.Pool({ connectionString: 'postgresql://apexadmin:apexdev_local_2026@localhost:5434/apexdev' });
try {
  const r = await p.query("SELECT code, status, ai_validation_score, substring(title,1,60) as t FROM issues ORDER BY created_at DESC LIMIT 30");
  console.log('TOTAL:', r.rowCount);
  r.rows.forEach(x => console.log(`${x.code} | ${x.status} | ${x.ai_validation_score} | ${x.t}`));
  console.log('\n--- BY STATUS ---');
  const s = await p.query("SELECT status, COUNT(*) FROM issues GROUP BY status ORDER BY status");
  s.rows.forEach(x => console.log(`${x.status}: ${x.count}`));
} catch(e) { console.error('ERR:', e.message); }
await p.end();
