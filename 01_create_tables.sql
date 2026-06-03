CREATE DATABASE IF NOT EXISTS stock_dashboard;
USE stock_dashboard;

CREATE TABLE stock_prices (
  trade_date   DATE,
  ticker       VARCHAR(15),
  company_name VARCHAR(120),
  sector       VARCHAR(80),
  industry     VARCHAR(100),
  open_price   DECIMAL(14,6),
  high_price   DECIMAL(14,6),
  low_price    DECIMAL(14,6),
  close_price  DECIMAL(14,6),
  adj_close    DECIMAL(14,6),
  volume       BIGINT,
  price_range  DECIMAL(14,6),
  price_change DECIMAL(14,6),
  candle_type  VARCHAR(10),
  daily_return DECIMAL(10,4)
);

DESCRIBE stock_prices;
