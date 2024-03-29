//+------------------------------------------------------------------+
//|                                                IndicatorTest.mq4 |
//|                                         Copyright 2023, Acem0608 |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Acem0608"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   //ChartSetSymbolPeriod(0, "EURUSD.oj5k", PERIOD_H4);
//---
    int objNum = ObjectsTotal(ChartID());
    Print("チャートID：" + ChartID());
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
/*
   switch (id) {
   case CHARTEVENT_KEYDOWN:
      Print("CHARTEVENT_KEYDOWN");
      break;
   case CHARTEVENT_KEYDOWN:
      Print("CHARTEVENT_KEYDOWN");
      break;
   case CHARTEVENT_KEYDOWN:
      Print("CHARTEVENT_KEYDOWN");
      break;
   case CHARTEVENT_KEYDOWN:
      Print("CHARTEVENT_KEYDOWN");
      break;
   default:
      Print("default");
      break;
     }
     */
  }
//+------------------------------------------------------------------+
