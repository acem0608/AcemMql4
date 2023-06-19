//+------------------------------------------------------------------+
//|                                            SynchronizeCharts.mq4 |
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
   
//---
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
      if ( id == CHARTEVENT_CHART_CHANGE) {
         if (ChartGetInteger(ChartID(), CHART_BRING_TO_TOP)) {
            long activeId = ChartID();
            int      window_no;
            datetime get_time;
            double   get_price; 
            
            ChartXYToTimePrice(0,0,0,window_no,get_time,get_price);
            long shift = iBarShift(0,0, get_time, true);
            shift = shift - WindowBarsPerChart();
            datetime targetTime = iTime(NULL, 0, shift);
            if (shift > 0) {
               long targetId;
               for (targetId = ChartFirst();targetId != -1; targetId = ChartNext(targetId)) {
                  if (targetId != activeId) {
                     // 
                     
                     string targetSymbol = ChartSymbol(targetId);
                     ENUM_TIMEFRAMES targetPeriod = ChartPeriod(targetId);
                     int target_shift = iBarShift(targetSymbol, targetPeriod, targetTime);
                     ChartNavigate(targetId, CHART_END, -target_shift);
                     //Comment(TimeToStr(targetTime) + " : "  + targetSymbol+ ":" + IntegerToString(targetPeriod) + " :" + target_shift);
                  }
               }
            }
         } else {
            //Comment("other move");
         }
      }
  }
//+------------------------------------------------------------------+
