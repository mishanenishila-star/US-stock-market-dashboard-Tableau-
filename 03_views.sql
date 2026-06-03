CREATE OR REPLACE VIEW vw_stocks AS
SELECT
  trade_date, ticker, company_name,
  sector, industry,
  open_price, high_price, low_price,
  close_price, adj_close, volume,
  price_range, price_change,
  candle_type, daily_return,
  YEAR(trade_date)                AS yr,
  QUARTER(trade_date)             AS qtr,
  MONTH(trade_date)               AS mth,
  MONTHNAME(trade_date)           AS month_name,
  DAYNAME(trade_date)             AS day_name,
  CONCAT('Q',QUARTER(trade_date)) AS quarter_label
FROM stock_prices
WHERE close_price > 0
  AND trade_date IS NOT NULL;

-- Final check
SELECT COUNT(*)             FROM vw_stocks;
SELECT candle_type,COUNT(*) FROM vw_stocks GROUP BY candle_type;
SELECT sector, COUNT(*) cnt FROM vw_stocks
  GROUP BY sector ORDER BY cnt DESC LIMIT 10;
