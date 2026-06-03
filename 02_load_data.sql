USE stock_dashboard;

LOAD DATA LOCAL INFILE
  'C:/stock_dashboard/data/stocks.csv'
INTO TABLE stock_prices
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@dt, ticker, company_name, sector, industry,
 @op, @hi, @lo, @cl, @ac, volume)
SET
  trade_date   = STR_TO_DATE(@dt,'%m/%d/%Y'),
  open_price   = CAST(@op AS DECIMAL(14,6)),
  high_price   = CAST(@hi AS DECIMAL(14,6)),
  low_price    = CAST(@lo AS DECIMAL(14,6)),
  close_price  = CAST(@cl AS DECIMAL(14,6)),
  adj_close    = CAST(@ac AS DECIMAL(14,6)),
  price_range  = ROUND(CAST(@hi AS DECIMAL(14,6))
               - CAST(@lo AS DECIMAL(14,6)),6),
  price_change = ROUND(CAST(@cl AS DECIMAL(14,6))
               - CAST(@op AS DECIMAL(14,6)),6),
  candle_type  = IF(CAST(@cl AS DECIMAL(14,6))
               >= CAST(@op AS DECIMAL(14,6)),
               'Bullish','Bearish'),
  daily_return = ROUND(
    (CAST(@cl AS DECIMAL(14,6))
   - CAST(@op AS DECIMAL(14,6)))
   / CAST(@op AS DECIMAL(14,6))*100,4);
