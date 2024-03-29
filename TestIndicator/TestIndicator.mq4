//+------------------------------------------------------------------+
//|                                                TestIndicator.mq4 |
//|                                         Copyright 2023, Acem0608 |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property strict

#include <ChartObjects\ChartObjectsLines.mqh>
  CChartObjectVLine* pVline;
  int objectNum;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
         int      window_no;
         datetime get_time;
         double   get_price; 
      datetime time1 = StringToTime("2023.05.23 01:00");
  //ObjectCreate(ChartID(), "VLINE_TEST", OBJ_VLINE, 0, time1, 0);
  pVline = new CChartObjectVLine();
//  bool retc = pVline.Create(ChartID(), "VINE_TEST" + objectNum++, 0, time1);
  Print("OnInit");
   //Print(TimeToStr(vline.CreateTime()));
   ChartSetInteger(ChartID(), CHART_EVENT_MOUSE_MOVE, true);
   ChartSetInteger(ChartID(), CHART_EVENT_OBJECT_CREATE, true);

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
/*
      if (id == CHARTEVENT_MOUSE_MOVE) {
         datetime time;
         double price = 0.0;
         int sub;
         int      window_no;
         datetime get_time;
         double   get_price; 
//         if (ChartXYToTimePrice(0,300,250,window_no,get_time,get_price)) {
         if (ChartXYToTimePrice(0,lparam,250,window_no,get_time,get_price)) {
            pVline.SetPoint(0, get_time, get_price);
            //Print(TimeToStr(get_time));
         } else {
            long err = GetLastError();
//            Print("エラー："+err);
         }
      }
      if (id == CHARTEVENT_CLICK) {
         int      window_no;
         datetime get_time;
         double   get_price; 
         if (ChartXYToTimePrice(0,lparam,250,window_no,get_time,get_price)) {
            pVline.SetPoint(0, get_time, get_price);
            pVline = new CChartObjectVLine();
            pVline.Create(ChartID(), "VINE_TEST" + objectNum++, 0, get_time);
         }
      }
*/      
      if (CHARTEVENT_OBJECT_CREATE) {
          if (StringFind(sparam, "ACEM ") < 0 && StringFind(sparam, "PD_") < 0) {
              string newObjName = sparam + " ACEM " + IntegerToString(ChartID());
              ObjectSetString(ChartID(), sparam, OBJPROP_NAME, newObjName);
          }
      }
  }
//+------------------------------------------------------------------+
